<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Service;

use EasyRdf\Graph;
use Laminas\Http\Client;
use Laminas\Http\Response;
use Laminas\Uri\Http;
use Laminas\ServiceManager\Exception\ServiceNotFoundException;
use Laminas\ServiceManager\ServiceLocatorInterface;
use Psr\Container\ContainerInterface;

final class ItemSetCrawler
{
    protected $serviceLocator;
    private const PER_PAGE = 100;
    private const SORT_BY = 'id';
    private const SORT_ORDER = 'asc';

    private $resourcesProcessed = [];
    private $resourcesToProcess = [];
    private $itemSetId;
    private $folder;
    private $serverUrl;
    private $baseUrl;

    public function __construct(ContainerInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
        $this->baseUrl = $this->serviceLocator->get('LDS\UriHelper')->constructUri();
    }
    public function crawl($itemSetId, $folder): void
    {
        $this->itemSetId = $itemSetId;
        $this->folder = $folder;
//        $this->serverUrl = $serverUrl;
//        $this->baseUrl = $this->serverUrl->getScheme() . '://' . $this->serverUrl->getHost();

        $startpage = 1;

        if (!file_exists($this->folder)) {
            throw new \Exception('The temporary folder does not exists');
        }

        $urlToCrawl = $this->baseUrl . '/api/items?item_set_id=' . $this->itemSetId .
            '&per_page=' . self::PER_PAGE . '&sort_by=' . self::SORT_BY . '&sort_order=' .
            self::SORT_ORDER . '&page=' . $startpage;

        while (!empty($urlToCrawl)) {
            $urlToCrawl = $this->getContentAndNextUri($urlToCrawl);
        }

        while (!empty($this->resourcesToProcess)) {
            $resource = array_shift($this->resourcesToProcess);
            if (!isset($this->resourcesProcessed[$resource])) {
                $this->getContent($resource);
                $this->resourcesProcessed[$resource] = 1;
            }
        }
    }

    private function getContent($url): void
    {
        $response = $this->readUrl($url);

        if ($response->getStatusCode() === 200) {
            $this->processContentBody($response->getBody());
            return;
        }

        if ($response->getStatusCode() === 500) {
            error_log("ERROR: 500 on $url");
            exit;
        }

        if ($response->getStatusCode() !== 200) {
            error_log("ERROR: {$response->getStatusCode()} on $url");
        }
    }

    private function processContentBody($omekaItemAsJsonLD)
    {
        $omekaItem = json_decode($omekaItemAsJsonLD, true);
        $this->processOmekaItem($omekaItem);
    }

    private function getContentAndNextUri($url)
    {
        $response = $this->readUrl($url);

        if ($response->getStatusCode() === 200) {
            $this->extractOmekaItems($response->getBody());
            return $this->getNextUri($response->getHeaders()->toString());
        }

        if ($response->getStatusCode() === 500) {
            error_log("ERROR: {$response->getStatusCode()} on $url");
            exit;
        }

        if ($response->getStatusCode() !== 200) {
            error_log("ERROR: {$response->getStatusCode()} on $url");
        }
    }

    private function extractOmekaItems($jsonld_string): void
    {
        $omekaItems = json_decode($jsonld_string, true);
        foreach ($omekaItems as $omekaItem) {
            $this->processOmekaItem($omekaItem);
        }
    }

    public function processOmekaItem($omekaItem): void
    {
        if (isset($omekaItem["@id"])) {
            $id = $omekaItem["@id"];
            $this->resourcesProcessed[$id] = 1;

            $jsonld_string = json_encode(
                $omekaItem,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
            );

            $linkedUris = $this->getRelatedUrisFromItem($omekaItem);

            foreach ($linkedUris as $linkedUri) {
                if (!isset($this->resourcesProcessed[$linkedUri])) {
                    $this->resourcesToProcess[] = $linkedUri;
                }
            }

            $this->saveToDisk($id, $jsonld_string);
        }
    }

    private function saveToDisk($uri, $jsonld_string): void
    {
        $hash_of_uri = md5($uri);
        file_put_contents("$this->folder/$hash_of_uri.nt", $this->convertJsonldToNtriples($uri, $jsonld_string));
    }

    private function convertJsonldToNtriples($uri, $jsonld_string)
    {
        $graph = new Graph($uri);
        $graph->parse($jsonld_string, "jsonld", $uri);

        return $graph->serialise("nt");
    }

    private function getNextUri($headers)
    {
        # link: <https://www.goudatijdmachine.nl/data/api/items?item_set_id=13004&sort_by=id&sort_order=asc&page=1>; rel="first", <https://www.goudatijdmachine.nl/data/api/items?item_set_id=13004&sort_by=id&sort_order=asc&page=2>; rel="next", <https://www.goudatijdmachine.nl/data/api/items?item_set_id=13004&sort_by=id&sort_order=asc&page=238>; rel="last"

        if (preg_match("/\<([^\>\;]+)\>\; rel\=\"next\"/", $headers, $matches)) {
            return $matches[1];
        }

        return '';
    }

    private function readUrl($url): Response
    {
        try {
            $response =  (new Client($url))->send(); // replace by symfony PSR-7 http client?
        } catch (\Exception $e) {
            $catched = true;
        }

        return $response;
    }

    private function getRelatedUrisFromItem($omekaItem): array
    {
        $result = [];

        foreach ($omekaItem as $key => $value) {
            if ($key === '@id' && filter_var($value, FILTER_VALIDATE_URL) !== false) {
                $result[] = $value;
            } elseif (is_array($value)) {
                $result = array_merge($result, $this->getRelatedUrisFromItem($value));
            }
        }

        return $result;
    }
}
