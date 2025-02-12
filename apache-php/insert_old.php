<?php
$host = 'db';
$dbn = 'phpapp';
$user = 'root';
$pass = 'password';

// $host = $_ENV['DB_HOST'];
// $dbn = $_ENV['DB_NAME'];
// $user = $_ENV['DB_USER'];
// $pass = $_ENV['DB_PASSWORD'];

$conn = new mysqli($host, $user, $pass,$dbn);
if(isset($_POST['submit']))
{
  $name = $_POST['name'];
  $email = $_POST['email'];
  $mobile = $_POST['mobile'];
  $sql = "INSERT INTO users (name,email,mobile)VALUES    ('$name','$email','$mobile')";
if (mysqli_query($conn, $sql)) {
echo "New record has been added successfully !";
} 
else {
echo "Error: " . $sql . ":-" . mysqli_error($conn);
}
mysqli_close($conn);
}
?>
