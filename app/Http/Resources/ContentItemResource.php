<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\ContentTypeResource;
use App\Http\Resources\ContentModuleResource;
class ContentItemResource extends JsonResource
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
	    'item_order' =>$this->item_order,
            'item_name' => $this->name,
            'item_image' => env('BASE_URL').'content-item/'.$this->image,
            'item_banner' => env('BASE_URL').'content-banner-item/'.$this->item_image_banner,
            'item_link' => $this->item_link,
            'item_video_link' => $this->item_video_link,
            'item_date' => $this->item_date,
            'item_short_desc' => $this->item_short_desc,
            'item_long_desc' => $this->item_long_desc,
            'content_type' => new ContentTypeResource($this->content_type),
            //'content_module' => new ContentModuleResource($this->content_module),
        ];

    }
}
