<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'google' => [
        'client_id' => env('GOOGLE_CLIENT_ID', ''),
        'client_secret' => env('GOOGLE_CLIENT_SECRET', ''),
        'redirect_uri' => env('GOOGLE_REDIRECT_URI', ''),
        'auth_uri' => 'https://accounts.google.com/o/oauth2/auth',
        'token_uri' => 'https://oauth2.googleapis.com/token',
        'userinfo_uri' => 'https://www.googleapis.com/oauth2/v3/userinfo',
        'state' => '5=ZuSnY&xBXEgXT6',
    ],

    'facebook' => [
        'client_id' => env('FACEBOOK_APP_ID', ''),
        'client_secret' => env('FACEBOOK_APP_SECRET', ''),
        'redirect_uri' => env('FACEBOOK_REDIRECT_URI', ''),
        'auth_uri' => 'https://www.facebook.com/dialog/oauth',
        'token_uri' => 'https://graph.facebook.com/v13.0/oauth/access_token',
        'userinfo_uri' => 'https://graph.facebook.com/v13.0/me',
        // Fields to retrieve from the user profile, e.g., 'name,email,picture'
        'fields' => 'name,email',
        'state' => '5=ZuSnY&xBXEgXT7',
      
    ],


];
