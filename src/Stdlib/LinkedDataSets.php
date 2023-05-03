<?php
namespace LinkedDataSets\Stdlib;

use Laminas\ServiceManager\ServiceLocatorInterface;

class LinkedDataSets
{
    protected $services;

    public function __construct(ServiceLocatorInterface $services)
    {
        $this->services = $services;
    }

}
