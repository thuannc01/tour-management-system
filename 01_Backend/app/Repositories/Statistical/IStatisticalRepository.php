<?php

namespace App\Repositories\Statistical;

interface IStatisticalRepository
{
    public function initDataRevenue();
    public function statisticalByTour($data);
    public function statisticalByRevenue($data);
}
