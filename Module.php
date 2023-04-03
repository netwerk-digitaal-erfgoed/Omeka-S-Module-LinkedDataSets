<?php

declare(strict_types=1);

namespace LinkedDataSets;

use BulkExport\Job\Export as JobExport;
use LinkedDataSets\Application\Job\CatalogDumpJob;
use LinkedDataSets\Domain\Job\CreateCatalogDumpJob;
use Laminas\EventManager\Event;
use Laminas\EventManager\SharedEventManagerInterface;
use Laminas\ServiceManager\ServiceLocatorInterface;
use Omeka\Api\Adapter\ItemAdapter;
use Omeka\Api\Manager;
use Omeka\Api\Representation\ItemRepresentation;
use Omeka\Api\Representation\ResourceClassRepresentation;
use Omeka\Api\Request;
use Omeka\Job\Dispatcher;
use Omeka\Module\AbstractModule;
use Omeka\Module\Exception\ModuleCannotInstallException;
use Omeka\Module\Module as DefaultModule;
use Omeka\Stdlib\Message;
use Omeka\Api\Exception\ValidationException;

final class Module extends AbstractModule
{
    private ?Dispatcher $dispatcher = null;
    private $api = null;
    private const MODULE_DEPENDENCIES = [
        ['name' => 'CustomVocab', 'version' => '1.7.1'],
        ['name' => 'AdvancedResourceTemplate', 'version' => '3.4.4.17'],
        ['name' => 'NumericDataTypes', 'version' => '1.11.0'],
    ];

    private const FOLDERS = [
        ['path' => 'files/datacatalogs/'],
        ['path' => 'files/datadumps/'],
    ];

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

//        $this->checkPrerequisites($serviceLocator);
//        $this->createFoldersIfTheyDontExist();
//        $this->installSchemaOrgVocabulary($serviceLocator);
//        $this->installCustomVocabularies();
//        $this->installTemplates();
    }

    protected function checkPrerequisites(ServiceLocatorInterface $serviceLocator): void
    {
        /* @var DefaultModule $module */
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
        foreach (self::FOLDERS as $folderName) {
            $this->checkFolder($folderName['path']);
        }
    }

    protected function checkFolder($folderName): void
    {
        $folderPath = OMEKA_PATH . $folderName;

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

    public function attachListeners(SharedEventManagerInterface $sharedEventManager)
    {
        $sharedEventManager->attach(
            ItemAdapter::class,
            'api.update.pre', // Do we need to get the pre or post events?
            [$this, 'dispatchDumpJob']
        );
    }

    public function dispatchDumpJob(Event $event): void
    {
        /** @var Request $request */
        $request = $event->getParam('request');

        // the api manager needs to be somewhere else
        $this->api = $this->getServiceLocator()->get('Omeka\ApiManager');

        // needed to do an API call to determine if it is a Datacatalog
        // Do we do this here or in the job?
        $resource = $request->getResource();
        $id = $request->getId();
        $response = $this->api->read($resource, $id);
        /** @var ItemRepresentation $content */
        $content = $response->getContent();
        /** @var ResourceClassRepresentation $resourceClass */
        $resourceClass = $content->resourceClass();
        $label = $resourceClass->label();

        if ($label !== 'DataCatalog') { // Don't know if this is the best way?
            return;
        }

        /** @var Dispatcher $dispatcher */
        $dispatcher = $this->serviceLocator->get('Omeka\Job\Dispatcher');
        $useBackground = false; // later in config?
        $job = $useBackground
            ? $dispatcher->dispatch(CatalogDumpJob::class, [ 'id' => $id ]) // async
            : $dispatcher->dispatch(CatalogDumpJob::class, [ 'id' => $id ], $this->getServiceLocator()->get(\Omeka\Job\DispatchStrategy\Synchronous::class));
    }
}
