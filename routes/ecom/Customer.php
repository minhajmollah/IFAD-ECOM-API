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
    Route::get('/customers', 'CustomerController@index');
    Route::get('/customers/{id}/show', 'CustomerController@show');
    Route::put('/customers', 'CustomerController@update');
    Route::get('/customers/addresses', 'CustomerController@getAddresses');
});
