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

function send_email($email, $name, $surname){
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
	    $mail->addReplyTo($email, 'Information');

	    $mail->isHTML(true);
	    $mail->Subject = 'About your next trip with Uniscout';
	    $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
	    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

	    $mail->send();
	    echo 'Message has been sent';
	} catch (Exception $e) {
	    echo 'Message could not be sent.';
	    //echo 'Mailer Error: ' . $mail->ErrorInfo;
	}
}

if(isset($_REQUEST)){
	$conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error) {
    	die("Connection failed: " . $conn->connect_error);
	}

	$id_event=$_POST['id'];
	$name=$_POST['firstname'];
	$surname=$_POST['lastname'];
	$phone_number=$_POST['tel'];
	$email_address=$_POST['email'];
	$sql="INSERT INTO participants(id_event, name, surname, phone_number, email_address) VALUES ('$id_event', '$name', '$surname', '$phone_number' ,'$email_address');";

	$result = $conn->query($sql);

	if($result > 0){
		echo "You have been successfully added! You should receive a mail from us in a bit. If not, please email us on uniscoutbz@gmail.com.";
		send_email($email_address, $name, $surname);
	} else if($result == 0){
		echo "This email is already registered for this event.";
	}else{
		echo "Something went wrong, please try again.";
	}

	$conn->close();
}


?>