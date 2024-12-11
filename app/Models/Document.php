<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\CategoryDocument;

class Document extends Model
{
    use HasFactory;
    protected $table = 'documents';
    public $timestamps = false;

    public function category_document()
    {
      return $this->belongsTo(CategoryDocument::class,'document_category_id','id')->where('status','=',1)->orderBy(DB::raw('ISNULL(document_order), document_order'), 'ASC');
    }

}
