<?php

namespace App\Http\Controllers;

use App\Models\PaymentMethod;
use Illuminate\Http\Request;

class PaymentMethodController extends Controller
{
    public function index(Request $request)
    {
        try {
            return PaymentMethod::where('status', PaymentMethod::STATUS_ACTIVE)->get();
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function show($id)
    {
        try {
            return PaymentMethod::findOrFail($id);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}

