<?php

namespace App\Repositories\TourDetail;

use Illuminate\Support\Facades\DB;
use App\Repositories\TourDetail\ITourDetailRepository;
use App\Repositories\BaseRepository;

class TourDetailRepository extends BaseRepository implements ITourDetailRepository
{
    public function getModel()
    {
        return \App\Models\Category::class;
    }

    public function getTourDetail($id){
        $id = $id['id'];
        // get data tour
        $sqlTourData = "Select * from tours where id = " .$id;
        $sqlTourData = "
        SELECT tours.*, types_transportation.name AS transportation, from_province.name AS from_province_name, to_province.name AS to_province_name
        FROM tours
        JOIN types_transportation ON types_transportation.id = tours.type_transportation_id
        JOIN province AS from_province ON from_province.id = tours.from_province_id
        JOIN province AS to_province ON to_province.id = tours.to_province_id
        where tours.id = " .$id;
        $tourData = DB::select($sqlTourData);
        // get period data
        $sqlPeriodData = "Select * from periods where tour_id = " .$id;
        $periodData = DB::select($sqlPeriodData);
        // get rating data
        $sqlRatingData = "Select * from ratings where tour_id = " .$id;
        $ratingData = DB::select($sqlRatingData);

        $response = [
            'tourData'  => $tourData,
            'periodData'    => $periodData,
            'ratingData'   => $ratingData
        ];

        return $response;
    }
}
