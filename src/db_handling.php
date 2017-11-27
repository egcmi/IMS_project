<html>

<head>
<title>Students</title>
<script>
    $(document).ready(function(){
        $("new").hide();
        $("button").click(function(e) {
            $("new").show();
            $("button").hide();

        });
    });
</script>
</head>

<body>
<div id='table'>
<?php

function create_table($string, $value){
	echo "<tr>";
    echo "<td width='50%' bgcolor='#EAE9FF' align='right'>";
    echo $string;
    echo "</td>";
    echo "<td width='50%' bgcolor='#EAE9FF'>";
    echo $value;
    echo "</td>";
    echo "</tr>";
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "school";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 



$sql = "SELECT id, surname, first_name, address, telephone FROM students";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
    	echo "<table align='center'>";
    	create_table("Student id", $row['id']);
    	create_table("Student Surname", $row['surname']);
    	create_table("Student Name", $row['first_name']);
    	create_table("Address", $row['address']);
    	create_table("Telephone", $row['telephone']);
    	echo "<br>";
		echo "</table>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>
</body>
</html>