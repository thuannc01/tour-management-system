<?php

namespace App\Repositories\Transportation;

use App\Models\Transportation;

interface ITransportationRepository
{
    public function search($data);
    public function getDataToBookTrans($data);
}
