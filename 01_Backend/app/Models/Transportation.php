<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transportation extends Model
{
    use HasFactory;

    protected $table = 'transportation';

    protected $fillable = [
        'id',
        'type_transportation_id',
        'name',
        'distance',
        'departure_time', 
        'arrival_time',
        'from_location',
        'to_location',
        'quantity',
        'maximum_quantity',
        'ticket_class',
        'seat',
        'price',
        'desc',

        'created_at',
        'updated_at',
        'deleted_at'
    ];

    public $timestamps = true;
}
