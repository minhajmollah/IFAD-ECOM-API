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

Route::group(['middleware' => ['auth:api', 'verified']], function () {
    Route::get('/orders', 'OrderController@index');
    Route::get('/orders/{id}/show', 'OrderController@show');
    Route::post('/orders', 'OrderController@store');
    Route::put('/orders/{id}/change-status', 'OrderController@changeStatus');

    Route::post('/orders/make-payment', 'OrderController@makePayment');
    Route::post('/orders/make-payment/{order_id}', 'OrderController@makePaymentForOrder');
});

Route::post('/orders/sslcommerz-callback/{order_id}', 'OrderController@handleCallback');
Route::post('/orders/sslcommerz-callback/secureurlasdfghjk/{order_id}/{status}', 'OrderController@handleCallbackForStatus');
