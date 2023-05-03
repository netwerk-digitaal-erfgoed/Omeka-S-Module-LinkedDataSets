<?php

namespace LinkedDataSets\Infrastructure\Services\Factories;

use Interop\Container\ContainerInterface;
use LinkedDataSets\Stdlib\LinkedDataSets;
use Zend\ServiceManager\Factory\FactoryInterface;

class LinkedDataSetsFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $services, $requestedName, array $options = null)
    {
        return new LinkedDataSets($services);
    }
}
