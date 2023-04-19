<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Job;

use EasyRdf\Graph;
use EasyRdf\RdfNamespace;
use EasyRdf\Resource;
use Laminas\Log\Logger;
use Laminas\Log\Processor\ReferenceId;
use Laminas\View\Helper\ServerUrl;
use Omeka\Api\Manager;
use Omeka\Job\AbstractJob;

final class CatalogDumpJob extends AbstractJob
{
    const DUMP_FORMATS = [
        "turtle" => "ttl",
        "ntriples" => "nt",
        "jsonld" => "jsonld",
        "rdfxml" => "xml",
    ];

    protected ?Logger $logger = null;
    protected ?Manager $api = null;

    public function perform(): void
    {
        $id = $this->getArg('id');
        $this->getLogger();

        /** @var ServerUrl $serverUrl */
        $serverUrl = $this->getServiceLocator()->get('ViewHelperManager')->get('ServerUrl');
        if (!$serverUrl->getHost()) {
            $serverUrl->setHost('http://localhost');
        }

        # URL of the API retrieve call to the data catalog
        $apiUrl = $serverUrl->getScheme() . '://' . $serverUrl->getHost() . "/api/items/{$id}";

        # Step 0 - create graph and define prefix schema:
        RdfNamespace::set('schema', 'https://schema.org/');
        $graph = new Graph(); //dep injection?

        # Step 1 - get data catalog
        $graph->parse($apiUrl, 'jsonld');

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
                    /** @var Resource $item */
                    foreach ($resource->all("rdf:type") as $item) {
                        if (preg_match("/omeka\.org\/s\/vocabs\/o/", $item->getUri())) {
                            $resource->delete("rdf:type", $item);
                        }
                    }
                }
            }
            foreach ($resource->propertyUris() as $propertyUris) {
                // Need investigation why the pattern is different here than in EasyRDF
                if (preg_match("/omeka\.org\/s\/vocabs\/o/", $propertyUris)) {
                    $resource->delete($propertyUris);
                }
            }
        }

        # Step 6 - output the graph in several serializations
        $fileName = "datacatalog-{$id}";
        foreach (self::DUMP_FORMATS as $format => $extension) {
            $content = $graph->serialise($format);
            file_put_contents(OMEKA_PATH . "/files/datacatalogs/{$fileName}." . $extension, $content);
            $this->logger->notice(
                "The file {$fileName}.{$extension} is available." // @translate
            );
        }
    }

    protected function getLogger(): Logger
    {
        if ($this->logger) {
            return $this->logger;
        }
        $this->logger = $this->getServiceLocator()->get('Omeka\Logger');

        return $this->logger;
    }
}
