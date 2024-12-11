<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Picture;
use App\Http\Resources\PictureResource;
class PictureController extends Controller
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
    public function allPictures(){
        $pictures = Picture::where('status','=',1)->get();
        return PictureResource::collection($pictures);
    }



}
