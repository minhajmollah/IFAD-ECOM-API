<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Blog;

class BlogCategory extends Model
{
    use HasFactory;
    protected $table = 'blog_categorys';
    public $timestamps = false;

    public function Blog()
    {
      return $this->hasOne(Blog::class);
    }
}
