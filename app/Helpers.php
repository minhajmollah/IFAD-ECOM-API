<?php

use App\Models\Order;
use Illuminate\Support\Carbon;
use GuzzleHttp\Client;

/**
 * @return array[]
 */
function get_order_statuses()
{
    return [
        [
            'id' => Order::ORDER_STATUS_PENDING,
            'text' => "Pending"
        ],
        [
            'id' => Order::ORDER_STATUS_PROCESSING,
            'text' => "Processing"
        ],
        [
            'id' => Order::ORDER_STATUS_SHIPPED,
            'text' => "Shipped"
        ],
        [
            'id' => Order::ORDER_STATUS_DELIVERED,
            'text' => "Delivered"
        ],
        [
            'id' => Order::ORDER_STATUS_CANCELED,
            'text' => "Canceled"
        ]
    ];
}

/**
 * @param $id
 * @return string
 */
function get_order_status_name($id)
{
    $statuses = get_order_statuses();

    foreach ($statuses as $status) {
        if ($status['id'] == $id) {
            return $status['text'];
        }
    }

    return '';
}

function get_order_status()
{

    return 'pending';
}

/**
 * @return array[]
 */
function get_payment_statuses()
{
    return [
        [
            'id' => Order::PAYMENT_STATUS_PAID,
            'text' => "Paid"
        ],
        [
            'id' => Order::PAYMENT_STATUS_UNPAID,
            'text' => "Unpaid"
        ]
    ];
}

/**
 * @param $id
 * @return string
 */
function get_payment_status_name($id)
{
    $statuses = get_payment_statuses();

    foreach ($statuses as $status) {
        if ($status['id'] == $id) {
            return $status['text'];
        }
    }

    return '';
}

/**
 * @param string $message
 * @param array $result
 * @param int $code
 * @param string $redirect
 * @param string $delay
 * @return \Illuminate\Http\JsonResponse
 */
function make_success_response($message = '', $result = [], $code = 200, $redirect = '', $delay = '')
{
    $response = [
        'status' => True,
        'message' => $message
    ];

    if (!empty($result)) {
        $response['data'] = $result;
    }
    if (!empty($redirect)) {
        $response['redirect'] = $redirect;
    }
    if (!empty($delay)) {
        $response['delay'] = $delay;
    }

    return response()->json($response, $code);
}

/**
 * @param string $message
 * @param array $errors
 * @param int $code
 * @param string $redirect
 * @param string $delay
 * @return \Illuminate\Http\JsonResponse
 */
function make_error_response($message = '', $errors = [], $code = 404, $redirect = '', $delay = '')
{
    $response = [
        'status' => False,
        'message' => $message
    ];

    if (!empty($errors)) {
        $response['errors'] = $errors;
    }
    if (!empty($redirect)) {
        $response['redirect'] = $redirect;
    }
    if (!empty($delay)) {
        $response['delay'] = $delay;
    }

    return response()->json($response, $code);
}

/**
 * @param array $errors
 * @param string $message
 * @param int $code
 * @return \Illuminate\Http\JsonResponse
 */
function make_validation_error_response($errors = [], $message = 'The given data was invalid!', $code = 404, $redirect = '')
{
    $response = [
        'status' => False,
        'message' => $message,
        'errors' => $errors,
    ];

    if (!empty($redirect)) {
        $response['redirect'] = $redirect;
    }

    return response()->json($response, $code);
}

/**
 * @param null $timezone
 * @return Carbon
 */
function now($timezone = null)
{
    return Carbon::now($timezone);
}

#sms integration random number
if (!function_exists('generateRandomClientTransId')) {
    function generateRandomClientTransId($length = 15) {
        return \Illuminate\Support\Str::random($length);
    }
}

//random number generate
if (!function_exists('generateRandomOTP')) {
    function generateRandomOTP() {
        return rand(1111, 9999);
    }
}

if (!function_exists('makeHttpRequest')) {
    function makeHttpRequest($method, $url, $data = []) {
        try {
            $client = new Client();

            $options = [
                'json' => $data,
                'headers' => [
                    'Content-Type' => 'application/json',
                ],
            ];

            $response = $client->request($method, $url, $options);

            return [
                'success' => true,
                'response' => $response->getBody()->getContents(),
            ];
        } catch (\Exception $e) {
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }
}
