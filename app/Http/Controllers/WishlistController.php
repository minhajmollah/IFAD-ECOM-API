<?php

namespace App\Http\Controllers;

use App\Models\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class WishlistController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Wishlist::query();
            $query->where('customer_id', Auth::id());
            $query->with('customer', 'inventory', 'combo');

            return $query->paginate($request->get('limit', 15));
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function show($id)
    {
        try {
            return Wishlist::with('customer', 'inventory', 'combo')->findOrFail($id);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function sync(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'inventory_id' => ['required', 'numeric']
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $isExists = Wishlist::where('customer_id', $request->customer_id)
                ->where('inventory_id', $request->inventory_id)->exists();

            if ($isExists) {
                return make_error_response("Already existed.");
            }

            $wishlist = Wishlist::where('customer_id', Auth::id())
                ->where('inventory_id', $request->inventory_id)->first();

            if ($wishlist) {
                $wishlist->delete();

                return make_success_response("Record deleted successfully.", [
                    'favourite' => false
                ]);
            }

            Wishlist::create([
                'customer_id' => Auth::id(),
                'inventory_id' => $request->inventory_id
            ]);

            return make_success_response("Record saved successfully.", [
                'favourite' => true
            ]);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function getInventoryStatus(Request $request, $inventoryId)
    {
        try {
            $wishlist = Wishlist::where('customer_id', Auth::id())
                ->where('inventory_id', $inventoryId)->first();

            if ($wishlist) {
                return response()->json([
                    'favourite' => true
                ]);
            }

            return response()->json([
                'favourite' => false
            ]);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function destroy($id)
    {
        try {
            $wishlist = Wishlist::findOrFail($id);

            if ($wishlist) {
                $wishlist->delete();
            }

            return make_success_response("Record deleted successfully.");
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}
