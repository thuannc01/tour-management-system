<?php

namespace App\Repositories\HotelSpot;

use App\Repositories\HotelSpot\IHotelSpotRepository;
use App\Repositories\BaseRepository;

class HotelSpotRepository extends BaseRepository implements IHotelSpotRepository
{
    public function getModel()
    {
        return \App\Models\HotelSpot::class;
    }
}
