<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Order;
use App\Models\Coupon;
use App\Models\OrderItem;
use Exception;
use Illuminate\Support\Facades\DB;
use App\Models\CouponUsageLog;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Config;
use function generateRandomClientTransId;
use function generateRandomOTP;
use function makeHttpRequest;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Order::query();
            $query->with('customer', 'paymentMethod', 'orderItems');
            $query->where('customer_id', Auth::id());
            $query->orderBy('created_at', 'desc');

            $query->when($request->limit, function ($q) use ($request) {
                $q->limit($request->limit);
            });

            if ($request->paginate === 'yes') {
                return $query->paginate($request->get('limit', 15));
            } else {
                return $query->get();
            }
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function show($id)
    {
        try {
            return Order::with('customer', 'paymentMethod', 'orderItems')->findOrFail($id);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'shipping_address' => ['required'],
                'shipping_address_json' => ['required'],
                'billing_address' => ['required'],
                'billing_address_json' => ['required'],
                'payment_method_id' => ['required'],
                'cart' => ['required'],
                'sub_total' => ['required'],
                'grand_total' => ['required']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $order = new Order();
            $order->order_date = Carbon::now();
            $order->customer_id = Auth::id();
            $order->shipping_address = $request->shipping_address;
            $order->shipping_address_json = $request->shipping_address_json;
            $order->billing_address = $request->billing_address;
            $order->billing_address_json = $request->billing_address_json;
            $order->sub_total = $request->sub_total;
            $order->discount_sub_total = ($request->sub_total - $request->discount);
            $order->coupon_code = $request->coupon_code;
            $order->discount = $request->discount;
            $order->shipping_charge = $request->shipping_charge;
            $order->tax = 0;
            $order->grand_total = $request->grand_total;

            $order->payment_method_id = $request->payment_method_id;
            $order->payment_details = json_encode([]);
            $order->order_status_id = Order::ORDER_STATUS_PENDING;
            $order->payment_status_id = Order::PAYMENT_STATUS_UNPAID;
            $order->save();

            $total = 0;
            foreach ($request->cart as $item) {
                $total += $item['quantity'] * $item['unit_price'];

                $orderItem = new OrderItem();
                $orderItem->type = $item['type'];
                $orderItem->order_id = $order->id;
                $orderItem->inventory_id = isset($item['inventory_id']) ? $item['inventory_id'] : null;
                $orderItem->combo_id = isset($item['combo_id']) ? $item['combo_id'] : null;
                $orderItem->quantity = $item['quantity'];
                $orderItem->unit_price = $item['unit_price'];
                $orderItem->save();
            }

            $order->sub_total = $total;
            $order->discount_sub_total = $total - $request->discount;
            $order->grand_total = ( $total - $request->discount) + $request->shipping_charge;

            $order->update();

          if($request->coupon_code){
                $limit_per_coupon = Coupon::where('coupon_code',$request->coupon_code)->first();
                // record of total usage for a user
                if($limit_per_coupon->limit_usage_times != null){
       
                      $todayDate = now()->toDateString();
                      $total_usage = CouponUsageLog::updateOrCreate(
                        [
                            'customer_id' => Auth::id(),
                            'coupon_id' => $limit_per_coupon->id,
                            // Assuming you're tracking usage by date
                        ],
                        [
                            'total_usage' => DB::raw('IFNULL(total_usage, 0) + 1'), // Increment total_usage by 1
                            'updated_by' => 'system', // Set updated_by if needed
                            'created_at' => DB::raw('NOW()') // Set created_at if creating a new record
                        ]
                    );
                }
                // record of daily usage for a user
              if ($limit_per_coupon->limit_per_user != null) {
                        $todayDate = now()->toDateString();
                        $check_date=  CouponUsageLog::where('customer_id', Auth::id())
                            ->where('coupon_id', $limit_per_coupon->id)->first();
 
                        if($check_date->usage_date != null && $check_date->usage_date < $todayDate){
                            $gg=$check_date->usage_date < $todayDate;
                     
                            CouponUsageLog::where('customer_id', Auth::id())
                            ->where('coupon_id', $limit_per_coupon->id)
                            ->update(['daily_usage' => 1,'usage_date' => $todayDate]);

                        }else{
                          
                       
                             $usageLog = CouponUsageLog::updateOrCreate(
                            [
                            'customer_id' => Auth::id(),
                            'coupon_id' => $limit_per_coupon->id,
                            
                            ],
                            [
                            'daily_usage' => DB::raw('IFNULL(daily_usage, 0) + 1'), 
                            'usage_date' => $todayDate,// Set 0 for non-today dates
                            'updated_by' => 'system', // Set updated_by if needed
                            ]
                        );
                    }      
            }



                if($limit_per_coupon->limit_per_coupon != null){
                    Coupon::where('coupon_code',$request->coupon_code)->update(['limit_per_coupon'=>$limit_per_coupon->limit_per_coupon - 1]);
                }
         
            }

            // if($request->coupon_code){
            //     $limit_per_coupon = Coupon::where('coupon_code',$request->coupon_code)->first();

            //     Coupon::where('coupon_code',$request->coupon_code)->update(     ['limit_per_coupon'=>$limit_per_coupon->limit_per_coupon - 1]);
            // }

            $data = [
                'name' => optional($order->customer)->name,
                'email' => optional($order->customer)->email,
                'subject' => "IFAD eShop: Order Placing Notification",
            ];

            // Mail::send('Email.send_order', [
            //     'invoice_id' => $order->id,
            //     'customer_name' => optional($order->customer)->name,
            //     'orderItems' => $order->orderItems,
            //     'sub_total' => $order->sub_total,
            //     'shipping_charge' => $order->shipping_charge,
            //     'grand_total' => $order->grand_total,
            //     'shipping_address' => $order->shipping_address,
            // ], function ($message) use ($data) {
            //     $message->to([
            //         $data["email"] => $data["name"],
            //         "ifadeshop@ifadgroup.com" => "ifadeshop"
            //     ]);
            //     $message->from(config('mail.from.address'), config('mail.from.name'));
            //     $message->subject($data["subject"]);
            // });

            // $apiEndpoint = Config::get('app.banglalink_sms_api_endpoint');
            // $username = Config::get('app.banglalink_sms_username');
            // $password = Config::get('app.banglalink_sms_password');
            // $apiCode = Config::get('app.banglalink_sms_apicode');
            // $cli = Config::get('app.banglalink_sms_cli');


            // //request body

            // $requestData = [
            //     'username' => $username,
            //     'password' => $password,
            //     'apicode' => $apiCode,
            //     'msisdn' => [$order->customer->phone_number],
            //     'countrycode' => '880',
            //     'cli' => $cli,
            //     'messagetype' => '1',
            //     'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nOrder Status: pending\nPayment Status: Unpaid\nTotal Amount: ".$order->grand_total,
            //     'clienttransid' => generateRandomClientTransId(),
            //     'bill_msisdn' => $cli,
            //     'tran_type' => 'P',
            //     'request_type' => 'B',
            //     'rn_code' => '91',
            // ];

            // $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);

            // if ($httpResponse['success']) {
            //     // Process the response as needed
            //     return response()->json(['success' => true, 'response' => $httpResponse['response']]);
            // } else {
            //     // Handle exceptions
            //     return response()->json(['success' => false, 'error' => $httpResponse['error']]);
            // }

            // //return make_success_response("Record saved successfully.");

            //////


                $isOrderEmail=$order->customer->email ?? '';
                $isOrderPhone=$order->customer->phone_number ?? '';

                if($isOrderEmail != '' &&  $isOrderPhone != ''){
                Mail::send('Email.send_order', [
                    'invoice_id' => $order->id,
                    'customer_name' => optional($order->customer)->name,
                    'orderItems' => $order->orderItems,
                    'sub_total' => $order->sub_total,
                    'shipping_charge' => $order->shipping_charge,
                    'grand_total' => $order->grand_total,
                    'shipping_address' => $order->shipping_address,
                ], function ($message) use ($data) {
                    $message->to([
                        $data["email"] => $data["name"],
                        "ifadeshop@ifadgroup.com" => "ifadeshop"
                    ]);
                    $message->from(config('mail.from.address'), config('mail.from.name'));
                    $message->subject($data["subject"]);
                });

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
                    'msisdn' => [$order->customer->phone_number],
                    'countrycode' => '880',
                    'cli' => $cli,
                    'messagetype' => '1',
                    'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nOrder Status: pending\nPayment Status: Unpaid\nTotal Amount: ".$order->grand_total,
                    'clienttransid' => generateRandomClientTransId(),
                    'bill_msisdn' => $cli,
                    'tran_type' => 'P',
                    'request_type' => 'B',
                    'rn_code' => '91',
                ];

                $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);

                if ($httpResponse['success']) {
                    // Process the response as needed
                    return make_success_response("Record saved successfully.");
                } else {
                    // Handle exceptions
                    return response()->json(['success' => false, 'error' => $httpResponse['error']]);
                }



            }else if($isOrderEmail != '' &&  $isOrderPhone == ''){
                Mail::send('Email.send_order', [
                    'invoice_id' => $order->id,
                    'customer_name' => optional($order->customer)->name,
                    'orderItems' => $order->orderItems,
                    'sub_total' => $order->sub_total,
                    'shipping_charge' => $order->shipping_charge,
                    'grand_total' => $order->grand_total,
                    'shipping_address' => $order->shipping_address,
                ], function ($message) use ($data) {
                    $message->to([
                        $data["email"] => $data["name"],
                        "ifadeshop@ifadgroup.com" => "ifadeshop"
                    ]);
                    $message->from(config('mail.from.address'), config('mail.from.name'));
                    $message->subject($data["subject"]);
                });
                return make_success_response("Record saved successfully.");

            }else if($isOrderEmail == '' &&  $isOrderPhone != ''){

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
                    'msisdn' => [$order->customer->phone_number],
                    'countrycode' => '880',
                    'cli' => $cli,
                    'messagetype' => '1',
                    'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nOrder Status: pending\nPayment Status: Unpaid\nTotal Amount: ".$order->grand_total,
                    'clienttransid' => generateRandomClientTransId(),
                    'bill_msisdn' => $cli,
                    'tran_type' => 'P',
                    'request_type' => 'B',
                    'rn_code' => '91',
                ];

                $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);

                if ($httpResponse['success']) {
                    // Process the response as needed
                    return make_success_response("Record saved successfully.");
                } else {
                    // Handle exceptions
                    return response()->json(['success' => false, 'error' => $httpResponse['error']]);
                }


            }else{
                return make_error_response("Record is not saved.");
            }
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function changeStatus(Request $request, $id)
    {
        try {
            $validator = Validator::make($request->all(), [
                'payment_status_id' => ['required'],
                'order_status_id' => ['required'],
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            app('db')->transaction(function () use ($id, $request) {
                $order = Order::findOrFail($id);
                $order->payment_status_id = $request->payment_status_id;
                $order->order_status_id = $request->order_status_id;
                $order->update();

                if ($request->payment_status_id == Order::PAYMENT_STATUS_PAID) {
                    $order->orderItems->map(function ($item) {
                        if ($item->type === 'product') {
                            $inventory = $item->inventory;
                            if ($inventory->is_manage_stock) {
                                $inventory->stock_quantity = $inventory->stock_quantity - $item->quantity;
                                $inventory->update();
                            }
                        }
                        if ($item->type === 'combo') {
                            $combo = $item->combo;
                            if ($combo->is_manage_stock) {
                                $combo->stock_quantity = $combo->stock_quantity - $item->quantity;
                                $combo->update();
                            }
                        }
                    });
                }

                $data = [
                    'name' => optional($order->customer)->name,
                    'email' => optional($order->customer)->email,
                    'subject' => "IFAD eShop: Order Status Changed",
                ];

                $isOrderEmail=$order->customer->email ?? '';
                $isOrderPhone=$order->customer->phone_number ?? '';

                if($isOrderEmail != '' &&  $isOrderPhone != ''){
                    Mail::send(['html' => 'Email.send_order_status_change_notification'], [
                        'payment_status_name' => get_payment_status_name($request->payment_status_id),
                        'order_status_name' => get_order_status_name($request->payment_status_id)
                    ], function ($message) use ($data) {
                        $message->to($data["email"]);
                        $message->from(config('mail.from.address'), config('mail.from.name'));
                        $message->subject($data["subject"]);
                    });

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
                    'msisdn' => [$order->customer->phone_number],
                    'countrycode' => '880',
                    'cli' => $cli,
                    'messagetype' => '1',
                    'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                    'clienttransid' => generateRandomClientTransId(),
                    'bill_msisdn' => $cli,
                    'tran_type' => 'P',
                    'request_type' => 'B',
                    'rn_code' => '91',
                ];

                $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);



            }else if($isOrderEmail != '' &&  $isOrderPhone == ''){
                Mail::send(['html' => 'Email.send_order_status_change_notification'], [
                    'payment_status_name' => get_payment_status_name($request->payment_status_id),
                    'order_status_name' => get_order_status_name($request->payment_status_id)
                ], function ($message) use ($data) {
                    $message->to($data["email"]);
                    $message->from(config('mail.from.address'), config('mail.from.name'));
                    $message->subject($data["subject"]);
                });

                }else if($isOrderEmail == '' &&  $isOrderPhone != ''){

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
                        'msisdn' => [$order->customer->phone_number],
                        'countrycode' => '880',
                        'cli' => $cli,
                        'messagetype' => '1',
                        'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                        'clienttransid' => generateRandomClientTransId(),
                        'bill_msisdn' => $cli,
                        'tran_type' => 'P',
                        'request_type' => 'B',
                        'rn_code' => '91',
                    ];

                    $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);


                }
            });

            return make_success_response("Record saved successfully.");
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function makePayment(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'shipping_address' => ['required'],
                'shipping_address_json' => ['required'],
                'billing_address' => ['required'],
                'billing_address_json' => ['required'],
                'payment_method_id' => ['required'],
                'cart' => ['required'],
                'sub_total' => ['required'],
                'grand_total' => ['required']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            // make order
            $order = new Order();
            $order->order_date = Carbon::now();
            $order->customer_id = Auth::id();
            $order->shipping_address = $request->shipping_address;
            $order->shipping_address_json = $request->shipping_address_json;
            $order->billing_address = $request->billing_address;
            $order->billing_address_json = $request->billing_address_json;
            $order->sub_total = $request->sub_total;
            $order->discount_sub_total = ($request->sub_total - $request->discount);
            $order->coupon_code = $request->coupon_code;
            $order->discount = $request->discount;
            $order->shipping_charge = $request->shipping_charge;
            $order->tax = 0;
            $order->grand_total = $request->grand_total;
            $order->payment_method_id = $request->payment_method_id;
            $order->payment_details = json_encode([]);
            $order->order_status_id = Order::ORDER_STATUS_PENDING;
            $order->payment_status_id = Order::PAYMENT_STATUS_UNPAID;
            $order->save();

            $newlyCreatedOrderId = $order->id;
            $customer = Customer::findOrFail(Auth::id());
            $productNames = '';
            $total = 0;
            foreach ($request->cart as $item) {
                $total += $item['quantity'] * $item['unit_price'];

                $orderItem = new OrderItem();
                $orderItem->type = $item['type'];
                $orderItem->order_id = $order->id;
                $orderItem->inventory_id = isset($item['inventory_id']) ? $item['inventory_id'] : null;
                $orderItem->combo_id = isset($item['combo_id']) ? $item['combo_id'] : null;
                $orderItem->quantity = $item['quantity'];
                $orderItem->unit_price = $item['unit_price'];
                $orderItem->save();

                if ($item['title']) {
                    $productNames .= ($productNames ? ',' : '') . $item['title'];
                }
            }

            $order->sub_total = $total;
            $order->discount_sub_total = $total - $request->discount;
            $order->grand_total = ( $total - $request->discount) + $request->shipping_charge;

            if($request->coupon_code){
                $limit_per_coupon = Coupon::where('coupon_code',$request->coupon_code)->first();
                // record of total usage for a user
                if($limit_per_coupon->limit_usage_times != null){
       
                      $todayDate = now()->toDateString();
                      $total_usage = CouponUsageLog::updateOrCreate(
                        [
                            'customer_id' => Auth::id(),
                            'coupon_id' => $limit_per_coupon->id,
                            // Assuming you're tracking usage by date
                        ],
                        [
                            'total_usage' => DB::raw('IFNULL(total_usage, 0) + 1'), // Increment total_usage by 1
                            'updated_by' => 'system', // Set updated_by if needed
                            'created_at' => DB::raw('NOW()') // Set created_at if creating a new record
                        ]
                    );
                }
                // record of daily usage for a user
              if ($limit_per_coupon->limit_per_user != null) {
                        $todayDate = now()->toDateString();
                        $check_date=  CouponUsageLog::where('customer_id', Auth::id())
                            ->where('coupon_id', $limit_per_coupon->id)->first();
 
                        if($check_date->usage_date != null && $check_date->usage_date < $todayDate){
                            $gg=$check_date->usage_date < $todayDate;
                     
                            CouponUsageLog::where('customer_id', Auth::id())
                            ->where('coupon_id', $limit_per_coupon->id)
                            ->update(['daily_usage' => 1,'usage_date' => $todayDate]);

                        }else{
                          
                       
                             $usageLog = CouponUsageLog::updateOrCreate(
                            [
                            'customer_id' => Auth::id(),
                            'coupon_id' => $limit_per_coupon->id,
                            
                            ],
                            [
                            'daily_usage' => DB::raw('IFNULL(daily_usage, 0) + 1'), 
                            'usage_date' => $todayDate,// Set 0 for non-today dates
                            'updated_by' => 'system', // Set updated_by if needed
                            ]
                        );
                    }      
            }



                if($limit_per_coupon->limit_per_coupon != null){
                    Coupon::where('coupon_code',$request->coupon_code)->update(['limit_per_coupon'=>$limit_per_coupon->limit_per_coupon - 1]);
                }
         
            }

            $data = [
                'name' => optional($order->customer)->name,
                'email' => optional($order->customer)->email,
                'subject' => "IFAD eShop: Order Placing Notification",
            ];

            $isOrderEmail=$order->customer->email ?? '';
                $isOrderPhone=$order->customer->phone_number ?? '';

                if($isOrderEmail != '' &&  $isOrderPhone != ''){
                Mail::send('Email.send_order', [
                    'invoice_id' => $order->id,
                    'customer_name' => optional($order->customer)->name,
                    'orderItems' => $order->orderItems,
                    'sub_total' => $order->sub_total,
                    'shipping_charge' => $order->shipping_charge,
                    'grand_total' => $order->grand_total,
                    'shipping_address' => $order->shipping_address,
                ], function ($message) use ($data) {
                    $message->to([
                        $data["email"] => $data["name"],
                        "ifadeshop@ifadgroup.com" => "ifadeshop"
                    ]);
                    $message->from(config('mail.from.address'), config('mail.from.name'));
                    $message->subject($data["subject"]);
                });

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
                    'msisdn' => [$order->customer->phone_number],
                    'countrycode' => '880',
                    'cli' => $cli,
                    'messagetype' => '1',
                    'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nOrder Status: pending\nPayment Status: Unpaid\nTotal Amount: ".$order->grand_total,
                    'clienttransid' => generateRandomClientTransId(),
                    'bill_msisdn' => $cli,
                    'tran_type' => 'P',
                    'request_type' => 'B',
                    'rn_code' => '91',
                ];

                $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);


            }else if($isOrderEmail != '' &&  $isOrderPhone == ''){
                Mail::send('Email.send_order', [
                    'invoice_id' => $order->id,
                    'customer_name' => optional($order->customer)->name,
                    'orderItems' => $order->orderItems,
                    'sub_total' => $order->sub_total,
                    'shipping_charge' => $order->shipping_charge,
                    'grand_total' => $order->grand_total,
                    'shipping_address' => $order->shipping_address,
                ], function ($message) use ($data) {
                    $message->to([
                        $data["email"] => $data["name"],
                        "ifadeshop@ifadgroup.com" => "ifadeshop"
                    ]);
                    $message->from(config('mail.from.address'), config('mail.from.name'));
                    $message->subject($data["subject"]);
                });

            }else if($isOrderEmail == '' &&  $isOrderPhone != ''){

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
                    'msisdn' => [$order->customer->phone_number],
                    'countrycode' => '880',
                    'cli' => $cli,
                    'messagetype' => '1',
                    'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nOrder Status: pending\nPayment Status: Unpaid\nTotal Amount: ".$order->grand_total,
                    'clienttransid' => generateRandomClientTransId(),
                    'bill_msisdn' => $cli,
                    'tran_type' => 'P',
                    'request_type' => 'B',
                    'rn_code' => '91',
                ];

                $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);


            }

            if (strlen($productNames) > 250) {
                $productNames = substr($productNames, 0, 250); // max 255
            }

            // return $productNames;

            // // sending mail
            // $msg = "A product has been ordered from " . $request->shipping_address;

            // // use wordwrap() if lines are longer than 70 characters
            // $msg = wordwrap($msg, 70);

            // // send email
            // mail("typetonazmul@gmail.com", "My subject", $msg);


            // make payment
            /* Store Config */
            $storeId = env('SSL_STORE_ID');
            $storePassword = env('SSL_STORE_PASSWORD');
            $storeApiUrl = env('SSL_API_URL');
            $completion = env('SSL_COMPLETION_URL');
            // $callbackUrl = url("ecom/orders/sslcommerz-callback/{$newlyCreatedOrderId}");
            $callbackUrl = env('SSL_CALLBACK_ROUTE');
            $successUrl = $callbackUrl . "secureurlasdfghjk/" . $newlyCreatedOrderId . "/success";
            $failUrl = $callbackUrl . "secureurlasdfghjk/" . $newlyCreatedOrderId . "/fail";
            $cancelUrl = $callbackUrl . "secureurlasdfghjk/" . $newlyCreatedOrderId . "/cancel";

            $post_data = array();
            $post_data['store_id'] = $storeId;
            $post_data['store_passwd'] = $storePassword;
            $post_data['total_amount'] = $request->grand_total;
            $post_data['currency'] = "BDT";
            $post_data['tran_id'] = "ifadshop" . uniqid();
            $post_data['success_url'] = $successUrl;
            $post_data['fail_url'] = $failUrl;
            $post_data['cancel_url'] = $cancelUrl;
            # $post_data['multi_card_name'] = "mastercard,visacard,amexcard";  # DISABLE TO DISPLAY ALL AVAILABLE

            # EMI INFO
            $post_data['emi_option'] = 0;
            // $post_data['emi_max_inst_option'] = "9";
            // $post_data['emi_selected_inst'] = "9";

            # CUSTOMER INFORMATION
            $post_data['cus_name'] = $customer->name;
            $post_data['cus_email'] = $customer->email;
            $post_data['cus_add1'] = $customer->address;
            // $post_data['cus_add2'] = "Dhaka";
            // $post_data['cus_city'] = "Dhaka";
            // $post_data['cus_state'] = "Dhaka";
            // $post_data['cus_postcode'] = "1000";
            $post_data['cus_country'] = "Bangladesh";
            $post_data['cus_phone'] = $customer->phone_number;
            // $post_data['cus_fax'] = "01711111111";

            # SHIPMENT INFORMATION  // TO DO: Update
            // $post_data['ship_name'] = "Store Test";
            // $post_data['ship_add1 '] = "Dhaka";
            // $post_data['ship_add2'] = "Dhaka";
            // $post_data['ship_city'] = "Dhaka";
            // $post_data['ship_state'] = "Dhaka";
            // $post_data['ship_postcode'] = "1000";
            // $post_data['ship_country'] = "Bangladesh";

            // # OPTIONAL PARAMETERS
            // $post_data['value_a'] = "ref001";
            // $post_data['value_b '] = "ref002";
            // $post_data['value_c'] = "ref003";
            // $post_data['value_d'] = "ref004";

            // # CART PARAMETERS
            // $post_data['cart'] = json_encode(array(
            //     array("product"=>"DHK TO BRS AC A1","amount"=>"200.00"),
            //     array("product"=>"DHK TO BRS AC A2","amount"=>"200.00"),
            //     array("product"=>"DHK TO BRS AC A3","amount"=>"200.00"),
            //     array("product"=>"DHK TO BRS AC A4","amount"=>"200.00")
            // ));
            // $post_data['product_amount'] = "100";
            // $post_data['vat'] = "5";
            // $post_data['discount_amount'] = "5";
            // $post_data['convenience_fee'] = "3";
            $post_data['product_name'] = $productNames;
            $post_data['product_category'] = "general"; // TO DO: Update
            $post_data['product_profile'] = "general";


            // //////////////////////////////////
            # REQUEST SEND TO SSLCOMMERZ
            $direct_api_url = $storeApiUrl;

            $handle = curl_init();
            curl_setopt($handle, CURLOPT_URL, $direct_api_url);
            curl_setopt($handle, CURLOPT_TIMEOUT, 30);
            curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 30);
            curl_setopt($handle, CURLOPT_POST, 1);
            curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
            curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, FALSE); # KEEP IT FALSE IF YOU RUN FROM LOCAL PC

            $content = curl_exec($handle);

            $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

            if ($code == 200 && !(curl_errno($handle))) {
                curl_close($handle);
                $sslcommerzResponse = $content;
            } else {
                curl_close($handle);
                // echo "FAILED TO CONNECT WITH SSLCOMMERZ API";
                return response()->json(['error' => 'FAILED TO CONNECT WITH SSLCOMMERZ API']);
            }

            # PARSE THE JSON RESPONSE
            $sslcz = json_decode($sslcommerzResponse, true);

            if (isset($sslcz['GatewayPageURL']) && $sslcz['GatewayPageURL'] !== "") {
                return response()->json(['GatewayPageURL' => $sslcz['GatewayPageURL']]);
            } else {
                return response()->json(['error' => 'JSON Data parsing error']);
            }

            // return;
            // return make_success_response("Payment done successfully.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function makePaymentForOrder(Request $request, $order_id)
    {
        try {
            $validator = Validator::make($request->all(), [
                // 'order_id' => ['required'],
                // 'billing_address' => ['required'],
                // 'payment_method_id' => ['required'],
                // 'cart' => ['required'],
                // 'sub_total' => ['required'],
                // 'grand_total' => ['required']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $customer = Customer::findOrFail(Auth::id());
            $order = Order::findOrFail($order_id);
            $productNames = '';

            // if (strlen($productNames) > 250) {
            //     $productNames = substr($productNames, 0, 250); // max 255
            // }

            // make payment
            /* Store Config */
            $storeId = env('SSL_STORE_ID');
            $storePassword = env('SSL_STORE_PASSWORD');
            $storeApiUrl = env('SSL_API_URL');
            $completion = env('SSL_COMPLETION_URL');
            // $callbackUrl = url("ecom/orders/sslcommerz-callback/{$order_id}");
            $callbackUrl = env('SSL_CALLBACK_ROUTE');
            $successUrl = $callbackUrl . "secureurlasdfghjk/" . $order_id . "/success";
            $failUrl = $callbackUrl . "secureurlasdfghjk/" . $order_id . "/fail";
            $cancelUrl = $callbackUrl . "secureurlasdfghjk/" . $order_id . "/cancel";


            $post_data = array();
            $post_data['store_id'] = $storeId;
            $post_data['store_passwd'] = $storePassword;
            $post_data['total_amount'] = $order->grand_total;
            $post_data['currency'] = "BDT";
            $post_data['tran_id'] = "ifadshop" . uniqid();
            $post_data['success_url'] = $successUrl;
            $post_data['fail_url'] = $failUrl;
            $post_data['cancel_url'] = $cancelUrl;
            # $post_data['multi_card_name'] = "mastercard,visacard,amexcard";  # DISABLE TO DISPLAY ALL AVAILABLE

            # EMI INFO
            $post_data['emi_option'] = 0;
            // $post_data['emi_max_inst_option'] = "9";
            // $post_data['emi_selected_inst'] = "9";

            # CUSTOMER INFORMATION
            $post_data['cus_name'] = $customer->name;
            $post_data['cus_email'] = $customer->email;
            $post_data['cus_add1'] = $customer->address;
            // $post_data['cus_add2'] = "Dhaka";
            // $post_data['cus_city'] = "Dhaka";
            // $post_data['cus_state'] = "Dhaka";
            // $post_data['cus_postcode'] = "1000";
            $post_data['cus_country'] = "Bangladesh";
            $post_data['cus_phone'] = $customer->phone_number;
            // $post_data['cus_fax'] = "01711111111";

            # SHIPMENT INFORMATION  // TO DO: Update
            // $post_data['ship_name'] = "Store Test";
            // $post_data['ship_add1 '] = "Dhaka";
            // $post_data['ship_add2'] = "Dhaka";
            // $post_data['ship_city'] = "Dhaka";
            // $post_data['ship_state'] = "Dhaka";
            // $post_data['ship_postcode'] = "1000";
            // $post_data['ship_country'] = "Bangladesh";

            // # OPTIONAL PARAMETERS
            // $post_data['value_a'] = "ref001";
            // $post_data['value_b '] = "ref002";
            // $post_data['value_c'] = "ref003";
            // $post_data['value_d'] = "ref004";

            // # CART PARAMETERS
            // $post_data['cart'] = json_encode(array(
            //     array("product"=>"DHK TO BRS AC A1","amount"=>"200.00"),
            //     array("product"=>"DHK TO BRS AC A2","amount"=>"200.00"),
            //     array("product"=>"DHK TO BRS AC A3","amount"=>"200.00"),
            //     array("product"=>"DHK TO BRS AC A4","amount"=>"200.00")
            // ));
            // $post_data['product_amount'] = "100";
            // $post_data['vat'] = "5";
            // $post_data['discount_amount'] = "5";
            // $post_data['convenience_fee'] = "3";
            $post_data['product_name'] = $productNames;
            $post_data['product_category'] = "general"; // TO DO: Update
            $post_data['product_profile'] = "general";


            // //////////////////////////////////
            # REQUEST SEND TO SSLCOMMERZ
            $direct_api_url = $storeApiUrl;

            $handle = curl_init();
            curl_setopt($handle, CURLOPT_URL, $direct_api_url);
            curl_setopt($handle, CURLOPT_TIMEOUT, 30);
            curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 30);
            curl_setopt($handle, CURLOPT_POST, 1);
            curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
            curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, FALSE); # KEEP IT FALSE IF YOU RUN FROM LOCAL PC

            $content = curl_exec($handle);

            $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

            if ($code == 200 && !(curl_errno($handle))) {
                curl_close($handle);
                $sslcommerzResponse = $content;
            } else {
                curl_close($handle);
                // echo "FAILED TO CONNECT WITH SSLCOMMERZ API";
                return response()->json(['error' => 'FAILED TO CONNECT WITH SSLCOMMERZ API']);
            }

            # PARSE THE JSON RESPONSE
            $sslcz = json_decode($sslcommerzResponse, true);

            if (isset($sslcz['GatewayPageURL']) && $sslcz['GatewayPageURL'] !== "") {
                return response()->json(['GatewayPageURL' => $sslcz['GatewayPageURL']]);
            } else {
                return response()->json(['error' => 'JSON Data parsing error']);
            }

            // return;
            // return make_success_response("Payment done successfully.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function handleCallback(Request $request, $order_id)
    {
        $completion = env('SSL_COMPLETION_URL');

        if ($_POST["status"] === "VALID") {
            try {
                // $validator = Validator::make($request->all(), [
                //     // 'payment_status_id' => ['required'],
                //     // 'order_status_id' => ['required'],
                // ]);

                // if ($validator->fails()) {
                //     return make_validation_error_response($validator->errors());
                // }

                $valId = urlencode($_POST['val_id']);
                $storeId = env('SSL_STORE_ID');
                $storePassword = env('SSL_STORE_PASSWORD');
                $storeValidationUrl = env('SSL_VALIDATION_URL');
                $requested_url = ($storeValidationUrl . "?val_id=" . $valId . "&store_id=" . $storeId . "&store_passwd=" . $storePassword . "&v=1&format=json");

                $handle = curl_init();
                curl_setopt($handle, CURLOPT_URL, $requested_url);
                curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false); # IF YOU RUN FROM LOCAL PC
                curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false); # IF YOU RUN FROM LOCAL PC

                $result = curl_exec($handle);

                $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

                if ($code == 200 && !(curl_errno($handle))) {

                    # TO CONVERT AS ARRAY
                    # $result = json_decode($result, true);
                    # $status = $result['status'];

                    # TO CONVERT AS OBJECT
                    $result = json_decode($result);

                    # TRANSACTION INFO
                    $status = $result->status;
                    $tran_date = $result->tran_date;
                    $tran_id = $result->tran_id;
                    $val_id = $result->val_id;
                    $amount = $result->amount;
                    $store_amount = $result->store_amount;
                    $bank_tran_id = $result->bank_tran_id;
                    $card_type = $result->card_type;

                    # EMI INFO
                    $emi_instalment = $result->emi_instalment;
                    $emi_amount = $result->emi_amount;
                    $emi_description = $result->emi_description;
                    $emi_issuer = $result->emi_issuer;

                    # ISSUER INFO
                    $card_no = $result->card_no;
                    $card_issuer = $result->card_issuer;
                    $card_brand = $result->card_brand;
                    $card_issuer_country = $result->card_issuer_country;
                    $card_issuer_country_code = $result->card_issuer_country_code;

                    # API AUTHENTICATION
                    $APIConnect = $result->APIConnect;
                    $validated_on = $result->validated_on;
                    $gw_version = $result->gw_version;

                    app('db')->transaction(function () use ($order_id, $request) {
                        $order = Order::findOrFail($order_id);
                        $order->payment_status_id = 1;
                        $order->order_status_id = $order_id;
                        $order->update();

                        if (1 == Order::PAYMENT_STATUS_PAID) {
                            $order->orderItems->map(function ($item) {
                                if ($item->type === 'product') {
                                    $inventory = $item->inventory;
                                    if ($inventory->is_manage_stock) {
                                        $inventory->stock_quantity = $inventory->stock_quantity - $item->quantity;
                                        $inventory->update();
                                    }
                                }
                                if ($item->type === 'combo') {
                                    $combo = $item->combo;
                                    if ($combo->is_manage_stock) {
                                        $combo->stock_quantity = $combo->stock_quantity - $item->quantity;
                                        $combo->update();
                                    }
                                }
                            });
                        }

                        $data = [
                            'name' => optional($order->customer)->name,
                            'email' => optional($order->customer)->email,
                            'subject' => "IFAD eShop: Order Status Changed",
                        ];
                        Mail::send(['html' => 'Email.send_order_status_change_notification'], [
                            'payment_status_name' => get_payment_status_name(1),
                            'order_status_name' => get_order_status_name(1)
                        ], function ($message) use ($data) {
                            $message->to($data["email"]);
                            $message->from(config('mail.from.address'), config('mail.from.name'));
                            $message->subject($data["subject"]);
                        });

                    //     $isOrderEmail=$order->customer->email ?? '';
                    //     $isOrderPhone=$order->customer->phone_number ?? '';

                    //     if($isOrderEmail != '' &&  $isOrderPhone != ''){
                    //         Mail::send(['html' => 'Email.send_order_status_change_notification'], [
                    //             'payment_status_name' => get_payment_status_name(1),
                    //             'order_status_name' => get_order_status_name(1)
                    //         ], function ($message) use ($data) {
                    //             $message->to($data["email"]);
                    //             $message->from(config('mail.from.address'), config('mail.from.name'));
                    //             $message->subject($data["subject"]);
                    //         });

                    //     $apiEndpoint = Config::get('app.banglalink_sms_api_endpoint');
                    //     $username = Config::get('app.banglalink_sms_username');
                    //     $password = Config::get('app.banglalink_sms_password');
                    //     $apiCode = Config::get('app.banglalink_sms_apicode');
                    //     $cli = Config::get('app.banglalink_sms_cli');


                    //     //request body

                    //     $requestData = [
                    //         'username' => $username,
                    //         'password' => $password,
                    //         'apicode' => $apiCode,
                    //         'msisdn' => [$order->customer->phone_number],
                    //         'countrycode' => '880',
                    //         'cli' => $cli,
                    //         'messagetype' => '1',
                    //         'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                    //         'clienttransid' => generateRandomClientTransId(),
                    //         'bill_msisdn' => $cli,
                    //         'tran_type' => 'P',
                    //         'request_type' => 'B',
                    //         'rn_code' => '91',
                    //     ];

                    //     $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);



                    // }else if($isOrderEmail != '' &&  $isOrderPhone == ''){
                    //     Mail::send(['html' => 'Email.send_order_status_change_notification'], [
                    //         'payment_status_name' => get_payment_status_name($request->payment_status_id),
                    //         'order_status_name' => get_order_status_name($request->payment_status_id)
                    //     ], function ($message) use ($data) {
                    //         $message->to($data["email"]);
                    //         $message->from(config('mail.from.address'), config('mail.from.name'));
                    //         $message->subject($data["subject"]);
                    //     });

                    //     }else if($isOrderEmail == '' &&  $isOrderPhone != ''){

                    //         $apiEndpoint = Config::get('app.banglalink_sms_api_endpoint');
                    //         $username = Config::get('app.banglalink_sms_username');
                    //         $password = Config::get('app.banglalink_sms_password');
                    //         $apiCode = Config::get('app.banglalink_sms_apicode');
                    //         $cli = Config::get('app.banglalink_sms_cli');


                    //         //request body

                    //         $requestData = [
                    //             'username' => $username,
                    //             'password' => $password,
                    //             'apicode' => $apiCode,
                    //             'msisdn' => [$order->customer->phone_number],
                    //             'countrycode' => '880',
                    //             'cli' => $cli,
                    //             'messagetype' => '1',
                    //             'message' => "order confirmation from ifadeshop.com\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                    //             'clienttransid' => generateRandomClientTransId(),
                    //             'bill_msisdn' => $cli,
                    //             'tran_type' => 'P',
                    //             'request_type' => 'B',
                    //             'rn_code' => '91',
                    //         ];

                    //         $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);


                    //     }
                    });

                    return redirect($completion . "?status=success");
                } else {
                    return redirect($completion . "?status=fail");
                }
            } catch (Exception $exception) {
                return make_error_response($exception->getMessage());
            }
        } elseif ($_POST["status"] === "FAILED") {
            return redirect($completion . "?status=fail");
        } elseif ($_POST["status"] === "CANCEL") {
            return redirect($completion . "?status=cancel");
        }
    }

    public function handleCallbackForStatus(Request $request, $order_id, $status)
    {
        $completion = env('SSL_COMPLETION_URL');

        if ($status === "success") {
            app('db')->transaction(function () use ($order_id, $request) {
                $order = Order::findOrFail($order_id);
                $order->payment_status_id = Order::PAYMENT_STATUS_PAID;
                $order->order_status_id = Order::ORDER_STATUS_PROCESSING;
                $order->update();

                $order->orderItems->map(function ($item) {
                    if ($item->type === 'product') {
                        $inventory = $item->inventory;
                        if ($inventory->is_manage_stock) {
                            $inventory->stock_quantity = $inventory->stock_quantity - $item->quantity;
                            $inventory->update();
                        }
                    }
                    if ($item->type === 'combo') {
                        $combo = $item->combo;
                        if ($combo->is_manage_stock) {
                            $combo->stock_quantity = $combo->stock_quantity - $item->quantity;
                            $combo->update();
                        }
                    }
                });

                $data = [
                    'name' => optional($order->customer)->name,
                    'email' => optional($order->customer)->email,
                    'subject' => "IFAD eShop: Order Placing Notification",
                ];

                // Mail::send('Email.send_order_status_change_notification', [
                //     'invoice_id' => $order->id,
                //     'customer_name' => optional($order->customer)->name,
                //     'orderItems' => $order->orderItems,
                //     'sub_total' => $order->sub_total,
                //     'shipping_charge' => $order->shipping_charge,
                //     'grand_total' => $order->grand_total,
                //     'shipping_address' => $order->shipping_address,
                //     'payment_status_name' => get_payment_status_name($order->payment_status_id),
                //     'order_status_name' => get_order_status_name($order->order_status_id)
                // ], function ($message) use ($data) {
                //     $message->to([
                //         $data["email"] => $data["name"],
                //         "ifadeshop@ifadgroup.com" => "ifadeshop"
                //     ]);
                //     $message->from(config('mail.from.address'), config('mail.from.name'));
                //     $message->subject($data["subject"]);
                // });

                    $isOrderEmail=$order->customer->email ?? '';
                        $isOrderPhone=$order->customer->phone_number ?? '';

                        if($isOrderEmail != '' &&  $isOrderPhone != ''){
                            Mail::send('Email.send_order_status_change_notification', [
                            'invoice_id' => $order->id,
                            'customer_name' => optional($order->customer)->name,
                            'orderItems' => $order->orderItems,
                            'sub_total' => $order->sub_total,
                            'shipping_charge' => $order->shipping_charge,
                            'grand_total' => $order->grand_total,
                            'shipping_address' => $order->shipping_address,
                            'payment_status_name' => get_payment_status_name($order->payment_status_id),
                            'order_status_name' => get_order_status_name($order->order_status_id)
                            ], function ($message) use ($data) {
                            $message->to([
                                $data["email"] => $data["name"],
                                "ifadeshop@ifadgroup.com" => "ifadeshop"
                            ]);
                            $message->from(config('mail.from.address'), config('mail.from.name'));
                            $message->subject($data["subject"]);
                            });

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
                            'msisdn' => [$order->customer->phone_number],
                            'countrycode' => '880',
                            'cli' => $cli,
                            'messagetype' => '1',
                            'message' => "order confirmation from ifadeshop.com\nPayment Status: Success\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                            'clienttransid' => generateRandomClientTransId(),
                            'bill_msisdn' => $cli,
                            'tran_type' => 'P',
                            'request_type' => 'B',
                            'rn_code' => '91',
                        ];

                        $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);



                    }else if($isOrderEmail != '' &&  $isOrderPhone == ''){
                        Mail::send('Email.send_order_status_change_notification', [
                            'invoice_id' => $order->id,
                            'customer_name' => optional($order->customer)->name,
                            'orderItems' => $order->orderItems,
                            'sub_total' => $order->sub_total,
                            'shipping_charge' => $order->shipping_charge,
                            'grand_total' => $order->grand_total,
                            'shipping_address' => $order->shipping_address,
                            'payment_status_name' => get_payment_status_name($order->payment_status_id),
                            'order_status_name' => get_order_status_name($order->order_status_id)
                            ], function ($message) use ($data) {
                            $message->to([
                                $data["email"] => $data["name"],
                                "ifadeshop@ifadgroup.com" => "ifadeshop"
                            ]);
                            $message->from(config('mail.from.address'), config('mail.from.name'));
                            $message->subject($data["subject"]);
                            });

                        }else if($isOrderEmail == '' &&  $isOrderPhone != ''){

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
                                'msisdn' => [$order->customer->phone_number],
                                'countrycode' => '880',
                                'cli' => $cli,
                                'messagetype' => '1',
                                'message' => "order confirmation from ifadeshop.com\nPayment Status: Success\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                                'clienttransid' => generateRandomClientTransId(),
                                'bill_msisdn' => $cli,
                                'tran_type' => 'P',
                                'request_type' => 'B',
                                'rn_code' => '91',
                            ];

                            $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);


                        }


            });

            return redirect($completion . "?status=success");
        } else if ($status === "fail") {
            app('db')->transaction(function () use ($order_id, $request) {
                $order = Order::findOrFail($order_id);
                $order->payment_status_id = Order::PAYMENT_STATUS_UNPAID;
                $order->order_status_id = Order::ORDER_STATUS_CANCELED;
                $order->update();

                $data = [
                    'name' => optional($order->customer)->name,
                    'email' => optional($order->customer)->email,
                    'subject' => "IFAD eShop: Order Placing Notification",
                ];



                $isOrderEmail=$order->customer->email ?? '';
                        $isOrderPhone=$order->customer->phone_number ?? '';

                        if($isOrderEmail != '' &&  $isOrderPhone != ''){
                            Mail::send('Email.send_order_status_change_notification', [
                                'invoice_id' => $order->id,
                                'customer_name' => optional($order->customer)->name,
                                'orderItems' => $order->orderItems,
                                'sub_total' => $order->sub_total,
                                'shipping_charge' => $order->shipping_charge,
                                'grand_total' => $order->grand_total,
                                'shipping_address' => $order->shipping_address,
                                'payment_status_name' => get_payment_status_name($order->payment_status_id),
                                'order_status_name' => get_order_status_name($order->order_status_id)
                            ], function ($message) use ($data) {
                                $message->to([
                                    $data["email"] => $data["name"],
                                    "ifadeshop@ifadgroup.com" => "ifadeshop"
                                ]);
                                $message->from(config('mail.from.address'), config('mail.from.name'));
                                $message->subject($data["subject"]);
                            });

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
                            'msisdn' => [$order->customer->phone_number],
                            'countrycode' => '880',
                            'cli' => $cli,
                            'messagetype' => '1',
                            'message' => "order confirmation from ifadeshop.com\nPayment Status: Fail\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                            'clienttransid' => generateRandomClientTransId(),
                            'bill_msisdn' => $cli,
                            'tran_type' => 'P',
                            'request_type' => 'B',
                            'rn_code' => '91',
                        ];

                        $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);



                    }else if($isOrderEmail != '' &&  $isOrderPhone == ''){
                        Mail::send('Email.send_order_status_change_notification', [
                            'invoice_id' => $order->id,
                            'customer_name' => optional($order->customer)->name,
                            'orderItems' => $order->orderItems,
                            'sub_total' => $order->sub_total,
                            'shipping_charge' => $order->shipping_charge,
                            'grand_total' => $order->grand_total,
                            'shipping_address' => $order->shipping_address,
                            'payment_status_name' => get_payment_status_name($order->payment_status_id),
                            'order_status_name' => get_order_status_name($order->order_status_id)
                        ], function ($message) use ($data) {
                            $message->to([
                                $data["email"] => $data["name"],
                                "ifadeshop@ifadgroup.com" => "ifadeshop"
                            ]);
                            $message->from(config('mail.from.address'), config('mail.from.name'));
                            $message->subject($data["subject"]);
                        });

                        }else if($isOrderEmail == '' &&  $isOrderPhone != ''){

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
                                'msisdn' => [$order->customer->phone_number],
                                'countrycode' => '880',
                                'cli' => $cli,
                                'messagetype' => '1',
                                'message' => "order confirmation from ifadeshop.com\nPayment Status: Fail\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                                'clienttransid' => generateRandomClientTransId(),
                                'bill_msisdn' => $cli,
                                'tran_type' => 'P',
                                'request_type' => 'B',
                                'rn_code' => '91',
                            ];

                            $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);


                        }
            });
            return redirect($completion . "?status=fail");
        } else if ($status === "cancel") {
            app('db')->transaction(function () use ($order_id, $request) {
                $order = Order::findOrFail($order_id);
                $order->payment_status_id = Order::PAYMENT_STATUS_UNPAID;
                $order->order_status_id = Order::ORDER_STATUS_CANCELED;
                $order->update();

                $data = [
                    'name' => optional($order->customer)->name,
                    'email' => optional($order->customer)->email,
                    'subject' => "IFAD eShop: Order Placing Notification",
                ];



                $isOrderEmail=$order->customer->email ?? '';
                        $isOrderPhone=$order->customer->phone_number ?? '';

                        if($isOrderEmail != '' &&  $isOrderPhone != ''){
                            Mail::send('Email.send_order_status_change_notification', [
                                'invoice_id' => $order->id,
                                'customer_name' => optional($order->customer)->name,
                                'orderItems' => $order->orderItems,
                                'sub_total' => $order->sub_total,
                                'shipping_charge' => $order->shipping_charge,
                                'grand_total' => $order->grand_total,
                                'shipping_address' => $order->shipping_address,
                                'payment_status_name' => get_payment_status_name($order->payment_status_id),
                                'order_status_name' => get_order_status_name($order->order_status_id)
                            ], function ($message) use ($data) {
                                $message->to([
                                    $data["email"] => $data["name"],
                                    "ifadeshop@ifadgroup.com" => "ifadeshop"
                                ]);
                                $message->from(config('mail.from.address'), config('mail.from.name'));
                                $message->subject($data["subject"]);
                            });

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
                            'msisdn' => [$order->customer->phone_number],
                            'countrycode' => '880',
                            'cli' => $cli,
                            'messagetype' => '1',
                            'message' => "order confirmation from ifadeshop.com\nPayment Status: Cancel\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                            'clienttransid' => generateRandomClientTransId(),
                            'bill_msisdn' => $cli,
                            'tran_type' => 'P',
                            'request_type' => 'B',
                            'rn_code' => '91',
                        ];

                        $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);



                    }else if($isOrderEmail != '' &&  $isOrderPhone == ''){
                        Mail::send('Email.send_order_status_change_notification', [
                            'invoice_id' => $order->id,
                            'customer_name' => optional($order->customer)->name,
                            'orderItems' => $order->orderItems,
                            'sub_total' => $order->sub_total,
                            'shipping_charge' => $order->shipping_charge,
                            'grand_total' => $order->grand_total,
                            'shipping_address' => $order->shipping_address,
                            'payment_status_name' => get_payment_status_name($order->payment_status_id),
                            'order_status_name' => get_order_status_name($order->order_status_id)
                        ], function ($message) use ($data) {
                            $message->to([
                                $data["email"] => $data["name"],
                                "ifadeshop@ifadgroup.com" => "ifadeshop"
                            ]);
                            $message->from(config('mail.from.address'), config('mail.from.name'));
                            $message->subject($data["subject"]);
                        });

                        }else if($isOrderEmail == '' &&  $isOrderPhone != ''){

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
                                'msisdn' => [$order->customer->phone_number],
                                'countrycode' => '880',
                                'cli' => $cli,
                                'messagetype' => '1',
                                'message' => "order confirmation from ifadeshop.com\nPayment Status: Cancel\nyour order id:".$order->id."\nTotal Amount: ".$order->grand_total,
                                'clienttransid' => generateRandomClientTransId(),
                                'bill_msisdn' => $cli,
                                'tran_type' => 'P',
                                'request_type' => 'B',
                                'rn_code' => '91',
                            ];

                            $httpResponse = makeHttpRequest('POST', $apiEndpoint, $requestData);


                        }
            });
            return redirect($completion . "?status=cancel");
        }
        return redirect($completion . "?status=fail");
    }
}
