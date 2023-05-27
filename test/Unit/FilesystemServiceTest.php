<?php

declare(strict_types=1);

namespace Unit;
use LinkedDataSets\Infrastructure\Services\FilesystemService;
use PHPUnit\Framework\TestCase;

class FilesystemServiceTest extends TestCase
{
    protected $filesystemService;
    protected $temporaryFolder;

    protected function setUp(): void
    {
        $this->filesystemService = new FilesystemService();
        $this->temporaryFolder = $this->filesystemService->createTemporaryFolder();
    }

    public function testCreateTemporaryFolder()
    {
        $this->assertDirectoryExists($this->temporaryFolder);
    }

    public function testCleanup()
    {
        $filePath = $this->temporaryFolder . '/test.txt';
        file_put_contents($filePath, 'Test file');

        $this->assertFileExists($filePath);

        $this->filesystemService->cleanUp($this->temporaryFolder);

        $this->assertDirectoryDoesNotExist($this->temporaryFolder);
    }
}
