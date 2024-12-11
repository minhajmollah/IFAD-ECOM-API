<?php

namespace App\Http\Controllers;

use App\Models\Upazila;
use Illuminate\Http\Request;

class UpazilaController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Upazila::query();

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

    public function getByDistrict(Request $request, $district_id)
    {
        try {
            $query = Upazila::query();
            $query->where('district_id', $district_id);

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
}
