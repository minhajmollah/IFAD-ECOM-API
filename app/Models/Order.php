<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    /**
     * Constants
     */
    const ORDER_STATUS_PENDING = 1;
    const ORDER_STATUS_PROCESSING = 2;
    const ORDER_STATUS_SHIPPED = 3;
    const ORDER_STATUS_DELIVERED = 4;
    const ORDER_STATUS_CANCELED = 5;

    /*const ORDER_STATUS_RETURNED = 6;
    const ORDER_STATUS_REFUNDED = 7;*/

    const PAYMENT_STATUS_PAID = 1;
    const PAYMENT_STATUS_UNPAID = 2;

    protected $fillable = [];

    protected $casts = [
        'shipping_address_json' => 'object',
        'billing_address_json' => 'object',
    ];

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
    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class, 'payment_method_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function orderItems()
    {
        return $this->hasMany(OrderItem::class, 'order_id', 'id')->with('inventory', 'combo');
    }
}
