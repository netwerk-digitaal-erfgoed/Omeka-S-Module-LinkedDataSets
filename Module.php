<?php

declare(strict_types=1);

namespace LinkedDataSets;

use Laminas\ServiceManager\ServiceLocatorInterface;
use Omeka\Job\Dispatcher;
use Omeka\Module\AbstractModule;
use Omeka\Module\Exception\ModuleCannotInstallException;
use Omeka\Module\Module as DefaultModule;
use Omeka\Stdlib\Message;
use Omeka\Api\Exception\ValidationException;
use Laminas\Config\Reader\Json as JsonReader;

final class Module extends AbstractModule
{
    private ?Dispatcher $dispatcher = null;
    private $api = null;
    private JsonReader $jsonReader;
    private array $config;

    public function __construct()
    {
        $this->config = $this->getConfig();
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
    }

    public function install(ServiceLocatorInterface $serviceLocator)
    {
        $this->checkPrerequisites($serviceLocator);
        $this->createFoldersIfTheyDontExist();
//        $this->installSchemaOrgVocabulary($serviceLocator);
//        $this->installCustomVocabularies();
//        $this->installTemplates();
    }

    protected function checkPrerequisites(ServiceLocatorInterface $serviceLocator): void
    {
        $modules = $this->config['dependencies']['modules'];
        /* @var DefaultModule $module */
        foreach ($this->config['dependencies']['modules'] as $moduleDependency) {
            $module = $serviceLocator->get('Omeka\ModuleManager')
                ->getModule($moduleDependency['name'])
            ;

            if ($module && version_compare($module->getIni('version') ?? '', $moduleDependency['version'], '<')) {
                $translator = $serviceLocator->get('MvcTranslator');
                $message = new Message(
                    $translator->translate('This module requires the module "%s", version %s or above.'), // @translate
                    $moduleDependency['name'], $moduleDependency['version']
                );
                throw new ModuleCannotInstallException((string) $message);
            }

            if ($module->getState() !== 'active') {
                $translator = $serviceLocator->get('MvcTranslator');
                $message = new Message(
                    $translator->translate('The "%s" module must be active'), // @translate
                    $moduleDependency['name']
                );
                throw new ModuleCannotInstallException((string) $message);
            }
        }
    }

    protected function createFoldersIfTheyDontExist(): void
    {
        foreach ($this->config['folders'] as $folder) {
            $this->checkFolder($folder['path']);
        }
    }

    protected function checkFolder($folderName): void
    {
        $folderPath = OMEKA_PATH . '/' . $folderName;

        if (!is_dir($folderPath)) {
            mkdir($folderPath, 0755, true);
            return;
        }

        // If the directory exists, check if it is writable
        if (!is_writable($folderPath)) {
            $message = sprintf('Directory %s exists, but is not writable. 
            Please make sure it is writable', $folderName);
            throw new ModuleCannotInstallException((string) $message);
        }
    }

    protected function installSchemaOrgVocabulary(ServiceLocatorInterface $serviceLocator): void
    {
        $rdfImporter = $serviceLocator->get('Omeka\RdfImporter');
        $strategy = 'file';

        $options = [
            'format' => 'rdfxml',
            'lang' => '',
            'label_property' => null,
            'comment_property' => null,
            'file' => OMEKA_PATH . 'modules/LinkedDataSets/asset/vocabularies/schema.org.rdf',
        ];

        $vocabularyInfo = [
            'o:label' => 'Schema.org',
            'o:comment' => '',
            'o:namespace_uri' => 'https://schema.org/',
            'o:prefix' => 'schema',
        ];

        try {
            $rdfImporter->import($strategy, $vocabularyInfo, $options);
        } catch (ValidationException $e) {
            $message = 'The vocabulary Schema.org is possibly already installed. What to do?';
            throw new ModuleCannotInstallException((string) $message);
        }
    }
}
