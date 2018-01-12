<?php

set_include_path('../libs');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';



function send_email($subj, $email, $content){

	$fromem = 'uniscoutbz@gmail.com'; 
	$fromps = 'CsBz201518';
	$mail = new PHPMailer(true);	
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
    $mail->Subject = $subj;
	$mail->Body    = $content;

	$mail->AltBody = $content;

    $mail->send();
}

if(isset($_REQUEST)){

	$name=$_POST['name'];
	$email=$_POST['email'];
	$comment=$_POST['comments'];

	$body = "Hi {$name}! Thank you for contacting us. We are going to get back to you within a couple of days.";

	try{
		send_email("You received an email from: {$name}, with the address: {$email}", "uniscoutbz@gmail.com", $comment);
		send_email("Automatically generated response", $email, $body);
	    echo 'Message has been sent';
	}catch(Exception $e){
		echo 'Message could not be sent. Please try again.';
	    //echo 'Mailer Error: ' . $mail->ErrorInfo;
	}

}

?>