<?php

declare(strict_types=1);

namespace Application\Service;

use Laminas\Test\PHPUnit\Controller\AbstractControllerTestCase;
use LinkedDataSets\Application\Service\ItemSetCrawler;
//use PHPUnit\Framework\TestCase;
use Omeka\Test\TestCase;

final class ItemSetCrawlerTest extends TestCase
{
    public function testCrawl()
    {
        $crawler = new ItemSetCrawler();
        $itemSetId = 1; // Replace with a valid item set ID
        $folder = '/tmp/'.uniqid(); // Replace with a valid folder path
        mkdir($folder);
        $serverUrl = new \Laminas\Uri\Http("http://my-lando-app.lndo.site/api/items/{$itemSetId}");

        $crawler->crawl($itemSetId, $folder, $serverUrl);

        // Assert that all expected resources were processed
//        $this->assertCount($expectedResourceCount, $crawler->getResourcesProcessed());
        $files = glob("{$folder}/*");
        $this->assertCount(55, $files);
    }

}