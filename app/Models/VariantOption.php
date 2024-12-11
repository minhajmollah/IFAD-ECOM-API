<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Variant;
use App\Models\Product;

class VariantOption extends Model
{
    public function variant()
    {
      return $this->belongsTo(Variant::class);
    }

    public function product()
    {
      return $this->hasOne(Product::class);
    }
}
