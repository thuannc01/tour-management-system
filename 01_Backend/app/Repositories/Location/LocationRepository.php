<?php

namespace App\Repositories\Location;

use App\Repositories\Location\ILocationRepository;
use App\Repositories\BaseRepository;

class LocationRepository extends BaseRepository implements ILocationRepository
{
    public function getModel()
    {
        return \App\Models\Province::class;
    }

    public function getProvinceByArea($data){
        $province = \App\Models\Province::where('area', '=', $data["area"])->get();
        return $province;
    }
}
