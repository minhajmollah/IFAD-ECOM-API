<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PictureResource;
use App\Http\Resources\VideoResource;
class GalleryCategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return[
            'id' =>$this->id,
            'category_name' => $this->name,
            'pictures' => PictureResource::collection($this->pictures),
        ];


    }
}
