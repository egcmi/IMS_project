<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "uniscout";


if(isset($_REQUEST)){
	$conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error) {
    	die("Connection failed: " . $conn->connect_error);
	}

	$id_event=1;
	$full_name=$_POST['lastname'];
	$phone_number=$_POST['tel'];
	$email_address=$_POST['email'];
	$sql="INSERT INTO partecipants(id_event, full_name, phone_number, email_address) VALUES ('$id_event', '$full_name', '$phone_number' ,'$email_address')";
	//change to name and surname in DB
	$result = $conn->query($sql);
	if($result){
		echo "User added successfully";
	}else{
		echo "Something went wrong, please try again.";
	}
	$conn->close();
}


?>