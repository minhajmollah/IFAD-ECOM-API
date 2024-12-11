<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductImageResource extends JsonResource
{
    public static $wrap = 'data';
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        
        return[
            'product_slide_image' => env('BASE_URL').'product-multi-image/'.$this->image,
            /* 'subcategory' => new SubCategoryResource($this->subcategory), */
        ];
    }
}
