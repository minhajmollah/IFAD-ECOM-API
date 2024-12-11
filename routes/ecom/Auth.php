<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register', 'AuthController@register');
Route::post('/login', 'AuthController@login');
Route::post('/forgot-password', 'AuthController@forgotPassword');
Route::post('/reset-password', 'AuthController@resetPassword');

Route::post('/send-otp-via-email', 'AuthController@sendOtpViaEmail');
Route::post('/verify-otp-via-email', 'AuthController@verifyOtpViaEmail');

Route::post('/send-otp-via-phone', 'AuthController@sendOtpViaPhone');
Route::post('/verify-otp-via-phone', 'AuthController@verifyOtpViaPhone');
Route::post('/verify-password-with-phone', 'AuthController@login');

Route::group(['middleware' => ['auth:api']], function () {
    Route::post('/verification-notification', 'AuthController@verificationNotificationLink');
    Route::post('/verify-email/{token}', 'AuthController@verifyEmail');

    Route::put('/change-password', 'AuthController@changePassword');
    Route::post('/logout', 'AuthController@logout');
});

/**
 * Social Login
 */

include "social-login/Google.php";
include "social-login/Facebook.php";
