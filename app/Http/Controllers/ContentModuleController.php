<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ContentModule;
use App\Http\Resources\ContentModuleResource;
class ContentModuleController extends Controller
{
    public function contentModule($id){
        try {
            $contentItems = ContentModule::where('id','=',$id)->get();
            return ContentModuleResource::collection($contentItems);


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
