// set up PHPMailer
$mail = new PHPMailer();
$mail->SetFrom('you@yourserver.com');
$mail->AddReplyTo('you@somewhereelse.com');
$mail->Subject('Your profile');
$mail->IsHTML(TRUE);

// do your database query
$con = connect_to_database();
$stmt = run_database_query($con, "SELECT ... FROM ...");

$data = fetch_from_database($stmt);


// set the email address
$mail->AddAddress($data['email'], $data['fullname']);


// html content for smart email clients
$html = <<<EOL
<h1>Welcome</h1>

<p>Your username is {$data['username']}.</p>
EOL;

// plain text alternate content
$text = <<<EOL
Welcome

Your username is {$data['username']}.
EOL;

// add the content to the mail
$mail->MsgHTML($html);
// add alternate content 
$mail->AltBody($text);


// send the mail
if ($mail->Send()) {
   // mail sent correctly
} else {
   die("Uhoh, could not send to {$mail['email']}:" . $mail->ErrorInfo);
}