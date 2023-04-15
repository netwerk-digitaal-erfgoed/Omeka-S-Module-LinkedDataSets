<?php

declare(strict_types=1);

namespace LinkedDataSets\Application\Service;

use EasyRdf\Graph;
use EasyRdf\Resource;
use LinkedDataSets\Application\Dto\DistributionDto;

final class DistributionService
{
    public function getDistribution(Graph $graph) {
        $distributionItem = $graph->resourcesMatching('^schema:distribution');

        if (! $distributionItem[0] instanceof Resource) {
            throw new \Exception('There is no distribution defined');
        }

        $newGraph = $graph::newAndLoad($distributionItem[0]->getUri());

        $format = $newGraph->getLiteral( $distributionItem[0]->getUri(), 'schema:encodingFormat')->getValue();
        $fileName = $newGraph->getLiteral( $distributionItem[0]->getUri(), 'schema:name')->getValue();
        $id = $this->getIdFromPath($distributionItem[0]->getUri());

        return new DistributionDto($format, $fileName, $id);

    }

    private function getIdFromPath($uri): int {
        $path = parse_url($uri, PHP_URL_PATH);
        $segments = explode('/', $path);
        $id = end($segments);
        return (int) $id;
    }

}