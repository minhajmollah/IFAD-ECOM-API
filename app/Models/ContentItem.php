<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Models\ContentModule;
use App\Models\ContentType;
class ContentItem extends Model
{
    protected $table = 'content_items';
    public $timestamps = false;


    public function content_type()
    {
      return $this->belongsTo(ContentType::class,'type_id', 'id');
    }
    public function content_module()
    {
      return $this->hasOne(ContentModule::class,'module_id', 'id');
    }
}
