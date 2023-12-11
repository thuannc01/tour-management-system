<?php

namespace App\Repositories\Reservation;

use App\Models\Reservation;

interface IReservationRepository
{
    public function getOrderByStatus($data);
    public function getDataPeriod($data);
    public function saveData($data);
    public function getDataReservation($data);
    public function getOrderByIdReservation($data);
    public function updateStatus($data);
}
