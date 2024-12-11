<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>B2B Inquiry Details</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

<div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px;">
    <div style="text-align: center; padding: 20px;">
        <h2 style="color: #333333;">B2B Inquiry from ifadeshop.com</h2>
    </div>
    <div style="padding: 20px;">
        <p>Country Name: {{ $country_name }}</p>
        <p>Name: {{ $name }}</p>
        <p>Product Name: {{ $product_name }}</p>
        <p>Product Code: {{ $product_code }}</p>
        <p>Product Quantity: {{ $product_quantity }}</p>
        <p>Contact Number: {{ $contact_number }}</p>
        <p>Email Address: {{ $email_address }}</p>
    </div>
    {{-- <div style="text-align: center; padding: 20px; background-color: #f7f7f7;">
        <p style="color: #888888;">This is an automated email. Please do not reply.</p>
    </div> --}}
</div>

</body>
</html>
