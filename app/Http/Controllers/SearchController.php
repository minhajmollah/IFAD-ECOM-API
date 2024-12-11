<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Resources\ProductResource;
use App\Models\Product;

class SearchController extends Controller
{
	public function Search($name){

        //$products = DB::table('products','blogs')->select('products.name as product')->paginate(10)->get();
            $p1 = Product::where('name', 'like', '%' . $name . '%')
		->orWhere('product_short_desc', 'like', '%' . $name . '%')
		->orWhere('product_long_desc', 'like', '%' . $name . '%')
		->where('status','=',1)
		->get();
            return ProductResource::collection($p1);



    	}
    
}
