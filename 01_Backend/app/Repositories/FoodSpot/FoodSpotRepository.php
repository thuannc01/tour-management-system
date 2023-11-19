<?php

namespace App\Repositories\FoodSpot;

use App\Repositories\FoodSpot\IFoodSpotRepository;
use App\Repositories\BaseRepository;

class FoodSpotRepository extends BaseRepository implements IFoodSpotRepository
{
    public function getModel()
    {
        return \App\Models\FoodSpot::class;
    }
}
