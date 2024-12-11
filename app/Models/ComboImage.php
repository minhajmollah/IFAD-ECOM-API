<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComboImage extends Model
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
}
