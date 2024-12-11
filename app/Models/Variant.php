<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
//use App\Models\VariantOption;

class Variant extends Model
{
    use HasFactory;

    protected $table = 'variants';
    public $timestamps = false;

    public function product()
    {
      return $this->hasOne(Product::class);
    }
/*

    public function variantOptions()
    {
      return $this->hasMany(VariantOption::class);
    } */

}
