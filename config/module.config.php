<?php

namespace LinkedDataSets;

use Laminas\Router\Http;

use LinkedDataSets\Infrastructure\Services\Factories\ApiManagerHelperFactory;
use LinkedDataSets\Infrastructure\Services\Factories\CatalogDumpServiceFactory;
use LinkedDataSets\Infrastructure\Services\Factories\DistributionServiceFactory;
use LinkedDataSets\Infrastructure\Services\Factories\FileCompressionServiceFactory;
use LinkedDataSets\Infrastructure\Services\Factories\ItemSetCrawlerFactory;
use LinkedDataSets\Infrastructure\Services\Factories\UriHelperFactory;
use LinkedDataSets\Infrastructure\Services\Factories\LinkedDataSetsFactory;
use LinkedDataSets\Infrastructure\Services\Factories\DatasetDatadumpControllerFactory;
use LinkedDataSets\Infrastructure\Services\Factories\DatacatalogControllerFactory;

return [
    'service_manager' => [
        'factories' => [
            'LDS\DistributionService' => DistributionServiceFactory::class,
            'LDS\ItemSetCrawler' => ItemSetCrawlerFactory::class,
            'LDS\FileCompressionService' => FileCompressionServiceFactory::class,
            'LDS\ApiManagerHelper' => ApiManagerHelperFactory::class,
            'LDS\UriHelper' => UriHelperFactory::class,
            'LDS\CatalogDumpService' => CatalogDumpServiceFactory::class,
            'LDS\LinkedDataSets' => LinkedDataSetsFactory::class,
        ]
    ],
    'dependencies' => [
        'modules' => [
            ['name' => 'CustomVocab', 'version' => '1.7.1'],
            ['name' => 'NumericDataTypes', 'version' => '1.11.0'],
            ],
        ],
    'folders' => [
        ["path" => 'files/datacatalogs/'],
        ["path" => 'files/datadumps/'],
    ],
    'view_manager' => [
        'template_path_stack' => [
            sprintf('%s/../view', __DIR__),
        ],
    ],
    'controllers' => [
        'invokables' => [
            'LinkedDataSets\Controller\Admin\Index' => Controller\Admin\IndexController::class,
        ],
        'factories' => [
            'LinkedDataSets\Controller\Admin\DatasetDatadump' => DatasetDatadumpControllerFactory::class,
            'LinkedDataSets\Controller\Admin\Datacatalog' => DatacatalogControllerFactory::class,
        ],
    ],
    'navigation' => [
        'AdminModule' => [
            [
                'label' => 'Linked Data Sets',
                'route' => 'admin/linked-data-sets',
                'resource' => 'LinkedDataSets\Controller\Admin\Index',
                'class' => 'linked-data-sets',
                'pages' => [
                    [
                        'label' => 'Datacatalogs',
                        'route' => 'admin/linked-data-sets/datacatalogs',
                        'resource' => 'LinkedDataSets\Controller\Admin\Datacatalog',
                    ],
                    [
                        'label' => 'Dataset datadumps',
                        'route' => 'admin/linked-data-sets/dataset-datadumps',
                        'resource' => 'LinkedDataSets\Controller\Admin\DatasetDatadump',
                    ],
                ],
            ],
        ],
    ],
    'router' => [
        'routes' => [
            'admin' => [
                'child_routes' => [
                    'linked-data-sets' => [
                        'type' => 'Literal',
                        'options' => [
                            'route' => '/linked-data-sets',
                            'defaults' => [
                                '__NAMESPACE__' => 'LinkedDataSets\Controller\Admin',
                                'controller' => 'index',
                                'action' => 'index',
                            ],
                        ],
                        'child_routes' => [
                            'dataset-datadumps' => [
                                'type' => Http\Segment::class,
                                'options' => [
                                    'route' => '/dataset-datadumps/:action',
                                    'constraints' => [
                                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                    ],
                                    'defaults' => [
                                        '__NAMESPACE__' => 'LinkedDataSets\Controller\Admin',
                                        'controller' => 'dataset-datadump',
                                        'action' => 'browse',
                                    ],
                                ],
                            ],
                            'datacatalogs' => [
                                'type' => 'Literal',
                                'options' => [
                                    'route' => '/datacatalogs',
                                    'defaults' => [
                                        '__NAMESPACE__' => 'LinkedDataSets\Controller\Admin',
                                        'controller' => 'datacatalog',
                                        'action' => 'browse',
                                    ],
                                ],
                            ],
                        ],
                        'may_terminate' => true,
                    ],
                ],
            ],
        ],
    ],
];
