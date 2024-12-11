<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ContentItem;
class ContentType extends Model
{
    use HasFactory;
    protected $table = 'content_types';
    public $timestamps = false;

    public function content_item()
    {
      return $this->hasOne(ContentItem::class,'type_id', 'id');
    }

}
