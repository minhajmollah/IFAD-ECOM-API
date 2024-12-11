<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static findOrFail($id)
 * @method static where(string $string, $customer_id)
 */
class Review extends Model
{
    use HasFactory;

    const STATUS_APPROVED = 1;
    const STATUS_PENDING = 2;

    protected $fillable = [
        'ratting_number',
        'comments',
        'customer_id',
        'inventory_id',
        'combo_id',
        'status',
    ];

    protected $table = 'reviews';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function inventory()
    {
        return $this->belongsTo(Inventory::class, 'inventory_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function combo()
    {
        return $this->belongsTo(Combo::class, 'combo_id', 'id');
    }
}
