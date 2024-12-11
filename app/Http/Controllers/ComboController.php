<?php

namespace App\Http\Controllers;

use App\Models\Combo;
use Exception;
use Illuminate\Http\Request;

class ComboController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Combo::query();
            $query->where('status', Combo::STATUS_ACTIVE);
            $query->with('comboCategory', 'comboItems', 'comboImages');

            $query->when($request->order_column && $request->order_by, function ($q) use ($request) {
                $q->orderBy($request->order_column, $request->order_by);
            });

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
            return Combo::with(['comboCategory', 'comboItems', 'comboImages', 'reviews'])
                ->where('status', Combo::STATUS_ACTIVE)
                ->findOrFail($id);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function getByComboCategory(Request $request, $comboCategoryId)
    {
        try {
            $query = Combo::query();
            $query->with(['comboCategory', 'comboItems', 'comboImages']);
            $query->where('combo_category_id', $comboCategoryId);
            $query->where('status', Combo::STATUS_ACTIVE);

            if ($request->paginate === 'yes') {
                return $query->paginate($request->get('limit', 15));
            } else {
                return $query->get();
            }
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function search(Request $request)
    {
        try {
            $keyword = $request->keyword;

            $query = Combo::query();
            $query->with(['comboCategory', 'comboItems', 'comboImages']);
            $query->where('title', 'LIKE', "%" . $keyword . "%");
            $query->where('status', Combo::STATUS_ACTIVE);

            return $query->paginate();
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}
