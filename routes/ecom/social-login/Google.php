<?php

use Illuminate\Support\Facades\Route;

Route::get('/login/google', 'GoogleSocialLogin@login');
Route::get('/login/google/callback', 'GoogleSocialLogin@callback');
