<?php
namespace LinkedDataSets\Service\Controller\Admin;

use Interop\Container\ContainerInterface;
use LinkedDataSets\Controller\Admin\DistributionTemplateController;
use Zend\ServiceManager\Factory\FactoryInterface;

class DistributionTemplateControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $services, $requestedName, array $options = null)
    {
        return new DistributionTemplateController($services->get('LinkedDataSets\LinkedDataSets'));
    }
}
