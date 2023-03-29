<?php

declare(strict_types=1);

namespace LinkedDataSets;

use Laminas\ServiceManager\ServiceLocatorInterface;
use Omeka\Module\AbstractModule;
use Omeka\Module\Exception\ModuleCannotInstallException;
use Omeka\Module\Module as DefaultModule;
use Omeka\Stdlib\Message;
use Omeka\Api\Exception\ValidationException;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;

final class Module extends AbstractModule
{
    private const MODULE_DEPENDENCIES = [
        ['name' => 'CustomVocab', 'version' => '1.7.1'],
        ['name' => 'AdvancedResourceTemplate', 'version' => '3.4.4.17'],
    ];

    private const FOLDERS = [
        ['path' => 'files/datacatalogs/'],
        ['path' => 'files/datadumps/'],
    ];

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }


    public function install(ServiceLocatorInterface $serviceLocator)
    {
        $this->checkPrerequisites($serviceLocator);
        $this->createFoldersIfTheyDontExist();
        $this->installSchemaOrgVocabulary($serviceLocator);
        $this->installCustomVocabularies();
        $this->installTemplates();
    }

    protected function checkPrerequisites(ServiceLocatorInterface $serviceLocator): void
    {
        /** @var DefaultModule $module */
        foreach (self::MODULE_DEPENDENCIES as $moduleDependency) {
            $module = $serviceLocator->get('Omeka\ModuleManager')
                ->getModule($moduleDependency['name'])
            ;

            if ($module && version_compare($module->getIni('version') ?? '', $moduleDependency['version'], '<')) {
                $translator = $serviceLocator->get('MvcTranslator');
                $message = new Message(
                    $translator->translate('This module requires the module "%s", version %s or above.'), // @translate
                    $moduleDependency['name'], $moduleDependency['version']
                );
                throw new ModuleCannotInstallException((string)$message);
            }

            if ($module->getState() !== 'active') {
                $translator = $serviceLocator->get('MvcTranslator');
                $message = new Message(
                    $translator->translate('The "%s" module must be active'), // @translate
                    $moduleDependency['name']
                );
                throw new ModuleCannotInstallException((string)$message);
            }
        }
    }

    protected function createFoldersIfTheyDontExist(): void {
        foreach (self::FOLDERS as $folderName) {
            $this->checkFolder($folderName['path']);
        }
    }

    protected function checkFolder($folderName): void
    {
        $rootPath = $_SERVER['DOCUMENT_ROOT'];
        $folderPath = $rootPath . $folderName;

        if (!is_dir($folderPath)) {
            mkdir($folderPath, 0755, true);
            return;
        }

        // If the directory exists, check if it is writable
        if (!is_writable($folderPath)) {
            $message = sprintf('Directory %s exists, but is not writable. 
            Please make sure it is writable',$folderName);
            throw new ModuleCannotInstallException((string)$message);
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
            'file' => $_SERVER['DOCUMENT_ROOT']. 'modules/LinkedDataSets/asset/vocabularies/schema.org.rdf',
        ];

        $vocabularyInfo = [
            'o:label' => 'Schema.org',
            'o:comment' => '',
            'o:namespace_uri' => 'https://schema.org/',
            'o:prefix' => 'schema',
        ];

        try {
            $rdfImporter->import($strategy, $vocabularyInfo, $options);
        } catch(ValidationException $e) {
            $message = 'The vocabulary Schema.org is possibly already installed. What to do?';
            throw new ModuleCannotInstallException((string)$message);
        }
    }
}
