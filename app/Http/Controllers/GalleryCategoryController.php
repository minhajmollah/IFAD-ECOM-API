<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\GalleryCategory;
use App\Http\Resources\GalleryCategoryResource;
use App\Http\Resources\GalleryCategoryVideoResource;
class GalleryCategoryController extends Controller
{
    public function galleryPictureCategory(){
        try {
            $galleryCategories = GalleryCategory::get();
            return GalleryCategoryResource::collection($galleryCategories);


        } catch (Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'status_code' => 400,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function galleryVideoCategory(){
        try {
            $galleryCategories = GalleryCategory::get();
            return GalleryCategoryVideoResource::collection($galleryCategories);


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
