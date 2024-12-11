<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class VideoResource extends JsonResource
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
            'video_name' => $this->name,
            'video_link' => $this->video_link,
            'video' => env('BASE_URL').'video/'.$this->video,
        ];
    }
}
