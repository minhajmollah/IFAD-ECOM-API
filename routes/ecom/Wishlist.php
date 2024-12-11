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
    Route::get('/wishlist', 'WishlistController@index');
    Route::get('/wishlist/{id}/show', 'WishlistController@show');
    Route::post('/wishlist/sync', 'WishlistController@sync');
    Route::get('/wishlist/inventories/{inventoryId}/status', 'WishlistController@getInventoryStatus');
    Route::delete('/wishlist/{id}', 'WishlistController@destroy');
});
