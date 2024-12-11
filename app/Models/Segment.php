<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
class Segment extends Model
{
    public function product()
    {
      return $this->hasOne(Product::class);
    }
}
