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
use LinkedDataSets\Application\Service\ItemSetCrawler;
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

        $folder = $this->createTemporaryFolder();

        # Step 1 - get lds dataset
        $graph->parse($apiUrl, 'jsonld');

        $distributionService = new DistributionService();
        $distribution = $distributionService->getDistribution($graph);

        $itemSets = $graph->resourcesMatching("^schema:mainEntityOfPage");

        $crawler = new ItemSetCrawler();

        foreach ($itemSets as $itemSet) {
            $item_set_id = $this->getIdFromPath($itemSet->getUri());
            $crawler->crawl($item_set_id, $folder, $this->serverUrl);
        }

        $generatedTripples = glob($folder. "/*.nt");


// Name of the output file
        $output_file = "$folder/merged_file.nt";

// Open the output file for writing
        $handle = fopen($output_file, "w");

// Loop through the file array and append each file to the output file
        foreach ($generatedTripples as $file) {
            // Open the current file for reading
            $handle2 = fopen($file, "r");

            // Read the contents of the current file and append it to the output file
            fwrite($handle, fread($handle2, filesize($file)));

            // Close the current file
            fclose($handle2);
        }

// Close the output file
        fclose($handle);

        $graph = new \EasyRdf\Graph();
        $graph->parseFile($output_file);

        $endFile = OMEKA_PATH . '/files/datadumps/'.$distribution->getFilename();
        file_put_contents($endFile, $graph->serialise("jsonld"));


            // determine size and names and update record

    }



    private function createTemporaryFolder() {
        $dir = sys_get_temp_dir();
        $tmp = uniqid('lds_');
        $path = $dir . '/' . $tmp;
        mkdir($path);
        return $path;
    }

    private function getIdFromPath($uri): int {
        $path = parse_url($uri, PHP_URL_PATH);
        $segments = explode('/', $path);
        $id = end($segments);
        return (int) $id;
    }
}
