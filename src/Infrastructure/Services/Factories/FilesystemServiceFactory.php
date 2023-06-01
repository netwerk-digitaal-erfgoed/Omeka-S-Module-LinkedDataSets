<?php

declare(strict_types=1);

namespace LinkedDataSets\Infrastructure\Services\Factories;

use Laminas\ServiceManager\Factory\FactoryInterface;
use LinkedDataSets\Infrastructure\Services\FileCompressionService;
use LinkedDataSets\Infrastructure\Services\FilesystemService;
use Psr\Container\ContainerInterface;

final class FilesystemServiceFactory implements FactoryInterface
{
    public function __invoke(
        ContainerInterface $container,
        $requestedName,
        array $options = null
    ): FilesystemService {
        return new FilesystemService();
    }
}
