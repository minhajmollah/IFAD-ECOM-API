<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ContentItem;
use DB;
class ContentModule extends Model
{
    use HasFactory;
    protected $table = 'content_modules';
    public $timestamps = false;

    public function content_item()
    {
      return $this->hasMany(ContentItem::class,'module_id', 'id')->where('status','=',1)->orderBy(DB::raw('ISNULL(item_order), item_order'), 'ASC');
    }
}
