<?php

namespace App\Repositories\TourDetail;

use App\Models\Category;

interface ITourDetailRepository
{
    public function getTourDetail($id);
}
