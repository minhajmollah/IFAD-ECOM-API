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

Route::get('/combos', 'ComboController@index');
Route::get('/combos/{id}/show', 'ComboController@show');
Route::get('/combos/combo-categories/{comboCategoryId}', 'ComboController@getByComboCategory');
Route::get('/combos/search', 'ComboController@search');
