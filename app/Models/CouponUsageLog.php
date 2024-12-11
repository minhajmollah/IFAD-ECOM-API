<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class CouponUsageLog extends Model
{
    use HasFactory;
    protected $table = 'coupon_usage_log';
    public $timestamps = false;
    
    protected $guarded=[];
}
