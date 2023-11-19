<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoodSpot extends Model
{
    use HasFactory;

    protected $table = 'food_spots';

    protected $fillable = [
        'id'
        , 'name'
        , 'menu'
        , 'address'
        , 'phone_number'
        , 'email'
        , 'type'
        , 'location_map'
        , 'opening_hours'
        , 'province_id'
        , 'created_at'
        , 'updated_at'
        , 'deleted_at'
    ];

    public $timestamps = true;
}
