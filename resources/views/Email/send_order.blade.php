<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">
<table style="width: 100%; max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px;">
    <tr>
        <td style="text-align: center; padding: 20px;">
            <h2 style="color: #333333;">Order Confirmation from ifadeshop.com</h2>
        </td>
    </tr>
    <tr>
        <td style="padding: 20px;">
            <p>Dear {{ $customer_name }},</p>
            <p>Thank you for your order! We're excited to let you know that your order has been confirmed and is being
                processed.</p>
            <h2>Order Details:</h2>
            <h4>Order ID: {{ $invoice_id }}</h4>
            <table style="width: 100%; border-collapse: collapse;">
                <thead>
                <tr>
                    <th style="border: 1px solid #dddddd; padding: 8px; text-align: left;">Product</th>
                    <th style="border: 1px solid #dddddd; padding: 8px; text-align: left;">Quantity</th>
                    <th style="border: 1px solid #dddddd; padding: 8px; text-align: center;">Price</th>
                </tr>
                </thead>
                <tbody>
                @foreach($orderItems as $orderItem)
                    <tr>
                        @if($orderItem->type === 'product')
                            <td style="border: 1px solid #dddddd; padding: 8px;">{{ optional($orderItem->inventory)->title }}</td>
                        @elseif($orderItem->type === 'combo')
                            <td style="border: 1px solid #dddddd; padding: 8px;">{{ optional($orderItem->combo)->title }}</td>
                        @endif
                        <td style="border: 1px solid #dddddd; padding: 8px;">{{ $orderItem->quantity }} Tk</td>
                        <td style="border: 1px solid #dddddd; padding: 8px; text-align: center;">{{ $orderItem->unit_price }} Tk</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            <p style="text-align: right; margin-top: 10px; margin-right:10px;">Sub Total: {{ $sub_total }} Tk</p>
            <p style="text-align: right; margin-top: 10px; margin-right:10px;">Shipping Charge: {{ $shipping_charge }} Tk</p>
            <p style="text-align: right; margin-top: 10px; margin-right:10px;"><strong>Total: {{ $grand_total }} Tk</strong></p>
            <p>Your order will be shipped to:</p>
            <p>{{ $shipping_address }}</p>
            <p>If you have any questions about your order, feel free to contact our customer support at
                ifadeshop@ifadgroup.com</p>
            <p>Thank you for shopping with us!</p>
            <p>Best regards,<br>IFAD ESHOP</p>
        </td>
    </tr>
    <tr>
        <td style="text-align: center; padding: 20px; background-color: #f7f7f7;">
            <p style="color: #888888;">This is an automated email. Please do not reply.</p>
        </td>
    </tr>
</table>
</body>
</html>
