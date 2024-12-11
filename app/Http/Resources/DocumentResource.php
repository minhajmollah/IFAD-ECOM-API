<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DocumentResource extends JsonResource
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
	    'document_id' => $this->id,
            'document_name' => $this->name,
	    'document_count' => $this->document_count,
            'document_image' => env('BASE_URL').'document-image/'.$this->image,
	    'document_file' => env('BASE_URL').'document-image/'.$this->document_file,
	    'document_desc' => $this->document_desc,
        ];
    }
}
