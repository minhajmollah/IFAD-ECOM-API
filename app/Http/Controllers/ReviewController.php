<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ReviewController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Review::query();
            $query->with('customer', 'inventory', 'combo');

            $query->when($request->limit, function ($query) use ($request) {
                $query->limit($request->limit);
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

    public function getReviewsByInventory(Request $request, $inventoryId)
    {
        try {
            $query = Review::query();
            $query->with('customer', 'inventory', 'combo');
            $query->where('inventory_id', $inventoryId);

            $query->when($request->limit, function ($query) use ($request) {
                $query->limit($request->limit);
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

    public function checkInventoryReviewCapability($inventoryId)
    {
        try {
            $exists = Order::where('customer_id', Auth::id())
                ->whereHas('orderItems', function ($query) use ($inventoryId) {
                    $query->where('inventory_id', $inventoryId);
                })->exists();

            $exists2 = Review::where('customer_id', Auth::id())
                ->where('inventory_id', $inventoryId)
                ->exists();

            if ($exists2) {
                return response()->json([
                    "capability" => false
                ]);
            }

            if ($exists) {
                return response()->json([
                    "capability" => true
                ]);
            }

            return response()->json([
                "capability" => false
            ]);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function checkComboReviewCapability($comboId)
    {
        try {
            $exists = Order::where('customer_id', Auth::id())
                ->whereHas('orderItems', function ($query) use ($comboId) {
                    $query->where('combo_id', $comboId);
                })->exists();

            if ($exists) {
                return response()->json([
                    "capability" => true
                ]);
            }

            return response()->json([
                "capability" => false
            ]);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'ratting_number' => ['required'],
                // 'comments' => ['required'],
                'inventory_id' => ['nullable', 'numeric'],
                'combo_id' => ['nullable', 'numeric'],
            ]);

            if ($validator->fails()) {
                return make_validation_error_response($validator->errors());
            }

            $isExists = Review::where('customer_id', Auth::id())
                ->where('inventory_id', $request->inventory_id)->exists();

            $orIsExists = Review::where('customer_id', Auth::id())
                ->where('combo_id', $request->combo_id)->exists();

            if ($isExists || $orIsExists) {
                return make_error_response("Already existed.");
            }

            $review = new Review();
            $review->ratting_number = $request->ratting_number;
            $review->comments = $request->comments;
            $review->customer_id = Auth::id();
            $review->inventory_id = $request->inventory_id;
            $review->combo_id = $request->combo_id;
            $review->status = Review::STATUS_PENDING;
            $review->save();

            return make_success_response("Record saved successfully. Waiting for approved!");
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function show($id)
    {
        try {
            return Review::with('customer', 'inventory', 'combo')->findOrFail($id);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function destroy($id)
    {
        try {
            $review = Review::findOrFail($id);

            if ($review) {
                $review->delete();
            }

            return make_success_response("Record deleted successfully.");
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}
