<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class ConditionalDiscount extends Model
{
    use HasFactory;
    protected $table = 'conditional_discounts';
    public function groups()
    {
        return $this->belongsToMany(CouponUserGroup::class, 'coupon_user_groups', 'customer_id');
    }
}
