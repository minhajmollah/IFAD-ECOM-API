<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
class PackType extends Model
{
    protected $table = 'pack_types';

    public function product()
    {
      return $this->hasOne(Product::class);
    }
}
