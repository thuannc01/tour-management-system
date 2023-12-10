<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tour extends Model
{
    use HasFactory;

    protected $table = 'tours';

    protected $fillable = [
        // 'id'
        // , 'type_transportation_id'
        // , 'from_province_id'
        // , 'to_province_id'
        // , 'title'
        // , 'number_of_day'
        // , 'itinerary_highlight'
        // , 'policy'
        // , 'note'
        // , 'adult_ticket_price'
        // , 'child_ticket_price'
        // , 'infant_ticket_price'
        // , 'created_at'
        // , 'updated_at'
        // , 'deleted_at'
    ];

    public $timestamps = true;
}
