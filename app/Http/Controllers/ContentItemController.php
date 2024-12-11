<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ContentItem;
use App\Models\ContentModule;
use App\Http\Resources\ContentItemResource;

class ContentItemController extends Controller
{
    public function contentItemDetails(){
        try {
            $contentItems = ContentItem::all();
            return ContentItemResource::collection($contentItems);


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
