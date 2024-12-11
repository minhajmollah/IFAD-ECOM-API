<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\BlogCategoryResource;
class BlogResource extends JsonResource
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
            'blog_name' => $this->name,
            'blog_image'=> env('BASE_URL').'blog/'.$this->image,
            'blog_banner_image'=> env('BASE_URL').'blog/'.$this->blog_banner_image,
            'blog_author'=> $this->blog_author,
            'blog_date'=> $this->blog_date,
            'blog_short_desc'=> $this->blog_short_desc,
            'blog_long_desc'=> $this->blog_long_desc,
            'blog_category' => new BlogCategoryResource($this->blog_category),

        ];
    }
}
