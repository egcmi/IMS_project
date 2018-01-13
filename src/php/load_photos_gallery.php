<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "uniscout";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT title, photo FROM events";
$result = $conn->query($sql);
$rows1 = array();
while($row = $result->fetch_assoc()) {
    $rows1[] = $row;
}

$sql = "SELECT title, photo FROM album";
$result = $conn->query($sql);
$rows2 = array();
while($row = $result->fetch_assoc()) {
    $rows2[] = $row;
}

print json_encode(array_merge($rows1, $rows2));
$conn->close();
?>