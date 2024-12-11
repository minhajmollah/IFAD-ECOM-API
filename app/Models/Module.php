<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
    use HasFactory;
    protected $table = 'modules';
    public $timestamps = false;

    public function parent(){
        return $this->belongsTo(Module::class,'parent_id','id');
    }

    public function children(){

        return $this->hasMany(Module::class,'parent_id','id')->orderBy('order','asc')->where('status','=',1);
    }
}
