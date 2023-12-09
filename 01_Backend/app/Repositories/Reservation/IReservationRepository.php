<?php

namespace App\Repositories\Reservation;

use App\Models\Reservation;

interface IReservationRepository
{
    public function getOrderByStatus($data);
    public function getDataPeriod($data);
    public function saveData($data);
}
