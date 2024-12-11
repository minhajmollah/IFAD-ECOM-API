<?php

return [
    'providers' => [
    Laravel\Socialite\SocialiteServiceProvider::class,
],
'aliases' => [
    'Socialite' => Laravel\Socialite\Facades\Socialite::class,
],
    'env' => env('APP_ENV', 'production'),
    'frontend_url' => env('FRONTEND_URL', 'http://localhost:3000'),
    'locale' => env('APP_LOCALE', 'en'),
    'banglalink_sms_api_endpoint' => env('BANGLALINK_SMS_API_ENDPOINT'), //sms api endpoint
    'banglalink_sms_username' => env('BANGLALINK_SMS_USERNAME'), //sms api username
    'banglalink_sms_password' => env('BANGLALINK_SMS_PASSWORD'), //sms api password
    'banglalink_sms_apicode' => env('BANGLALINK_SMS_APICODE'), //sms api code
    'banglalink_sms_cli' => env('BANGLALINK_SMS_CLI'), //sms api code
];
#sms integration credentials

