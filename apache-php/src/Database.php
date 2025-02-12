<?php
// src/Database.php

namespace MyApp;

use Dotenv\Dotenv;
use PDO;
use PDOException;

class Database
{
    private $connection;

    public function __construct()
    {
        // Load .env file
        $dotenv = Dotenv::createImmutable(_DIR_ . '/..');
        $dotenv->load();

        // Get database credentials from .env
        $host = $_ENV['DB_HOST'];
        $dbname = $_ENV['DB_NAME'];
        $user = $_ENV['DB_USER'];
        $password = $_ENV['DB_PASSWORD'];

        // Create PDO connection
        try {
            $this->connection = new PDO(
                "mysql:host=$host;dbname=$dbname",
                $user,
                $password
            );
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Database connection failed: " . $e->getMessage());
        }
    }

    public function getConnection()
    {
        return $this->connection;
    }
}