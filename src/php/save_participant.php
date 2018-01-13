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

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

function send_email($email, $name, $surname, $id_event){
	$fromem = 'uniscoutbz@gmail.com'; 
	$fromps = 'CsBz201518';
	$mail = new PHPMailer(true);

	global $conn;
	$sql = "SELECT title, DATE(date_time) as date, TIME(date_time) as time, location, description, photo FROM events WHERE id_event = {$id_event};";
	$result = $conn->query($sql);

	$row = $result->fetch_assoc();
	$title = $row['title'];
	$date = $row['date'];
	$time = $row['time'];
	$location = $row['location'];
	$description = $row['description'];
	$photo = $row['photo'];
	$time = substr($time, 0, 5);

	$nice_date = "";
	$day = (int)substr($date, 8, 9);
	switch($day){
		case 1:
		case 21:
		case 31:
		$nice_date .= "{$day}st ";
		break;

		case 2:
		case 22:
		$nice_date .= "{$day}nd ";
		break;

		case 3:
		case 23:
		$nice_date .= "{$day}rd ";
		break;

		default:
		$nice_date .= "{$day}th ";
	}

	$month = (int)substr($date, 5, 6);
	switch ($month) {
		case 1:
		$nice_date .= "January";
		break;

		case 2:
		$nice_date .= "February";
		break;

		case 3:
		$nice_date .= "March";
		break;

		case 4:
		$nice_date .= "April";
		break;

		case 5:
		$nice_date .= "May";
		break;

		case 6:
		$nice_date .= "June";
		break;

		case 7:
		$nice_date .= "July";
		break;

		case 8:
		$nice_date .= "August";
		break;

		case 9:
		$nice_date .= "September";
		break;

		case 10:
		$nice_date .= "October";
		break;

		case 11:
		$nice_date .= "November";
		break;

		case 12:
		$nice_date .= "December";
	}

	$nice_date .= " " . substr($date, 0, 4);

	try {
		
	   //$mail->SMTPDebug = 2; //send error messages
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

		$mail->setFrom($fromem, 'UniScout Team');
		$mail->addAddress($email);
		$mail->isHTML(true);
		$mail->Subject = 'About your next event with UniScout';
		$mail->Body    =
		"
		<!DOCTYPE html>
		<html lang='en'>
		<head>
		<title>Message from UniScout</title>
		<meta charset='utf-8'>
		<meta name='viewport' content='width=device-width, initial-scale=1'>
		</head>
		<body>
		<table style='font-family: helvetica, sans serif; width: 100%'>
		<thead>
		<tr>
		<th colspan='3' style='background-color: #99CB38'><img src='https://i.imgur.com/htYlt9D.png' height='30%' alt='UniScout logo'>
		</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td style='width: 20%'/>
		<td>
		<h1 align='center'>Hi <b>{$name} {$surname}</b>!</h1>
		<p align='center'>
		You have successfully registered for <b>{$title}</b> and we are happy to have you for our upcoming event.
		<br> 
		We plan to meet <b>on {$nice_date} at {$time} at the University Square in Bolzano</b> to go to {$location}.<br></p>
		<h2 align='center'>Here's some more info:</h2>
		<p><i>{$description}</i></p>
		<p align='center'><img src='{$photo}' alt='{$title}' width='90%'></p>
		<p>
		You are receiving this because you expressed interest in some event at our website UniScout. We might use the email address and/or phone number that you provided us to notify of updates or get in touch with you prior to the event.<br>
		If you have any questions, feel free to contact us via <a href='http://localhost/uniscout/contact.html'>our contact form</a> or by replying to this email.<br>
		<br>
		Cheers!<br>
		<i>Your UniScout Team</i>
		</p>
		</td>
		<td style='width: 20%'/>
		</tr>
		</tbody>
		</table>
		</body>
		</html>
		";

		$mail->AltBody = "Hi {$name} {$surname}! You have successfully registered for {$title} and we are happy to have you for our upcoming event. We plan to meet on {$nice_date} at {$time} at the University Square in Bolzano to go to {$location}. Here's some more info: {$description} You are receiving this because you expressed interest in some event at our website UniScout. We might use the email address and/or phone number that you provided us to notify of updates or get in touch with you prior to the event. If you have any questions, feel free to contact us via our contact form or by replying to this email. Cheers! Your UniScout Team";


		$mail->send();
	    //echo ' Message has been sent';
	} catch (Exception $e) {
		echo ' Message could not be sent.';
	    //echo 'Mailer Error: ' . $mail->ErrorInfo; // send error messages
	}
}

if(isset($_REQUEST)){

	$id_event=$_POST['id'];
	$name=$_POST['firstname'];
	$surname=$_POST['lastname'];
	$phone_number=$_POST['tel'];
	$email_address=$_POST['email'];
	$captcha=$_POST['g-recaptcha-response'];
        
    if(!$captcha){
      echo 'Please check the the captcha form.';
      exit;
    }
	$secretKey = "6LfofkAUAAAAAOQPWeI1fOkT5StWsoPNy2dCuhKk";
	$ip = $_SERVER['REMOTE_ADDR'];
        $response=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
        if(intval($responseKeys["success"]) !== 1) {
          echo 'You are spammer ! ';
        }
	$sql="INSERT INTO participants(id_event, name, surname, phone_number, email_address) VALUES ('$id_event', '$name', '$surname', '$phone_number' ,'$email_address');";

	$result = $conn->query($sql);

	if($result > 0){
		echo "You have been successfully added! You should receive a mail from us in a bit. If not, please email us on uniscoutbz@gmail.com.";
		send_email($email_address, $name, $surname, $id_event);
	} else if($result == 0){
		echo "This email is already registered for this event.";
	}else{
		echo "Something went wrong, please try again.";
	}

	$conn->close();
}


?>