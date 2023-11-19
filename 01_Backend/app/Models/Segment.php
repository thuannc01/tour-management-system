<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Segment extends Model
{
    use HasFactory;

    protected $table = 'tourist_segments';

    protected $fillable = [
        'id'
        , 'name'
        , 'parent_id'
        , 'created_at'
        , 'updated_at'
        , 'deleted_at'
    ];

    public $timestamps = true;
}
