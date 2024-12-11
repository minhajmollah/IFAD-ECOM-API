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
    Route::get('/addresses', 'AddressController@index');
    Route::get('/addresses/{id}/show', 'AddressController@show');
    Route::post('/addresses', 'AddressController@store');
    Route::put('/addresses/{id}', 'AddressController@update');
    Route::delete('/addresses/{id}', 'AddressController@destroy');
    Route::put('/addresses/{id}/default-shipping', 'AddressController@setDefaultShipping');
    Route::put('/addresses/{id}/default-billing', 'AddressController@setDefaultBilling');
});
