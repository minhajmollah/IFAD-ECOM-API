<?php

namespace App\Http\Controllers;

use App\Models\SubCategory;
use Illuminate\Http\Request;

class SubCategoryController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = SubCategory::query();

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

    public function show(Request $request, $id)
    {
        try {
            return SubCategory::findOrFail($id);
        } catch (\Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}
