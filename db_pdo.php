<?php
require_once __DIR__ . '/config.php';

function connectDatabase(): \PDO
{
    return getPDO();
}
