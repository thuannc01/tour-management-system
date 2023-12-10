<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    use HasFactory;

    protected $table = 'reservations';

    protected $fillable = [
        "id" ,
        "tour_period_id" ,
        "bank_account_id" ,
        "user_id" ,
        "transportation_id" ,
        "adult_ticket_quantity" ,
        "child_ticket_quantity" ,
        "infant_ticket_quantity" ,
        "additional_service_id_list" ,
        "additional_service_quantity_list" ,
        "total_amount" ,
        "status" ,
        "otp_code" ,
        "transportation_ticket_price" ,
        "transportation_quantity" ,

        "payment_method" ,
        "payment_amount" ,
        "payment_date" ,
        "advance_payment" ,
        "payment_detail" ,

        "created_at" ,
        "updated_at" ,
        "deleted_at" 
    ];

    public $timestamps = true;
}
