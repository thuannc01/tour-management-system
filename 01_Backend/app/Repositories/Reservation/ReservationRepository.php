<?php

namespace App\Repositories\Reservation;

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
        dd($periodData['tour_id']);
        // 
        // $tourData = 
        // 
        // $response = [
        //     'periodData' => $periodData,
        //     'tourData' => $tourData,
        //     'serviceData' => $serviceData
        // ];

        // return $response;
    }
}
