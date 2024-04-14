<?php
if(isset($_POST['send_email'])) {
    // Function to send email
    function sendEmail() {
        $to = "recipient@example.com";
        $subject = "Test Email";
        $message = "This is a test email.";

        // Additional headers
        $headers = "From: sender@example.com\r\n";
        $headers .= "Reply-To: sender@example.com\r\n";
        $headers .= "CC: cc@example.com\r\n";
        $headers .= "BCC: bcc@example.com\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

        // Send email
        if(mail($to, $subject, $message, $headers)) {
            echo "Email sent successfully!";
        } else {
            echo "Email sending failed.";
        }
    }

    // Call the function to send email
    sendEmail();
}
?>
