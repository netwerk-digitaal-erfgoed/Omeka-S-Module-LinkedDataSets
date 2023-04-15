<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Job;

use EasyRdf\Graph;
use EasyRdf\RdfNamespace;
use EasyRdf\Resource;
use Laminas\Log\Logger;
use Laminas\ServiceManager\Exception\ServiceNotFoundException;
use Laminas\ServiceManager\ServiceLocatorInterface;
use LinkedDataSets\Application\Service\DistributionService;
use Omeka\Entity\Job;
use Omeka\Job\AbstractJob;
use Omeka\Job\Exception\InvalidArgumentException;

final class DataDumpJob extends AbstractJob
{
    // in php 8.1 convert to enum
    const DUMP_FORMATS = [
        "turtle" => "ttl",
        "ntriples" => "nt",
        "jsonld" => "jsonld",
        "rdfxml" => "xml",
    ];

    protected ?Logger $logger = null;
    protected $serverUrl;
    protected $id;
    protected $api;

    public function __construct(Job $job, ServiceLocatorInterface $serviceLocator)
    {
        parent::__construct($job, $serviceLocator);
        $this->logger = $serviceLocator->get('Omeka\Logger');
        if (!$this->logger) {
            throw new ServiceNotFoundException('The logger service is not found');
        }
        $this->serverUrl = $serviceLocator->get('ViewHelperManager')?->get('ServerUrl');
        if (!$this->serverUrl) {
            throw new ServiceNotFoundException('The serverUrl service is not found');
        }
        $this->id = $this->getArg('id');
        if (!$this->id) {
            throw new InvalidArgumentException('No catalog_id was provided to the job');
        }
        $this->api = $serviceLocator->get('Omeka\ApiManager');
        if (!$this->api) {
            throw new ServiceNotFoundException('The API manager is not found');
        }
    }


    public function perform(): void
    {
//        $response = $this->api->read('items', $this->id);
//        dd($response);
        $apiUrl = $this->serverUrl->getScheme().'://'.$this->serverUrl->getHost()."/api/items/{$this->id}";

        # Step 0 - create graph and define prefix schema:
        RdfNamespace::set('schema', 'https://schema.org/');
        $graph = new Graph(); //dep injection?

        # Step 1 - get lds dataset
        $graph->parse($apiUrl, 'jsonld');

        $distributionService = new DistributionService();
        $distribution = $distributionService->getDistribution($graph);

        $itemSets = $graph->resourcesMatching("^schema:mainEntityOfPage");


            // call the crawler with the item-sets array

            // convert in distrbution file format

            // determine size and names and update record

    }


    protected function dumpSerialisedFiles(Graph $graph): void // candidate for separate class
    {
        $fileName = "datacatalog-{$this->id}"; // in separate class make a const FILENAME_PREFIX or so
        foreach (self::DUMP_FORMATS as $format => $extension) {
            $content = $graph->serialise($format);
            file_put_contents(OMEKA_PATH . "/files/datacatalogs/{$fileName}." . $extension, $content);
            $this->logger->notice(
                "The file {$fileName}.{$extension} is available." // @translate
            );
        }
    }
}
