<?php

declare(strict_types=1);

namespace LinkedDataSets\Domain\Job;

use Laminas\Log\Logger;
use Laminas\Log\Processor\ReferenceId;
use Omeka\Api\Manager;
use Omeka\Api\Representation\ItemRepresentation;
use Omeka\Job\AbstractJob;
use Omeka\Job\Exception\InvalidArgumentException;

final class CreateCatalogDumpJob extends AbstractJob
{
    protected ?Logger $logger = null;
    protected ?Manager $api = null;
    protected ?ItemRepresentation $catalog = null;

    // requires the Id of a catalog item
    // see https://forum.omeka.org/t/csv-import-et-dispatchstrategy/12532
    // for dispatch strategy

    /**
     * @inheritDoc
     */
    public function perform()
    {
//        dump('getriggered'); die;
//        $this->getLogger();
//        $catalog = $this->getCatalog();

        # URL of the API retrieve call to the data catalog
        //$baseUrlDataCatalogViaApi = "http://my-lando-app.lndo.site/api/items/12997";
        $baseUrlDataCatalogViaApi="http://my-lando-app.lndo.site/api/items/12997";
        # Step 0 - create graph and define prefix schema:

        RdfNamespace::set('schema', 'https://schema.org/');
        $graph = new Graph(); //dep injection?

        # Step 1 - get data catalog
        $graph->parse($baseUrlDataCatalogViaApi, 'jsonld');

        foreach ($graph->resources() as $resource) {
            # Step 2 - get all datasets which are part of the data catalog

            $datasets = $resource->allResources("schema:dataset");
            foreach ($datasets as $dataset) {
                $dataset_uri = $dataset->getUri();
                $graph->parse($dataset_uri, 'jsonld');
            }

            # Step 3 - get all distribution which are part of datasets
            $distributions = $resource->allResources("schema:distribution");

            foreach ($distributions as $distribution) {
                $distribution_uri = $distribution->getUri();
                $graph->parse($distribution_uri, 'jsonld');
            }

            # Step 4 - get all publishers and creators (of data catalog and datasets)
            $publishers = $resource->allResources("schema:publisher");

            foreach ($publishers as $publisher) {
                $publisher_uri = $publisher->getUri();
                $graph->parse($publisher_uri, 'jsonld');
            }

            $creators = $resource->allResources("schema:creator");

            foreach ($creators as $creator) {
                $creator_uri = $creator->getUri();
                $graph->parse($creator_uri, 'jsonld');
            }
        }

        # Step 5 - remove Omeka classes and properties (o:)
        foreach ($graph->resources() as $resource) {
            foreach ($resource->properties() as $propertyUris) {
                if ($propertyUris == "rdf:type") {
                    foreach ($resource->all("rdf:type") as $item) {
                        if (preg_match("/omeka\.org\/item\/vocabs\/o/", $item)) {
                            $resource->delete("rdf:type", $item);
                        }
                    }
                }
            }
            foreach ($resource->propertyUris() as $propertyUris) {
                if (preg_match("/omeka\.org\/item\/vocabs\/o/", $propertyUris)) {
                    $resource->delete($propertyUris);
                }
            }
        }

        # Step 6 - output the graph in several serializations
        $serializations = [
            "turtle" => "ttl",
            "ntriples" => "nt",
            "jsonld" => "jsonld",
            "rdfxml" => "xml",
        ];

        $fileName = $catalog->id() . 'catalogus';
        foreach ($serializations as $serialization => $extension) {
            $serialization_contents = $graph->serialise($serialization);
            file_put_contents(OMEKA_PATH . "/files/datacatalogs/{$fileName}." . $extension, $serialization_contents);
        }
    }

    protected function getLogger(): Logger
    {
        if ($this->logger) {
            return $this->logger;
        }
        $this->logger = $this->getServiceLocator()
            ->get('Omeka\Logger')
        ;
        $referenceId = new ReferenceId();
        $referenceId->setReferenceId(
            'bedenken' . $this->getCatalog()
                ->id()
        );
        $this->logger->addProcessor($referenceId);

        return $this->logger;
    }

    protected function getCatalog()
    {
        if ($this->catalog) {
            return $this->catalog;
        }

        $id = $this->getArg('catalog_id');
        if ($id) {
            $content = $this->api()
                ->search('items', ['id' => $id, 'limit' => 1])
                ->getContent()
            ;
            $this->catalog = is_array($content) && count($content) ? reset($content) : null;
        }

        if (empty($this->catalog)) {
            // TODO Avoid the useless trace in the log for jobs.
            throw new InvalidArgumentException('Catalog does not exist'); // @translate
        }

        return $this->catalog;
    }

    protected function api()
    {
        if (!$this->api) {
            $this->api = $this->getServiceLocator()
                ->get('Omeka\ApiManager')
            ;
        }

        return $this->api;
    }
}
