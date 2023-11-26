<?php

namespace App\Repositories\Tour;

use App\Models\Tour;

interface ITourRepository
{
    public function saveData($data);
    public function search($data);
    public function deleteTour($data);
}
