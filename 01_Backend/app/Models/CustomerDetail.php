<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerDetail extends Model
{
    use HasFactory;

    protected $table = 'customer_details';

    protected $fillable = [
        
    ];

    public $timestamps = true;
}
