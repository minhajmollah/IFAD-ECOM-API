<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComboItem extends Model
{
    use HasFactory;

    protected $fillable = [];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function combo()
    {
        return $this->belongsTo(Combo::class, 'combo_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function inventory()
    {
        return $this->belongsTo(Inventory::class, 'inventory_id', 'id')->with('product');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function inventoryVariants()
    {
        return $this->hasMany(InventoryVariant::class, 'inventory_id', 'inventory_id')->with('variant', 'variantOption');
    }
}
