<?php

namespace LinkedDataSets;

use Laminas\Router\Http;

use LinkedDataSets\Infrastructure\Services\Factories\ApiManagerHelperFactory;
use LinkedDataSets\Infrastructure\Services\Factories\CatalogDumpServiceFactory;
use LinkedDataSets\Infrastructure\Services\Factories\DistributionServiceFactory;
use LinkedDataSets\Infrastructure\Services\Factories\FileCompressionServiceFactory;
use LinkedDataSets\Infrastructure\Services\Factories\ItemSetCrawlerFactory;
use LinkedDataSets\Infrastructure\Services\Factories\UriHelperFactory;

return [
    'service_manager' => [
        'factories' => [
            'LDS\DistributionService' => DistributionServiceFactory::class,
            'LDS\ItemSetCrawler' => ItemSetCrawlerFactory::class,
            'LDS\FileCompressionService' => FileCompressionServiceFactory::class,
            'LDS\ApiManagerHelper' => ApiManagerHelperFactory::class,
            'LDS\UriHelper' => UriHelperFactory::class,
            'LDS\CatalogDumpService' => CatalogDumpServiceFactory::class,
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
    'service_manager' => [
        'factories' => [
            'LinkedDataSets\LinkedDataSets' => Service\Stdlib\LinkedDataSetsFactory::class,
        ],
    ],
    'controllers' => [
        'invokables' => [
            'LinkedDataSets\Controller\Admin\Index' => Controller\Admin\IndexController::class,
        ],
        'factories' => [
            'LinkedDataSets\Controller\Admin\DistributionTemplate' => Service\Controller\Admin\DistributionTemplateControllerFactory::class,
        ],
    ],
    'navigation' => [
        'AdminModule' => [
            [
                'label' => 'Linked Data Sets', // @translate
                'route' => 'admin/linked-data-sets',
                'controller' => 'index',
                'action' => 'index',
                'resource' => 'LinkedDataSets\Controller\Admin\Index',
                'useRouteMatch' => true,
                'pages' => [
                    [
                        'route' => 'admin/linked-data-sets-template',
                        'visible' => false,
                    ],
                    [
                        'route' => 'admin/linked-data-sets-template/id',
                        'visible' => false,
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
                        'type' => Http\Literal::class,
                        'options' => [
                            'route' => '/linked-data-sets',
                            'defaults' => [
                                '__NAMESPACE__' => 'LinkedDataSets\Controller\Admin',
                                'controller' => 'index',
                                'action' => 'index',
                            ],
                        ],
                    ],
                    'linked-data-sets-template' => [
                        'type' => Http\Segment::class,
                        'options' => [
                            'route' => '/linked-data-sets/distribution-template/:action',
                            'constraints' => [
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'LinkedDataSets\Controller\Admin',
                                'controller' => 'distribution-template',
                                'action' => 'browse',
                            ],
                        ],
                        'may_terminate' => true,
                        'child_routes' => [
                            'id' => [
                                'type' => Http\Segment::class,
                                'options' => [
                                    'route' => '/:id',
                                    'constraints' => [
                                        'id' => '\d+',
                                    ],
                                ],
                            ],
                        ],
                    ],
                ],
            ],
        ],
    ],
];
