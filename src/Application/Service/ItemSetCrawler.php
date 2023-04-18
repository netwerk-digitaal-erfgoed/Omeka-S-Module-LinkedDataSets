<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Service;

use Laminas\Http\Client;
use Laminas\Http\Response;
use Laminas\ServiceManager\Exception\ServiceNotFoundException;
use Laminas\ServiceManager\ServiceLocatorInterface;

final class ItemSetCrawler
{
    protected $serviceLocator;
    private const PER_PAGE = 100;
    private const SORT_BY = 'id';
    private const SORT_ORDER = 'asc';

    private $resources_seen = [];
    private $resources_todo = [];
    private $item_set_id;
    private $folder;
    private $serverUrl;
    private $baseUrl;

    public function __construct() {
    }
    public function crawl($item_set_id, $folder, $serverUrl): void
    {
//        $this->resources_seen = [];
//        $this->resources_todo = [];
        $this->item_set_id = $item_set_id;
        $this->folder = $folder;
        $this->serverUrl = $serverUrl;
        $this->baseUrl = $this->serverUrl->getScheme().'://'.$this->serverUrl->getHost();

        $startpage = 1;

        if (!file_exists($this->folder)) {
            throw new \Exception('The temporary folder does not exists');
        }

        $urlToCrawl = $this->baseUrl . '/api/items?item_set_id=' . $this->item_set_id .
            '&per_page=' . self::PER_PAGE . '&sort_by=' . self::SORT_BY . '&sort_order=' .
            self::SORT_ORDER . '&page=' . $startpage;

        while (!empty($urlToCrawl)) {
            $urlToCrawl = $this->get_content_and_next($urlToCrawl);
        }

        while (!empty($this->resources_todo)) {
            $resource = array_shift($this->resources_todo);
            if (!isset($this->resources_seen[$resource])) {
                $this->get_content( $resource);
                $this->resources_seen[$resource] = 1;
            }
        }
    }

    private function get_content($url): void
    {
        $response = $this->readUrl($url);

        if ($response->getStatusCode() === 200) {
            $this->process_content_body( $response->getContent());
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

    private function process_content_body($jsonld_string)
    {
        $omekaItem = json_decode($jsonld_string, true);
        $this->process_omeka_item( $omekaItem);
    }

    private function get_content_and_next($url)
    {
        $response = $this->readUrl($url);

        if ($response->getStatusCode() === 200) {
            $this->process_contents( $response->getContent());
            return $this->get_next($response->getHeaders()->toString());
        }

        if ($response->getStatusCode() === 500) {
            error_log("ERROR: {$response->getStatusCode()} on $url");
            exit;
        }

        if ($response->getStatusCode() !== 200) {
            error_log("ERROR: {$response->getStatusCode()} on $url");
        }
    }

    private function process_contents($jsonld_string): void
    {
        $omekaItems = json_decode($jsonld_string, true);
        foreach ($omekaItems as $omekaItem) {
            $this->process_omeka_item( $omekaItem);
        }
    }

    public function process_omeka_item($omekaItem): void
    {
        if (isset($omekaItem["@id"])) {
            $id = $omekaItem["@id"];
            $this->resources_seen[$id] = 1;

            $jsonld_string = json_encode(
                $omekaItem,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
            );

            $linkedUris = $this->getRelatedUrisFromItem($omekaItem);

            foreach ($linkedUris as $linkedUri) {
                if (!isset($this->resources_seen[$linkedUri])) {
                    $this->resources_todo[] = $linkedUri;
                }
            }

            $this->save_to_disk($id, $jsonld_string);
        }
    }

    private function save_to_disk($uri, $jsonld_string): void
    {
        $hash_of_uri = md5($uri);
        file_put_contents("$this->folder/$hash_of_uri.nt", $this->convert_jsonld_to_ntriples($uri, $jsonld_string));
    }

    private function convert_jsonld_to_ntriples($uri, $jsonld_string)
    {
        $graph = new \EasyRdf\Graph($uri);
        $graph->parse($jsonld_string, "jsonld", $uri);

        return $graph->serialise("nt");
    }

    private function get_next($headers)
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
        } catch  (\Exception $e) {
            $catched = true;
        }

        return $response;
    }

    private function getRelatedUrisFromItem($omekaItem): array {
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