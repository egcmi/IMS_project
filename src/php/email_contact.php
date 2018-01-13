<?php

set_include_path('../libs');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require_once 'PHPMailer/src/Exception.php';
require_once 'PHPMailer/src/PHPMailer.php';
require_once 'PHPMailer/src/SMTP.php';



function send_email($subj, $email, $contenthtml, $contentsimple){

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

    $mail->setFrom($fromem, 'UniScout Team');
    $mail->addAddress($email);

    $mail->isHTML(true);
    $mail->Subject = $subj;
	$mail->Body    = $contenthtml;

	$mail->AltBody = $contentsimple;

    $mail->send();
}

if(isset($_REQUEST)){

	$name=$_POST['name'];
	$email=$_POST['email'];
	$comment=$_POST['comments'];
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
          echo '<You are spammer ! ';
        }

	$bodyhtml = "
	Hi {$name}!<br>
	Thank you for contacting us. We will get back to you as soon as possible.<br>
	Here is what you wrote:<br>
	<p><i>$comment</i><p>
	If you wish to add more information, simply reply to this email.<br>
	Cheers!<br>
	Your UniScout Team
	";

	$bodysimple = "Hi {$name}! Thank you for contacting us. We will get back to you as soon as possible. Here is what you wrote: \"{$comment}\" If you wish to add more information, simply reply to this email. Cheers! Your UniScout Team";

try{
		send_email("Message from: {$name} <{$email}>", "uniscoutbz@gmail.com", $comment, $comment);
		send_email("Your message to UniScout", $email, $bodyhtml, $bodysimple);
	    echo 'Thank you! We have received your message.';
	}catch(Exception $e){
		echo 'Message could not be sent. Please try again.';
	    //echo 'Mailer Error: ' . $mail->ErrorInfo;
	}

}

?>