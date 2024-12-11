<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Category;
use App\Models\Product;

/**
 * @method static paginate()
 * @method static findOrFail($id)
 */
class SubCategory extends Model
{
    use HasFactory;
    protected $table = 'sub_categories';
    public $timestamps = false;


    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id')->where('status', 1);
    }

    public function product()
    {
      return $this->hasOne(Product::class);
    }


}
