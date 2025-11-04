<?php
$host = "localhost";      // MySQL server
$user = "root";           // default XAMPP MySQL user
$pass = "";               // default XAMPP MySQL password
$db   = "CarRentalDB";    // your actual database name

// Create connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
// Optional for testing
// echo "✅ Connected to MySQL!";
?>