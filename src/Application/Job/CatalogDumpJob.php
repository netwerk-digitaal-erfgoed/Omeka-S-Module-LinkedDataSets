<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Job;

use EasyRdf\Graph;
use EasyRdf\RdfNamespace;
use EasyRdf\Resource;
use Laminas\Log\Logger;
use Laminas\ServiceManager\Exception\ServiceNotFoundException;
use Laminas\ServiceManager\ServiceLocatorInterface;
use LinkedDataSets\Application\Service\CatalogDumpService;
use Omeka\Entity\Job;
use Omeka\Job\AbstractJob;
use Omeka\Job\Exception\InvalidArgumentException;

final class CatalogDumpJob extends AbstractJob
{
    protected ?Logger $logger = null;
    protected $id;
    protected CatalogDumpService $catalogDumpService;

    public function __construct(Job $job, ServiceLocatorInterface $serviceLocator)
    {
        parent::__construct($job, $serviceLocator);
        $this->logger = $serviceLocator->get('Omeka\Logger');
        if (!$this->logger) {
            throw new ServiceNotFoundException('The logger service is not found');
        }
        $this->catalogDumpService = $this->serviceLocator->get('LDS\CatalogDumpService');

        $this->id = $this->getArg('id');
        if (!$this->id) {
            throw new InvalidArgumentException('No catalog_id was provided to the job');
        }
    }


    public function perform(): void
    {
        $this->catalogDumpService->dumpCatalog($this->id);
    }
}
