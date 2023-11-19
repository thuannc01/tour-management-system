<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeTransportation extends Model
{
    use HasFactory;

    protected $table = 'types_transportation';

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
