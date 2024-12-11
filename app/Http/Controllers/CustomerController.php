<?php

namespace App\Http\Controllers;

use App\Models\Address;
use App\Models\Customer;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Customer::query();
            return $query->paginate($request->get('limit', 15));
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function show($id)
    {
        try {
            return Customer::findOrFail($id);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function update(Request $request)
    {
        try {
            $rules = [
                'name' => ['required'],
                'date_of_birth' => ['nullable'],
                'gender' => ['nullable'],
                'phone_number' => ['nullable'],
                'email' => ['nullable'],
            ];

            if ($request->hasFile('image')) {
                $rules['image'] = ['image', 'mimes:jpg,png,jpeg,gif', 'max:2048'];
            }

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $customer = Customer::findOrFail(Auth::id());
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->date_of_birth = $request->date_of_birth;
            $customer->gender = $request->gender;
            $customer->phone_number = $request->phone_number;

            if ($request->hasFile('image')) {
                $dir = 'uploads/' . date('Y') . '/' . date('m');

                if ($request->filled('old_image')) {
                    File::delete($request->old_image);
                }

                $image = $request->file('image');
                $imageName = time() . '_' . $image->getClientOriginalName();
                $image->move($dir, $imageName);
                $customer->image = "$dir/$imageName";
            }

            $customer->update();

            return make_success_response("Record saved successfully.", $customer);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function getAddresses()
    {
        try {
            return Address::where('customer_id', Auth::id())->paginate();
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}

