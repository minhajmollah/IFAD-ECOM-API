<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Document;


class CategoryDocument extends Model
{
    use HasFactory;
    protected $table = 'document_categories';
    public $timestamps = false;

    public function documents()
    {
      return $this->hasMany(Document::class,'document_category_id','id');
    }
}
