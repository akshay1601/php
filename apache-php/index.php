<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
</head>
<body>
    <h1>Login</h1>
    <form action="login.php" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>

<?php

// $host = 'db';
// $user = 'root';
// $pass = 'password';

$host = getenv('DB_HOST');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');

$conn = new mysqli($host, $user, $pass);
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
} else {
   echo "Connected to MySQL server successfully!";
}
?>


