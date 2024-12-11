<?php

use Illuminate\Support\Facades\Route;

Route::get('/login/facebook', 'FacebookSocialLogin@login');
Route::get('/login/facebook/callback', 'FacebookSocialLogin@callback');