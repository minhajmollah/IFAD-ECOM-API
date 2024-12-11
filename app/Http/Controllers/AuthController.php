<?php

namespace App\Http\Controllers;

use App\Mail\SendOtpEmailNotification;
use App\Mail\SendPasswordResetLink;
use App\Mail\SendVerificationNotificationLink;
use App\Mail\SendVerifiedEmailNotification;
use App\Models\Customer;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use GuzzleHttp\Client;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;

use function generateRandomClientTransId;
use function generateRandomOTP;
use function makeHttpRequest;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => ['required'],
                'email' => ['required', 'email', 'unique:customers,email'],
                'phone_number' => ['required', 'string', 'unique:customers,phone_number'],
                'password' => 'required|min:6|confirmed',
                'password_confirmation' => 'required|min:6',
                'agree' => ['required'],
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $customer = new Customer();
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone_number = $request->phone_number;
            $customer->password = Hash::make($request->password);
            $customer->save();

            $credentials = $request->only(['email', 'password']);

            if (!$token = Auth::attempt($credentials)) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }
            $customerId=Auth::user()->id;

            $groups = DB::table('coupon_user_groups')->select('id','group_name')
            ->where('status',1)
            ->whereRaw("JSON_CONTAINS(customer_id, '\"$customerId\"')")
            ->get();


            return make_success_response("Login successfully.", [
                'token' => 'Bearer ' . $token,
                'customer' => auth()->user(),
                'group' => $groups,
                'expires_in' => auth()->factory()->getTTL() * 60 * 24,
            ]);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function login(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'password' => ['required'],
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $email = $request->input('email');
            $request->input('phone_number');

            if ($email) {
                $credentials = $request->only(['email', 'password']);
            } else {
                $credentials = $request->only(['phone_number', 'password']);
            }



            //$credentials = $request->only(['email', 'password']);



            if ($request->remember) {
                if (!$token = Auth::attempt($credentials, true)) {
                    return response()->json(['message' => 'Unauthorized'], 401);
                }
            } else {

                if (!$token = Auth::attempt($credentials)) {
                    return response()->json(['message' => 'Unauthorized'], 401);
                }
            }

            $customerId=Auth::user()->id;

            $groups = DB::table('coupon_user_groups')->select('id','group_name')
            ->where('status',1)
            ->whereRaw("JSON_CONTAINS(customer_id, '\"$customerId\"')")
            ->get();

            return make_success_response("Login successfully.", [
                'token' => 'Bearer ' . $token,
                'customer' => auth()->user(),
                'group' => $groups,
                'expires_in' => auth()->factory()->getTTL() * 60 * 24,
            ]);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function changePassword(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'current_password' => 'required|string|min:6',
                'password' => 'required|string|min:6|confirmed',
                'password_confirmation' => 'required|string|min:6',
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $customer = Customer::find(Auth::id());
            if (!$customer) throw new Exception("Customer not found!");

            if (Hash::check($request->current_password, $customer->password) === False) {
                throw new Exception("Current password is incorrect.");
            }

            $customer->update([
                'password' => Hash::make($request->password),
            ]);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }

        return make_success_response("Password changed successfully.");
    }

    public function forgotPassword(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => ['required', 'email']
            ]);

            if ($validator->fails()) {
                return make_error_response($validator->errors());
            }

            // Set Frontend URL
            $email = $request->email;
            $token = $this->createToken();

            $url = config('app.frontend_url') . "/auth/reset-password/{$token}?email={$email}";

            Mail::to($email)->send(new SendPasswordResetLink($url));
        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }

        return make_success_response("Password Reset link has been sent. Please check your email.");
    }

    public function resetPassword(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'token' => ['required'],
                'email' => ['required', 'email'],
                'password' => ['required', 'confirmed', 'min:6'],
            ]);

            if ($validator->fails()) {
                return make_error_response($validator->errors());
            }

            // Match
            $this->matchToken($request->token);

            $request->only(['email', 'password']);

            $customer = Customer::where('email', $request->email)->first();
            if (!$customer) throw new Exception("Customer not found!");

            $customer->password = Hash::make($request->password);
            $customer->update();

        } catch (\Exception $exception) {
            report($exception);

            return make_error_response($exception->getMessage());
        }

        return make_success_response("Password reset successfully.");
    }

    public function logout()
    {
        try {
            Auth::logout();

            return make_success_response("Logout successful.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function createToken()
    {
        return base64_encode(md5('ifadeshop' . date('H')));
    }

    public function matchToken($token)
    {
        if (md5('ifadeshop' . date('H')) != base64_decode($token)) {
            throw new Exception("Token doesn't match!");
        }
    }

    public function verificationNotificationLink(Request $request)
    {
        try {
            $email = $request->user()->email;
            $token = $this->createToken();

            $url = config('app.frontend_url') . "/auth/verify-email/{$token}";

            Mail::to($email)->send(new SendVerificationNotificationLink($url));
        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }

        return make_success_response("Verification email sent. Please check your email.");
    }

    public function verifyEmail(Request $request, $token)
    {
        try {
            $this->matchToken($token);

            $email = $request->user()->email;

            $customer = Customer::where('email', $email)->first();
            if (!$customer) throw new Exception("Customer not found!");

            $customer->email_verified_at = now();
            $customer->update();

            Mail::to($email)->send(new SendVerifiedEmailNotification());
        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }

        return make_success_response("Your email is verified.");
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendOtpViaPhone(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [
                'phone_number' => ['required']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $validated = $validator->validated();

            $customer = Customer::where('phone_number', $validated['phone_number'])->first();
            if (!$customer) {
                $customer = new Customer();
                $customer->phone_number = $validated['phone_number'];
                $customer->save();
            }

            //$otp = rand(1111, 9999);

            $otp = generateRandomOTP();
            $customer->otp = $otp;
            $customer->update();

            //sms integration function start

            //evn file config
            $apiEndpoint = Config::get('app.banglalink_sms_api_endpoint');
            $username = Config::get('app.banglalink_sms_username');
            $password = Config::get('app.banglalink_sms_password');
            $apiCode = Config::get('app.banglalink_sms_apicode');
            $cli = Config::get('app.banglalink_sms_cli');


            //request body

            $requestData = [
                'username' => $username,
                'password' => $password,
                'apicode' => $apiCode,
                'msisdn' => [$customer->phone_number],
                'countrycode' => '880',
                'cli' => $cli,
                'messagetype' => '1',
                'message' => $customer->otp,
                'clienttransid' => generateRandomClientTransId(),
                'bill_msisdn' => $cli,
                'tran_type' => 'P',
                'request_type' => 'B',
                'rn_code' => '91',
            ];

            $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);

            if ($httpResponse['success']) {
                // Process the response as needed
                return response()->json(['success' => true, 'response' => $httpResponse['response']]);
            } else {
                // Handle exceptions
                return response()->json(['success' => false, 'error' => $httpResponse['error']]);
            }

            //sms integration function end

        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function verifyOtpViaPhone(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'phone_number' => ['required'],
                'otp' => ['required', 'numeric'],
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $validated = $validator->validated();

            $customer = Customer::where('phone_number', $validated['phone_number'])->first();
            if (!$customer) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }

            if ($validated['otp'] != $customer->otp) {
                return make_error_response("OTP not match.");
            }

            Auth::login($customer, $request->filled('remember'));

            $token = JWTAuth::fromUser($customer);
            if (!$token) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }

            $customer->email_verified_at = $customer->email_verified_at ?: now();
            $customer->otp = null;
            $customer->update();

            $customerId=Auth::user()->id;

            $groups = DB::table('coupon_user_groups')->select('id','group_name')
                ->where('status',1)
                ->whereRaw("JSON_CONTAINS(customer_id, '\"$customerId\"')")
                ->get();

            return make_success_response("Login successfully.", [
                'token' => 'Bearer ' . $token,
                'customer' => auth()->user(),
                'group' => $groups,
                'expires_in' => auth()->factory()->getTTL() * 60 * 24,
            ]);
        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function verifyPasswordWithPhone(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'phone_number' => ['required'],
                'password' => ['required'],
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $validated = $validator->validated();

            $customer = Customer::where('phone_number', $validated['phone_number'])->first();
            if (!$customer) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }

            if (Hash::check($validated['password'], $customer->password)) {
                return make_error_response("Password not match.");
            }

            Auth::login($customer, $request->filled('remember'));

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
                'customer' => auth()->user(),
                'group' => $groups,
                'expires_in' => auth()->factory()->getTTL() * 60 * 24,
            ]);
        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendOtpViaEmail(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => ['required', 'email']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $validated = $validator->validated();

            $customer = Customer::where('email', $validated['email'])->first();
            if (!$customer) {
                $customer = new Customer();
                $customer->email = $validated['email'];
                $customer->save();
            }

            $otp = rand(1111, 9999);

            $customer->otp = $otp;
            $customer->update();

            Mail::to($customer->email)->send(new SendOtpEmailNotification($otp));

            return make_success_response("OTP code sent to email.");
        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function verifyOtpViaEmail(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => ['required', 'email'],
                'otp' => ['required', 'numeric'],
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $validated = $validator->validated();

            $customer = Customer::where('email', $validated['email'])->first();
            if (!$customer) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }

            if ($customer->otp != $validated['otp']) {
                return make_error_response("OTP not match.");
            }

            Auth::login($customer, $request->filled('remember'));

            $token = JWTAuth::fromUser($customer);
            if (!$token) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }

            $customer->email_verified_at = $customer->email_verified_at ?: now();
            $customer->otp = null;
            $customer->update();

            $customerId=Auth::user()->id;

            $groups = DB::table('coupon_user_groups')->select('id','group_name')
            ->where('status',1)
            ->whereRaw("JSON_CONTAINS(customer_id, '\"$customerId\"')")
            ->get();

            return make_success_response("Login successfully.", [
                'token' => 'Bearer ' . $token,
                'customer' => auth()->user(),
                'group' => $groups,
                'expires_in' => auth()->factory()->getTTL() * 60 * 24,
            ]);
        } catch (\Exception $exception) {
            report($exception);

            return make_success_response($exception->getMessage());
        }
    }
}
