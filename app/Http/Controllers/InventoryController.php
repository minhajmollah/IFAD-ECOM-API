<?php

namespace App\Http\Controllers;

use App\Http\Resources\InventoryResource;
use App\Models\Inventory;
use App\Models\InventoryVariant;
use Exception;
use Illuminate\Http\Request;

class InventoryController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Inventory::query();
            $query->with(['product', 'inventoryVariants', 'inventoryImages']);

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

    public function discounted(Request $request)
    {
        try {
            $query = Inventory::query();
            $query->with(['product', 'inventoryVariants', 'inventoryImages']);
            $query->where('status', Inventory::STATUS_ACTIVE);

            $query->whereDate('offer_start', '<=', date('Y-m-d'));
            $query->whereDate('offer_end', '>=', date('Y-m-d'));

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

    public function byCategory(Request $request, $categoryId)
    {
        try {
            $query = Inventory::query();
            $query->with(['product', 'inventoryVariants', 'inventoryImages']);
            $query->where('status', Inventory::STATUS_ACTIVE);

            $query->whereHas('product', function ($query) use ($categoryId) {
                $query->where('category_id', $categoryId);
            });

            $query->when($request->order_column && $request->order_by, function ($q) use ($request) {
                $q->orderBy($request->order_column, $request->order_by);
            });

            $query->when($request->limit, function ($q) use ($request) {
                $q->limit($request->limit);
            });

            if ($request->paginate === 'yes') {
                return InventoryResource::collection($query->paginate($request->get('limit', 15)));
            } else {
                return $query->get();
            }
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function bySubCategory(Request $request, $subCategoryId)
    {
        try {
            $query = Inventory::query();
            $query->with(['product', 'inventoryVariants', 'inventoryImages']);
            $query->where('status', Inventory::STATUS_ACTIVE);

            $query->whereHas('product', function ($query) use ($subCategoryId) {
                $query->where('sub_category_id', $subCategoryId);
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
            $inventory = Inventory::with(['product', 'inventoryVariants', 'inventoryImages'])
                ->where('status', Inventory::STATUS_ACTIVE)
                ->findOrFail($id);

            return new InventoryResource($inventory);
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function search(Request $request)
    {
        try {
            $keyword = $request->keyword;

            $query = Inventory::query();
            $query->with(['product', 'inventoryVariants', 'inventoryImages']);
            $query->where('status', Inventory::STATUS_ACTIVE);

            $query->when($keyword, function ($query) use ($keyword) {
                $query->whereHas('product', function ($query) use ($keyword) {
                    $query->where('title', 'LIKE', "%" . $keyword . "%");
                });
            });

            $query->when($request->limit, function ($query) use ($request) {
                $query->limit($request->limit);
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

    public function storeInventoryVariants(Request $request, $inventoryId)
    {
        try {
            if (!$request->filled('inventory_variant_ids')) {
                throw new Exception('The given data was invalid!');
            }

            $inventoryVariantIds = $request->input('inventory_variant_ids', []);

            $inventoryVariation = InventoryVariant::with('inventory')
                ->whereIn('id', $inventoryVariantIds)
                ->where('inventory_id', '!=', $inventoryId)
                ->first();

            return $inventoryVariation;
        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }

    public function getProductVariationOptions($productId)
    {
        try {
            $inventoryIds = Inventory::where('product_id', $productId)->get()->pluck('id');

            $inventoryVariants = InventoryVariant::with('variant', 'variantOption')
                ->whereIn('inventory_id', $inventoryIds)
                ->get();

            $variantOptions = [];
            foreach ($inventoryVariants as $inventoryVariant) {
                if ($inventoryVariant->variant && $inventoryVariant->variantOption) {
                    $variantOptions[$inventoryVariant->variant->name][] = [
                        'inventory_variant_id' => $inventoryVariant->id,
                        'variant_option_name' => $inventoryVariant->variantOption->name
                    ];
                }
            }

            return $variantOptions;

        } catch (Exception $exception) {
            return make_error_response($exception->getMessage());
        }
    }
}
