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

$sql = "SELECT id_event, title, date_time, description FROM articles ORDER BY date_time ASC;";
$result = $conn->query($sql);
$rows = array();
$ims = array();
$id = -1;
while($row = $result->fetch_assoc()) {
    $id = $row['id_event'];
    $sqlim = "SELECT photo FROM album WHERE id_event = '" . $id . "';";
    $resim = $conn->query($sqlim);
    while ($im = $resim->fetch_assoc()) {
		$ims[] = $im['photo'];
	}
	$row['photo'] = $ims;
	$rows[] = $row;
}

print json_encode($rows);
$conn->close();
?>