<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Job;

use EasyRdf\Graph;
use EasyRdf\RdfNamespace;
use Laminas\Log\Logger;
use Laminas\ServiceManager\Exception\ServiceNotFoundException;
use Laminas\ServiceManager\ServiceLocatorInterface;
use LinkedDataSets\Application\Service\DistributionService;
use LinkedDataSets\Application\Service\ItemSetCrawler;
use Omeka\Api\Manager;
use Omeka\Api\Representation\ItemRepresentation;
use Omeka\Api\Representation\ValueRepresentation;
use Omeka\Api\Response;
use Omeka\Entity\Job;
use Omeka\Entity\Value;
use Omeka\Job\AbstractJob;
use Omeka\Job\Exception\InvalidArgumentException;

final class TestDataDumpJob extends AbstractJob
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
    /** @var Manager  */
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
        $distributie_id = 14;
        $size = 100000;
        $fileName = 'filename.txt';
        $data=[];

        /** @var Response $response */
        $response = $this->api->read('items', $distributie_id, $data);
        /** @var ItemRepresentation $item */
        $item = $response->getContent();
        $values = $item->values();
        /** @var ValueRepresentation $fileSizeVR */
        // todo: sdo:contentSize can be absent, in that case add a new value reporesentation with the correct type
        $fileSizeVR = $values['sdo:contentSize'];
        $newFileSizeVr = new ValueRepresentation($fileSizeVR->value(), $fileSizeVR->type());
        $values['sdo:contentSize'] = $newFileSizeVr;
        try {
            $response = $this->api->update('items', $distributie_id, $values);
        } catch (\Exception $e) {
            var_dump($e);
        }


//        $item-
//        $this->api->update('items', $distribution->getId());
echo 't';
            // determine size and names and update record

    }
}
