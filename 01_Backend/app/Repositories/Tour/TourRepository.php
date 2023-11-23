<?php

namespace App\Repositories\Tour;

use App\Repositories\Tour\ITourRepository;
use App\Repositories\BaseRepository;

class TourRepository extends BaseRepository implements ITourRepository
{
    public function getModel()
    {
        return \App\Models\Tour::class;
    }

    public function saveData($data){
        dd($data);
    }

    public function search($data){
        dd($data);
    }
}
