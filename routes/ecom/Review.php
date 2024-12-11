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

// Get reviews
Route::get('/reviews', 'ReviewController@index');
Route::get('/reviews/inventories/{inventoryId}', 'ReviewController@getReviewsByInventory');
Route::get('/inventories/{inventoryId}/reviews/ability', 'ReviewController@checkInventoryReviewCapability');
Route::get('/combos/{comboId}/reviews/ability', 'ReviewController@checkComboReviewCapability');

// Authenticated routes
Route::group(['middleware' => ['auth:api', 'verified']], function () {
    Route::post('/reviews', 'ReviewController@store');
    Route::get('/reviews/{id}/show', 'ReviewController@show');
    Route::delete('/reviews/{id}', 'ReviewController@destroy');
});

