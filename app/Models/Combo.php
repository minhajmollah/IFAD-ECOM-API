<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


/**
 * @method static findOrFail($id)
 */
class Combo extends Model
{
    use HasFactory;

    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 2;

    protected $fillable = [];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function comboCategory()
    {
        return $this->belongsTo(ComboCategory::class, 'combo_category_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function comboItems()
    {
        return $this->hasMany(ComboItem::class, 'combo_id', 'id')->with('inventory','inventoryVariants');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function comboImages()
    {
        return $this->hasMany(ComboImage::class, 'combo_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function wishlist()
    {
        return $this->hasMany(Wishlist::class, 'combo_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function reviews()
    {
        return $this->hasMany(Review::class, 'combo_id', 'id')->where('status', Review::STATUS_APPROVED);;
    }
}
