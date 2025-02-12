<?php
// login.php

require _DIR_ . '/vendor/autoload.php';

use MyApp\Database;

// Start session
session_start();

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Validate input
    if (empty($username) || empty($password)) {
        die("Please fill in all fields.");
    }

    // Connect to the database
    $db = new Database();
    $connection = $db->getConnection();

    // Fetch user from the database
    $stmt = $connection->prepare("SELECT * FROM users WHERE username = :username");
    $stmt->execute(['username' => $username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verify password
    if ($user && password_verify($password, $user['password'])) {
        // Login successful
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        echo "Login successful! Welcome, " . $user['username'];
    } else {
        // Login failed
        echo "Invalid username or password.";
    }
}