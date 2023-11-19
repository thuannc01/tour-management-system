<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HotelSpot extends Model
{
    use HasFactory;

    protected $table = 'hotel_spots';

    protected $fillable = [
        'id'
        , 'name'
        , 'address'
        , 'phone_number'
        , 'email'
        , 'type'
        , 'location_map'
        , 'province_id'
        , 'created_at'
        , 'updated_at'
        , 'deleted_at'
    ];

    public $timestamps = true;
}
