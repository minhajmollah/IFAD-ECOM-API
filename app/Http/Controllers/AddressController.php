<?php

namespace App\Http\Controllers;

use App\Models\Address;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AddressController extends Controller
{
    public function index(Request $request)
    {
        try {
            return Address::with(['division', 'district', 'upazila'])
                ->where('customer_id', Auth::id())
                ->get();
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function show(Request $request, $id)
    {
        try {
            return Address::where('customer_id', Auth::id())->findOrFail($id);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => ['required'],
                'name' => ['required'],
                'address_line_1' => ['required'],
                'division_id' => ['required', 'numeric'],
                'district_id' => ['required', 'numeric'],
                'upazila_id' => ['required', 'numeric'],
                'postcode' => ['required'],
                'phone' => ['required']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $address = new Address();
            $address->title = $request->title;
            $address->name = $request->name;
            $address->address_line_1 = $request->address_line_1;
            $address->address_line_2 = $request->address_line_2;
            $address->division_id = $request->division_id;
            $address->district_id = $request->district_id;
            $address->upazila_id = $request->upazila_id;
            $address->postcode = $request->postcode;
            $address->phone = $request->phone;
            $address->email = $request->email;
            $address->customer_id = Auth::id();
            $address->is_default_billing = $request->is_default_billing ? '1' : null;
            $address->is_default_shipping = $request->is_default_shipping ?'1' : null;
            $address->save();

            return make_success_response("Record saved successfully.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => ['required'],
                'address_line_1' => ['required'],
                'division_id' => ['required', 'numeric'],
                'district_id' => ['required', 'numeric'],
                'upazila_id' => ['required', 'numeric'],
                'postcode' => ['required'],
                'phone' => ['required']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $address = Address::where('customer_id', Auth::id())->findOrFail($id);
            $address->title = $request->title;
            $address->name = $request->name;
            $address->address_line_1 = $request->address_line_1;
            $address->address_line_2 = $request->address_line_2;
            $address->division_id = $request->division_id;
            $address->district_id = $request->district_id;
            $address->upazila_id = $request->upazila_id;
            $address->postcode = $request->postcode;
            $address->phone = $request->phone;
            $address->email = $request->email;
            $address->update();

            return make_success_response("Record updated successfully.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function destroy($id)
    {
        try {
            $address = Address::where('customer_id', Auth::id())->findOrFail($id);

            if ($address) {
                $address->delete();
            }

            return make_success_response("Record deleted successfully.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function setDefaultShipping(Request $request, $id)
    {
        try {
            Address::get()->map(function ($address) {
                $address->is_default_shipping = null;
                $address->update();
            });

            $address = Address::where('customer_id', Auth::id())->findOrFail($id);
            $address->is_default_shipping = '1';
            $address->update();

            return make_success_response("Record updated successfully.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function setDefaultBilling(Request $request, $id)
    {
        try {
            Address::get()->map(function ($address) {
                $address->is_default_billing = null;
                $address->update();
            });

            $address = Address::where('customer_id', Auth::id())->findOrFail($id);
            $address->is_default_billing = '1';
            $address->update();

            return make_success_response("Record updated successfully.");
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}

