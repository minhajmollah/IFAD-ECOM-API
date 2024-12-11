<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\GalleryCategory;
class Picture extends Model
{
    use HasFactory;
    protected $table = 'pictures';
    public $timestamps = false;
    public function gallery_category()
    {
      return $this->belongsTo(GalleryCategory::class,'gallery_category_id', 'id');
    }
}
