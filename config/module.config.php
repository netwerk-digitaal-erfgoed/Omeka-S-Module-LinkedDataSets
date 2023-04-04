<?php

namespace LinkedDataSets;

return [
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
];
