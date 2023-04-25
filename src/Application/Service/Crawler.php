<?php

declare(strict_types=1);

namespace App\Crawler;

use Laminas\Http\Client;
use Laminas\Http\Response;

final class Crawler
{
    const BASE_URL = 'http://my-lando-app.lndo.site';

    private $resources_seen = [];
    private $resources_todo = [];
    private $item_set_id;

    public function crawl($item_set_id)
    {
        $this->item_set_id = $item_set_id;

        $startpage = 1;

        if (!file_exists("nt.$this->item_set_id/")) {
            mkdir("nt.$this->item_set_id");
        }

        $next = self::BASE_URL . '/api/items?item_set_id=' . $this->item_set_id . '&per_page=100&sort_by=id&sort_order=asc&page=' . $startpage;

        while (!empty($next)) {
            $next = $this->get_content_and_next($next);
        }

        while (!empty($this->resources_todo)) {
            $resource = array_shift($this->resources_todo);
            if (!isset($this->resources_seen[$resource])) {
                $this->get_content($resource);
                $this->resources_seen[$resource] = 1;
            }
        }
    }

    private function get_content($url)
    {
        error_log($url);

        // replace by response
        [$headers, $body] = $this->get_headers_body($url);

        if (preg_match("/HTTP\/2 404/", $headers)) {
            error_log("ERROR: 404 on $url");
        } elseif (preg_match("/HTTP\/2 500/", $headers)) {
            error_log("ERROR: 500 on $url");
            exit;
        } else {
            $this->process_content_body($body);
        }
    }

    private function process_content_body($jsonld_string)
    {
        $json = json_decode($jsonld_string, true);
        $this->process_omeka_item($json);
    }

    private function get_content_and_next($url)
    {
        [$headers, $body] = $this->get_headers_body($url);

        if (preg_match("/HTTP\/2 404/", $headers)) {
            error_log("ERROR: 404 on $url");
        } elseif (preg_match("/HTTP\/2 403/", $headers)) {
            error_log("ERROR: 403 on $url");
        } elseif (preg_match("/HTTP\/2 500/", $headers)) {
            error_log("ERROR: 500 on $url");
            exit;
        } else {
            $this->process_contents($body);

            return $this->get_next($headers);
        }
    }

    private function process_contents($jsonld_string)
    {
        $omekaItems = json_decode($jsonld_string, true);
        foreach ($omekaItems as $omekaItem) {
            $this->process_omeka_item($omekaItem);
        }
    }

    public function process_omeka_item($omekaItem)
    {
        if (isset($omekaItem["@id"])) {
            $id = $omekaItem["@id"];
            $this->resources_seen[$id] = 1;

            $jsonld_string = json_encode(
                $omekaItem,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
            );
            preg_match_all('#' . self::BASE_URL . '\/[a-z_\-\/]+[0-9]+#', $jsonld_string, $linkedUris);

            foreach ($linkedUris[0] as $linkedUri) {
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
        file_put_contents("nt.$this->item_set_id/$hash_of_uri.nt", $this->convert_jsonld_to_ntriples($uri, $jsonld_string));
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

    private function get_headers_body($url)
    {
        error_log("INFO: Fetching $url");

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, true);

        $response = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Error:' . curl_error($ch);
            exit();
        }

        $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
        $headers = substr($response, 0, $header_size);
        $body = substr($response, $header_size);

        curl_close($ch);

        return [$headers, $body];
    }

    private function readUrl($url): Response
    {
        return (new Client($url))->send();
    }
}
