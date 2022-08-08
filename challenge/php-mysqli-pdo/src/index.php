<?php
$conn = new mysqli('db', 'user', 'passwd', 'db');

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

echo 'connected';