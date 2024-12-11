<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\ContentItemResource;
class ContentModuleResource extends JsonResource
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
            'module_name' => $this->name,
            'module_image' => env('BASE_URL').'content-module/'.$this->image,
            'module_description' => $this->module_description,
            'module_color' => $this->module_color,
            'content_item' => ContentItemResource::collection($this->content_item),
        ];
    }
}
