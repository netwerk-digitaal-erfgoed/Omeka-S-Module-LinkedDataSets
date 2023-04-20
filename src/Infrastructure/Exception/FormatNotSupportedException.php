<?php

declare(strict_types=1);

namespace LinkedDataSets\Infrastructure\Exception;
final class FormatNotSupportedException extends \Exception
{
    public string $format;
}