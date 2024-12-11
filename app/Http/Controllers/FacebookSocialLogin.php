<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Tymon\JWTAuth\Facades\JWTAuth;

class FacebookSocialLogin extends Controller
{
    /**
     * @return string|void
     */
    public function login()
    {


        try {
            $url = config('services.facebook.auth_uri') . '?' . http_build_query([
                    'client_id' => config('services.facebook.client_id'),
                    'redirect_uri' => config('services.facebook.redirect_uri'),
                    'response_type' => 'code',
                    'scope' => 'openid profile email',
                    'state' => config('services.facebook.state'),
                ]);

            return response()->json([
                'url' => $url
            ]);
        } catch (\Exception $exception) {
            report($exception);

            make_error_response($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|void
     */
    public function callback(Request $request)
    {
        try {
            if ($request->input('state') !== config('services.facebook.state')) {
                throw new \Exception("Invalid state parameter.");
            }

            $code = $request->input('code');

            $tokenResponse = Http::withOptions([
                'verify' => env('APP_ENV') === 'local'
            ])->post(config('services.facebook.token_uri'), [
                'code' => $code,
                'client_id' => config('services.facebook.client_id'),
                'client_secret' => config('services.facebook.client_secret'),
                'redirect_uri' => config('services.facebook.redirect_uri'),
                'grant_type' => 'authorization_code',
            ]);

            $accessToken = optional($tokenResponse)['access_token'];

            $customerResponse = Http::withHeaders([
                'Authorization' => 'Bearer ' . urlencode($accessToken),
            ])->withOptions([
                'verify' => env('APP_ENV') === 'local'
            ])->get(config('services.facebook.userinfo_uri'));


            $name = optional($customerResponse)['name'];
            $email = optional($customerResponse)['email'];

            $customer = Customer::where('email', $email)->first();

            if (!$customer) {
                $customer = Customer::create([
                    'name' => $name,
                    'email' => $email,
                    'password' => Hash::make('password'),
                    'email_verified_at' => now(),
                ]);
            }

            Auth::login($customer);

            $token = JWTAuth::fromUser($customer);
            if (!$token) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }
            $customerId=Auth::user()->id;

            $groups = DB::table('coupon_user_groups')->select('id','group_name')
            ->where('status',1)
            ->whereRaw("JSON_CONTAINS(customer_id, '\"$customerId\"')")
            ->get();

            return make_success_response("Login successfully.", [
                'token' => 'Bearer ' . $token,
                'customer' => Auth::user(),
                'group' => $groups,
                'expires_in' => Auth::factory()->getTTL() * 60 * 24,
            ]);
        } catch (\Exception $exception) {
            report($exception);

            make_error_response($exception->getMessage());
        }
    }
}
