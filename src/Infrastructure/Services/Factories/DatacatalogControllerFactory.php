<?php

namespace LinkedDataSets\Infrastructure\Services\Factories;

use Interop\Container\ContainerInterface;
use LinkedDataSets\Controller\Admin\DatacatalogController;
use Zend\ServiceManager\Factory\FactoryInterface;

class DatacatalogControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $services, $requestedName, array $options = null)
    {
        return new DatacatalogController($services->get('LDS\LinkedDataSets'));
    }
}
