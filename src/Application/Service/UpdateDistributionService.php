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

    public function __construct(ServiceLocatorInterface $serviceLocator)
    {
        $this->api = $serviceLocator->get('Omeka\ApiManager');
        $this->sharedEventManager = $serviceLocator->get('SharedEventManager');
    }


    /**
     * @throws Exception
     */
    public function update($distributionId, $url, $date, $fileSize): void
    {
        $this->detachEventListeners();

        $result = $this->api
            ->search('properties', ['term' => 'sdo:contentSize'])->getContent();

        $item = $this->api->read('items', $distributionId)->getContent();

        $itemData = json_decode(json_encode($item), true);

        if (array_key_exists('sdo:contentUrl', $itemData)) {
            $itemData['sdo:contentUrl'][0]['@id'] = $url;
        }

        if (array_key_exists('sdo:contentSize', $itemData)) {
            $itemData['sdo:contentSize'][0]['@value'] = $fileSize;
        } else {
            $itemData = $this->arrayInsertAfter(
                $itemData,
                'sdo:datePublished',
                $this->createContentSizeArray($result, $fileSize)
            );
        }

        if (array_key_exists('sdo:datePublished', $itemData)) {
            $itemData['sdo:datePublished'][0]['@value'] = $date;
        }

        $this->api->update('items', $distributionId, $itemData, [], []);
    }

    private function createContentSizeArray($result, $fileSize)
    {
        return ['sdo:contentSize' => [
            [
                'type' => "numeric:integer",
                'property_id' => $result[0]->id(),
                '@value' => $fileSize,
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
