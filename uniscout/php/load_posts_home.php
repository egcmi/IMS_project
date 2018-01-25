<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "uniscout";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT id_event, title, date_time, location, description, photo FROM events WHERE date_time > CURRENT_TIME() ORDER BY date_time ASC;";
$result = $conn->query($sql);
$rows = array();
while($row = $result->fetch_assoc()) {
    $rows[] = $row;
}
print json_encode($rows);
$conn->close();
?>