<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class InventoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $data = $this->resource->toArray();
        $data['star_ratting'] = ceil($this->reviews()->avg('ratting_number'));
        $data['reviews_count'] = $this->reviews()->count();

        return $data;
    }
}
