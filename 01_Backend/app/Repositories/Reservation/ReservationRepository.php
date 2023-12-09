<?php

namespace App\Repositories\Reservation;

use Illuminate\Support\Facades\DB;
use App\Repositories\Reservation\IReservationRepository;
use App\Repositories\BaseRepository;
use App\Models\Rating;
use App\Models\Period;
use App\Models\Tour;

class ReservationRepository extends BaseRepository implements IReservationRepository
{
    public function getModel()
    {
        return \App\Models\Reservation::class;
    }

    public function getOrderByStatus($data){
        dd($data);
    }

    public function getDataPeriod($data){
        $tour_period_id = $data['tour_period_id'];
        // 
        $periodData = Period::where('id', '=', $tour_period_id)->get();
        // 
        $tour_id = $periodData[0]->tour_id;
        $tourData = Tour::where('id', '=', $tour_id)->get();
        // 
        $sqlString = "
         SELECT s.*
        FROM tours t
        JOIN service_details sd ON t.id = sd.tour_id
        JOIN additional_services s ON s.id = sd.additional_services_id
        WHERE t.id = " . $tour_id;
        $serviceData =  DB::select($sqlString);
        // 
        $response = [
            'periodData' => $periodData,
            'tourData' => $tourData,
            'serviceData' => $serviceData
        ];

        return $response;
    }
}
