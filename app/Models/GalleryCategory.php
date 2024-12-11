<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Picture;
use App\Models\Video;
class GalleryCategory extends Model
{
    use HasFactory;
    protected $table = 'gallery_categorys';
    public $timestamps = false;
    public function pictures()
    {
      return $this->hasMany(Picture::class,'gallery_category_id', 'id');
    }
    public function videos()
    {
      return $this->hasMany(Video::class,'gallery_category_id', 'id');
    }
}
