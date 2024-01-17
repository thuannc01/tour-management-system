<?php

namespace App\Repositories\Period;

use App\Models\Period;

interface IPeriodRepository
{
    public function getDataInit();
    public function saveData($data);
    public function search($data);
    public function deletePeriod($data);
    public function getPeriodByID($data);
    public function updatePeriod($data);
}
