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
use LinkedDataSets\Infrastructure\Services\FileCompressionService;
use Omeka\Api\Adapter\ItemAdapter;
use Omeka\Api\Manager;
use Omeka\Api\Representation\ItemRepresentation;
use Omeka\Api\Response;
use Omeka\DataType\Resource\Item;
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
    protected ?Manager $api;
    protected ?DistributionService $distributionService;
    protected ?ItemSetCrawler $itemSetCrawler;
    protected ?FileCompressionService $compressionService;

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
            throw new InvalidArgumentException('No id was provided to the job');
        }
        $this->api = $serviceLocator->get('Omeka\ApiManager');
        if (!$this->api) {
            throw new ServiceNotFoundException('The API manager is not found');
        }
        $this->distributionService = $serviceLocator->get('LDS\DistributionService');
        if (!$this->distributionService) {
            throw new ServiceNotFoundException('The Disitribution Service is not found');
        }
        $this->itemSetCrawler = $serviceLocator->get('LDS\ItemSetCrawler');
        if (!$this->itemSetCrawler) {
            throw new ServiceNotFoundException('The ItemSetCrawler is not found');
        }
        $this->compressionService = $serviceLocator->get('LDS\FileCompressionService');
        if (!$this->compressionService) {
            throw new ServiceNotFoundException('The compression service is not found');
        }
    }


    public function perform(): void
    {
        $apiUrl = $this->serverUrl->getScheme().'://'.$this->serverUrl->getHost()."/api/items/{$this->id}";

        # Step 0 - create graph and define prefix schema:
        RdfNamespace::set('schema', 'https://schema.org/');
        $graph = new Graph(); //dep injection?

        $folder = $this->createTemporaryFolder();

        # Step 1 - get lds dataset
        $graph->parse($apiUrl, 'jsonld');

        $distributionService = new DistributionService();
        $distribution = $this->distributionService->getDistribution($graph);

        $itemSets = $graph->resourcesMatching("^schema:mainEntityOfPage");

        foreach ($itemSets as $itemSet) {
            $item_set_id = $this->getIdFromPath($itemSet->getUri());
            $this->itemSetCrawler->crawl($item_set_id, $folder, $this->serverUrl);
        }

        $mergedFile = $this->mergeTripples($folder);

        $graph = new \EasyRdf\Graph();
        $graph->parseFile($mergedFile);

        $endFile = OMEKA_PATH . '/files/datadumps/'.$distribution->getFilename();

        $convertFolder = $this->createTemporaryFolder();
        $tempFileName = uniqid();
        $tempPath = $convertFolder . '/' . $tempFileName;

//        file_put_contents($endFile, $graph->serialise("jsonld"));
        file_put_contents($tempPath , $graph->serialise("jsonld"));

        // determine if the file needs to be compressed
        if (substr($distribution->getFormat(), -4) === 'gzip') {
            $compressedFile = $this->compressionService->gzCompressFile($tempPath);
            rename($compressedFile, $endFile);
        } else {
            rename($tempPath, $endFile);
        }

        $size = (new \SplFileInfo($endFile))->getSize();
        $uri = $this->serverUrl->getScheme().'://'.$this->serverUrl->getHost().'/files/datadumps/'.$endFile;

        // todo update distributie

//        /** @var Response $entity */
        $entity = $this->api->read('items', $distribution->getId());
//        /** @var ItemRepresentation $item */
//        $item = $entity->getContent();
//        $values = $item->values();
////        $item-
////        $this->api->update('items', $distribution->getId());
//            // determine size and names and update record

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

    /**
     * @param string $folder
     * @return string
     */
    protected function mergeTripples(string $folder): string
    {
        $generatedTripples = glob($folder."/*.nt");

        // Name of the output file
        $mergedFile = "$folder/merged_file.nt";

        // Open the output file for writing
        $handle = fopen($mergedFile, "w");

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

        return $mergedFile;
    }
}
