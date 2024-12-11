<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Blog;
use App\Http\Resources\BlogResource;
use DB;
class BlogController extends Controller
{
    public function allBlog(){
        $blog = Blog::where('status','=',1)->orderBy(DB::raw('ISNULL(blog_order), blog_order'), 'ASC')->get();
        return BlogResource::collection($blog);
    }

    public function blogDetails($id){
        try {
            $blogs = Blog::where('id','=',$id)->get();
            return BlogResource::collection($blogs);


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }
    }

}
