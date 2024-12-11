<?php

namespace App\Http\Controllers;
use App\Models\ConditionalDiscount;
use App\Models\Customer;
use App\Models\CouponUserGroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ConditionalDiscountController extends Controller
{
    public function index(){
        $conditionalDiscount = ConditionalDiscount::where('condition_exp_date', '>=', now())
        ->where('status', 1)
        ->get();

        return $conditionalDiscount;
    }
    // public function groupId(Request $request)
    // {
    //     $customerId=Auth::user()->id;

    //     $groups = DB::table('coupon_user_groups')->select('id','group_name')
    //     ->where('status',1)
    //     ->whereRaw("JSON_CONTAINS(customer_id, '\"$customerId\"')")
    //     ->get();

    //     return $groups;

    // }

}
