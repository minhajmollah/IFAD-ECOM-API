<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Variant;
use App\Models\VariantOption;
use App\Models\Segment;
use App\Models\PackType;
use App\Models\ProductImage;
use App\Models\ProductLifestyle;
use App\Models\Product;
use App\Http\Resources\ProductResource;
use Exception;
use Illuminate\Database\QueryException;
use DB;
class ProductController extends Controller
{
    /**
     * @method_name :- allCategory
     * --------------------------------------------------------
     * @param  :-
     * ?return :-  json($data)
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 10:10:17
     * description :- this function given all categories data
     */
    public function allCategory(){

        try {
            $categories=Category::where('status','=',1)->all();
            $data[] = [
                'status' => true,
                'status_code' => 200,
                'message' => 'Product Category List',
                'product_category_list' =>$categories,
                ];
            return response()->json($data);

        } catch (\Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }

    }

    /**
     * @method_name :- allSubCategory
     * --------------------------------------------------------
     * @param  :-  $id
     * ?return :-  json($data)
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 10:12:31
     * description :- Sub Category id wies all sub category list
     */
    public function allSubCategory($id){

        try {
            $sub_categories=SubCategory::where('category_id','=',$id)->get();
            if (count($sub_categories) === 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Product Category id wise subcategory List',
                    'category_id_wise_subcategory_list' =>$sub_categories,
                    ];
                return response()->json($data);
            }elseif (count($sub_categories) > 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Product Category id wise subcategory List',
                    'category_id_wise_subcategory_list' =>$sub_categories,
                    ];
                return response()->json($data);

            }else{
                return response()->json([
                    'status' => false,
                    'status_code' => 400,
                    'message' => 'Do not match your category id. Please try again'
                ]);
            }


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }

    }
    /**
     * @method_name :- allCategroyWithSubCategorylist
     * --------------------------------------------------------
     * @param  :-  {{}|any}
     * ?return :-  json([$data])
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 10:13:32
     * description :- All category with subcategory list
     */
    public function allCategroyWithSubCategorylist(){
        try {
            $sub_categories=Category::with('subCategories')->where('status','=',1)->get();
            $data = [
                'status' => true,
                'status_code' => 200,
                'message' => 'Product Category with sub category List',
                'product_category_list' =>$sub_categories,
                ];
            return response()->json([$data]);

        } catch (\Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }
    /**
     * @method_name :- CategoryidWiseProduct
     * --------------------------------------------------------
     * @param  :-  $id
     * ?return :-  {{}|any}
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 10:14:23
     * description :- Category Id wise Product show
     */
    public function CategoryidWiseProduct($id){
        try {
            $products=Product::select('id','name','image','product_short_desc')->where('category_id','=',$id)->where('status','=',1)->get();
            if (count($products) === 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Category id wise Product List',
                    'category_id_wise_product_list' =>$products,
                    ];
                return response()->json($data);
            }elseif (count($products) > 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Category id wise Product List',
                    'category_id_wise_product_list' =>$products,
                    ];
                return response()->json($data);

            }else{
                return response()->json([
                    'status' => false,
                    'status_code' => 400,
                    'message' => 'Do not match your category id. Please try again'
                ]);
            }


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }
    }

    /**
     * @method_name :- SubCategoryidWiseProduct
     * --------------------------------------------------------
     * @param  :-  $id
     * ?return :-  {{}|any}
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 10:16:05
     * description :- Sub Category Id wise product
     */
    public function SubCategoryidWiseProduct($id){
        try {
            $products=Product::select('id','name','image','product_short_desc')->where('sub_category_id','=',$id)->get();
            if (count($products) === 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Sub Category id wise Product List',
                    'sub_category_id_wise_subcategory_list' =>$products,
                    ];
                return response()->json($data);
            }elseif (count($products) > 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Sub Category id wise Product List',
                    'sub_category_id_wise_subcategory_list' =>$products,
                    ];
                return response()->json($data);

            }else{
                return response()->json([
                    'status' => false,
                    'status_code' => 400,
                    'message' => 'Do not match your category id. Please try again'
                ]);
            }


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }
    }
    /**
     * @method_name :- productList
     * --------------------------------------------------------
     * @param  :-  {{}|any}
     * ?return :-  json($data)
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 11:47:17
     * description :- All Product List
     */
    public function productList(){

        try {
            $products=Product::select('id','name','image','lifestyle_image','product_short_desc','product_long_desc','product_video_path')->get();
            $data[] = [
                'status' => true,
                'status_code' => 200,
                'message' => 'Product List',
                'product_list' =>$products,
                ];
            return response()->json($data);

        } catch (\Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }

    }

    public function productIdWiseDetails($id){
        try {
            $products=Product::with('variant', 'variantOption','segment','pack','productImages','productLifestyles')->where('id', '=', $id)->get();
            if (count($products) === 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Product id wise Product Details',
                    'product_id_wise_Details' =>$products,
                    ];
                return response()->json($data);
            }elseif (count($products) > 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Product id wise Product Details',
                    'sub_category_id_wise_subcategory_list' =>$products,
                    ];
                return response()->json($data);

            }else{
                return response()->json([
                    'status' => false,
                    'status_code' => 400,
                    'message' => 'Do not match your category id. Please try again'
                ]);
            }


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }
    }
    public function allProduct(){
        $product = Product::where('status','=',1)->orderBy(DB::raw('ISNULL(product_order), product_order'), 'ASC')->get();
        return ProductResource::collection($product);
    }

    public function singleProduct($id){
        try {
            $product = Product::where('id','=',$id)->get();
            return ProductResource::collection($product);
            /* if ($product->id == $id){
                return 'ok';
            }else{
                return response()->json([
                    'status' => false,
                    'status_code' => 400,
                    'message' => 'Do not match your category id. Please try again'
                ]);
            } */


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }

    }



    /* public function allProduct(){
        try {
            $products=Product::select('id','name','image','lifestyle_image','product_brochure','product_link','product_bncn','product_video_path','product_short_desc','product_long_desc','status','category_id','sub_category_id','variant_id','variant_option_id','segment_id','pack_id')->with('category','subCategory')->where('status','=',1)->get();
            if (count($products) === 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Product id wise Product Details',
                    'product_list' =>$products,
                    ];
                return response()->json($data);
            }elseif (count($products) > 1){
                $data[] = [
                    'status' => true,
                    'status_code' => 200,
                    'message' => 'Product id wise Product Details',
                    'product_list' =>$products,
                    ];
                return response()->json($data);

            }else{
                return response()->json([
                    'status' => false,
                    'status_code' => 400,
                    'message' => 'Do not match your category id. Please try again'
                ]);
            }


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }
    } */









}
