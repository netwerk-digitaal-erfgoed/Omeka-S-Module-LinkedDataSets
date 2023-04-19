<?php declare(strict_types=1);

namespace LinLinkedDataSets\Application\Job;

use Laminas\Test\PHPUnit\Controller\AbstractControllerTestCase;
use LinkedDataSets\Application\Job\CatalogDumpJob;
use Omeka\Entity\Job;

//use OmekaTestHelper\Controller\OmekaControllerTestCase;

class CatalogDumpJobTest extends
{
    protected $entityManager;
    protected $auth;
//    protected $api;

    /**
     * @var \Omeka\Module\Manager
     */
    protected $moduleManager;

    protected $tempfile;

    public function setUp(): void
    {
        parent::setup();

        $this->overrideConfig();

        $services = $this->getServiceLocator();
        $this->entityManager = $services->get('Omeka\EntityManager');
        $this->auth = $services->get('Omeka\AuthenticationService');
//        $this->api = $services->get('Omeka\ApiManager');
        $this->moduleManager = $services->get('Omeka\ModuleManager');
        $this->loginAsAdmin();
    }

    protected function overrideConfig(): void
    {
        // create a way to override the target location of the dump files... TODO in module
        $services = $this->getServiceLocator();
        $services->setAllowOverride(true);
    }

    public function testPerformCreateDump(): void
    {
        $catalog = 97523; // make this maybe a dataProvider or create fixtures somehow
        $expectedFile = '_files/datacatalog-97523.jsonld';
        echo getcwd();
        $generatedDumpFile = '/files/datacatalogs/datacatalog-97523.jsonld';
        $this->performProcessForFile($catalog);
        $dump = file_get_contents($generatedDumpFile);
        $expected = file_get_contents($expectedFile);
        $this->assertEquals($expected, $dump);
    }

    /**
     * This false test allows to prepare a list of resources and to use them in
     * dependencies for performance reasons.
     *
     * @return array
     */
    protected function addBasePath($filepath, $basePathColumn)
    {
        copy($filepath, $this->tempfile);
    }

    /**
     * Process the export of a file.
     *
     * @param string $filepath
     * @return \Omeka\Entity\Job
     */
    protected function performProcessForFile(): Job
    {
        $job = new Job;
        $job->setStatus(Job::STATUS_STARTING);
        $job->setClass(CatalogDumpJob::class);
        $job->setArgs(['catalog_id' => 97523 ]);
        $job->setOwner($this->auth->getIdentity());
        $this->entityManager->persist($job);
        $this->entityManager->flush();

        $catalogDump = new CatalogDumpJob($job, $this->getServiceLocator());
        $catalogDump->perform();

        return $job;
    }
}
