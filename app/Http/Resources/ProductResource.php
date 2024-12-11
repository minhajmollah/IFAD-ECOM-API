<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductImageResource;
use App\Http\Resources\ProductLifestyleResource;
use App\Http\Resources\VariantResource;
class ProductResource extends JsonResource
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
        $productMultiImages = ProductImageResource::collection($this->productmultiimage)->map(function($item){
           return env('BASE_URL').'product-multi-image/'.$item->image;
        });
        $productLifesytleImages = ProductLifestyleResource::collection($this->productlifestyle)->map(function($lifeitem){
            return env('BASE_URL').'product-lifestyle-multi-image/'.$lifeitem->lifestyle_image;
         });

        return[
            'id' =>$this->id,
            'product_name' => $this->name,
            'Product_image'=> env('BASE_URL').'product/'.$this->image,
            'product_lifestyle_image'=> env('BASE_URL').'product/'.$this->lifestyle_image,
            'proudct_brochure'=> env('BASE_URL').'product-brochure/'.$this->product_brochure,
            'proudct_video'=> env('BASE_URL').'product-video/'.$this->product_video_path,
            'product_short_desc'=> $this->product_short_desc,
            'product_long_desc'=> $this->product_long_desc,
            'video_link'=> $this->product_link,
            'product_bncn'=> $this->product_bncn,
            /* 'category' => $this->category->name, */
            'category' => new CategoryResource($this->category),
            'subcategory' => new SubCategoryResource($this->sub_category),
            'productvariant' => new VariantResource($this->variant),
            'productVariantOption' => new VariantOptionResource($this->variantOption),
            'segment' => new SegmentResource($this->segment),
            'packtype' => new PackTypeResource($this->pack),
            'product_multi_images' => $productMultiImages,
            'product_lifesytle_images' => $productLifesytleImages,

        ];
    }
}
