<?php

declare(strict_types=1);

namespace LinkedDataSets\Infrastructure\Services;

use FilesystemIterator;
use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;

final class FilesystemService
{

    public function createTemporaryFolder(): string
    {
        $dir = sys_get_temp_dir();
        $tmp = uniqid('lds_');
        $path = $dir.'/'.$tmp;
        mkdir($path);

        return $path;
    }

    public function cleanUp(string $folder): void
    {
        $iterator = new RecursiveDirectoryIterator($folder, FilesystemIterator::SKIP_DOTS);
        $files = new RecursiveIteratorIterator(
            $iterator, RecursiveIteratorIterator::CHILD_FIRST
        );

        foreach ($files as $file) {
            if ($file->isDir()) {
                rmdir($file->getRealPath());
            } else {
                unlink($file->getRealPath());
            }
        }

        rmdir($folder);
    }
}