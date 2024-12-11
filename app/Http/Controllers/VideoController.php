<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Video;
use App\Http\Resources\VideoResource;

class VideoController extends Controller
{
    public function allVideos(){
        $pictures = Video::where('status','=',1)->get();
        return VideoResource::collection($pictures);
    }
}
