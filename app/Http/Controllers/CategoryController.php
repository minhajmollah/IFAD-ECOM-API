<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Exception;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Category::query();
            $query->where('status', Category::STATUS_ACTIVE);

            $query->when($request->limit, function ($q) use ($request) {
                $q->limit($request->limit);
            });

            if ($request->paginate === 'yes') {
                return $query->paginate($request->get('limit', 15));
            } else {
                return $query->get();
            }
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function show($id)
    {
        try {
            return Category::findOrFail($id);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}
