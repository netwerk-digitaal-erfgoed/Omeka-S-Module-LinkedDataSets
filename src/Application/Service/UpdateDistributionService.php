<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Service;

use EasyRdf\Exception;
use Laminas\EventManager\SharedEventManager;
use Laminas\ServiceManager\ServiceLocatorInterface;
use Omeka\Api\Manager;
use Omeka\Entity\Item;

final class UpdateDistributionService
{
    protected ?Manager $api;
    protected SharedEventManager $sharedEventManager;
    protected string $schemaPrefix;

    public function __construct(ServiceLocatorInterface $serviceLocator)
    {
        $this->api = $serviceLocator->get('Omeka\ApiManager');
        $this->sharedEventManager = $serviceLocator->get('SharedEventManager');
        $this->schemaPrefix = $this->resolveSchemaPrefix();
    }

    /**
     * Resolve the prefix of the Schema.org vocabulary that is installed in Omeka S.
     * Checks both https and http namespaces to handle either variant.
     * Falls back to 'sdo' (the default prefix used by this module) if not found.
     */
    private function resolveSchemaPrefix(): string
    {
        foreach (['https://schema.org/', 'http://schema.org/'] as $namespace) {
            $results = $this->api->search('vocabularies', ['namespace_uri' => $namespace])->getContent();
            if (!empty($results)) {
                return $results[0]->prefix();
            }
        }
        return 'sdo';
    }


    /**
     * @throws Exception
     */
    public function update($distributionId, $url, $date, $fileSize): void
    {
        $this->detachEventListeners();

        $item = $this->api->read('items', $distributionId)->getContent();
        $itemData = json_decode(json_encode($item), true);

        # Construct the item-metadata field names based on the Schema.org prefix that is installed in Omeka S, e.g. 'sdo:contentUrl' or 'schema:contentUrl'
        $contentUrl  = $this->schemaPrefix . ':contentUrl';
        $contentSize = $this->schemaPrefix . ':contentSize';
        $dateModified = $this->schemaPrefix . ':dateModified';

        if (array_key_exists($contentUrl, $itemData)) {
            $itemData[$contentUrl][0]['@id'] = $url;
        }

        if (array_key_exists($contentSize, $itemData)) {
            $itemData[$contentSize][0]['@value'] = $fileSize;
        } else {
            $itemData = $this->arrayInsertAfter(
                $itemData,
                $contentUrl,
                $this->createContentSizeArray($fileSize)
            );
        }

        if (array_key_exists($dateModified, $itemData)) {
            $itemData[$dateModified][0]['@value'] = $date;
        } else {
            $itemData = $this->arrayInsertAfter(
                $itemData,
                $contentSize,
                $this->createDateModifiedArray($date)
            );
        }

        $this->api->update('items', $distributionId, $itemData, [], []);
    }

    private function createContentSizeArray($fileSize)
    {
        $term = $this->schemaPrefix . ':contentSize';
        $result = $this->api
            ->search('properties', ['term' => $term])->getContent();

        return [$term => [
            [
                'type' => "numeric:integer",
                'property_id' => $result[0]->id(),
                '@value' => $fileSize,
             ]
        ]
        ];
    }

    private function createDateModifiedArray($date)
    {
        $term = $this->schemaPrefix . ':dateModified';
        $result = $this->api
            ->search('properties', ['term' => $term])->getContent();

        return [$term => [
            [
                'type' => "numeric:timestamp",
                'property_id' => $result[0]->id(),
                '@value' => $date,
             ]
        ]
        ];
    }
    
    private function arrayInsertAfter(array $array, $key, array $new)
    {
        $keys = array_keys($array);
        $index = array_search($key, $keys);
        $pos = false === $index ? count($array) : $index + 1;

        return array_merge(array_slice($array, 0, $pos), $new, array_slice($array, $pos));
    }


    private function detachEventListeners()
    {
        $this->sharedEventManager->clearListeners(Item::class);
    }
}
