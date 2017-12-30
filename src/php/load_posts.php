<?php

function create_post($title, $datetime, $location, $description, $price, $photo){
    $partial = substr($description, 0, 200);
    echo "<div class='col-sm-2' >";
    echo "</div>";
    echo "<div class='col-sm-8 post1' >";
    echo "<div class='panel panel-default'>";
    echo "<div class='panel-heading'><h5 class=''> " . $title . "</h5> </div>";
    echo "<div class='col-sm-9'>";
    echo "<p class='post'>";
    echo $partial;
    echo "</p></div>";

    //part that appears and goes
    echo "<div id='container' style='display:none'>";
    echo $description;
    echo "<form id='new_form' action='' method='post'>";
    echo "<br>";
    echo "<label for='lastname'>Last name:</label>";
    echo "<input tooltip='Enter last name' id='lastname' class='form-control input-group-lg' type='text' name='lastname' placeholder='Last name required/>";
    echo "<br>";
    echo "<label for='firstname'>First name:</label>";
    echo "<input tooltip='Enter first name' id='firstname' class='form-control input-group-lg' type='text' name='firstname' placeholder='First name' required/>";
    echo "<br>";
    echo "<label for='email'>Email:</label>";
    echo "<input tooltip='Enter email' id='email' class='form-control input-group-lg' type='email' name='email' placeholder='Email address' required/>";
    echo "<br>";
    echo "<label for='tel'>Telephone</label>";
    echo "<input tooltip='Enter telephone number' id='tel' class='form-control input-group-lg' type='telephone' name='tel' placeholder=Telephone number' required/><br><br>";
    echo "<button type='submit' name='new_part' id='sub'>Submit data</button>";
    echo "</form>";
    echo "</div>";
    //end of 

    echo "<div class='col-sm-3 post1 centercontainer'><img src='slide2.jpg' width= '200px' ></div>";
    echo "<p class='centercontainer post'><button type='button' class='btn btn-success' onclick='toggle();'>Read more</button></p>";
    echo "</div>";
    echo "</div>";
    echo "<div class='col-sm-2'>";
    echo "</div>";
}

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

$sql = "SELECT name, date_time, location, description, price, photo FROM events WHERE past_date = 0;";
$result = $conn->query($sql);
$rows = array();
while($row = $result->fetch_assoc()) {
    $rows[] = $row;
	//create_post($row['name'], $row['date_time'], $row['location'], $row['description'], $row['price'], $row['photo']);
}
print json_encode($rows);
$conn->close();
?>