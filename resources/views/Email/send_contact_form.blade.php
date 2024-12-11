<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Details</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

<div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px;">
    <div style="text-align: center; padding: 20px;">
        <h2 style="color: #333333;">Contact Request from ifadeshop.com</h2>
    </div>
    <div style="padding: 20px;">
        <p>Name: {{ $name }}</p>
        <h4>Email: {{ $email }}</h4>
        <h3>Subject: {{ $subject }}</h3>
        <p>Message: {{ $contactmessage }}</p>
    </div>
    {{-- <div style="text-align: center; padding: 20px; background-color: #f7f7f7;">
        <p style="color: #888888;">This is an automated email. Please do not reply.</p>
    </div> --}}
</div>

</body>
</html>
