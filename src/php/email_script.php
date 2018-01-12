<?php

set_include_path('../libs');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "uniscout";

function send_email($title, $time, $date, $description, $location, $photo, $name, $surname,$email){
	$fromem = 'uniscoutbz@gmail.com'; 
	$fromps = 'CsBz201518';
	$mail = new PHPMailer(true);
	try {		
	    //$mail->SMTPDebug = 2;
	    $mail->isSMTP();
	    $mail->Host = 'smtp.gmail.com';
	    $mail->SMTPAuth = true;
	    $mail->Username = $fromem;
	    $mail->Password = $fromps;
	    $mail->SMTPSecure = 'tls';
	    $mail->Port = 587;
	    $mail->SMTPOptions = array(
		    'ssl' => array(
		        'verify_peer' => false,
		        'verify_peer_name' => false,
		        'allow_self_signed' => true
		    )
		);

	    $mail->setFrom($fromem, 'Uniscout Team');
	    $mail->addAddress($email);

	    $mail->isHTML(true);
	    $mail->Subject = "Pack up! We're going to {$location}";
	    $mail->Body    = 'Your trip is tomorrow!';
	    $mail->AltBody = 'Your trip is tomorrow!';

	    $mail->send();
	    echo 'Message has been sent';
	} catch (Exception $e) {
	    echo 'Message could not be sent.';
	    //echo 'Mailer Error: ' . $mail->ErrorInfo;
	}
}

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
   	die("Connection failed: " . $conn->connect_error);
}

$sql="SELECT events.id_event, title, TIME(date_time) as time, DATE(date_time) as date, description, location, photo, name, surname, email_address FROM events, participants WHERE DATE(date_time)-CURRENT_DATE() = 1 AND events.id_event = participants.id_event;";

$result = $conn->query($sql);

if(($result->num_rows) > 0){
	while($row = $result->fetch_assoc()) {
	    send_email($row['title'], $row['time'], $row['date'], $row['description'], $row['location'], $row['photo'], $row['name'], $row['surname'], $row['email_address']);
	}
}

$conn->close();
?>