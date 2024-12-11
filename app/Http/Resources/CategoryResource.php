<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\SubCategoryResource;
class CategoryResource extends JsonResource
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
            'name' => $this->name,
            /* 'subcategory' => new SubCategoryResource($this->subcategory), */
        ];
    }
}
