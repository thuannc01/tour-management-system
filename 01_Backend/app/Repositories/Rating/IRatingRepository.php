<?php

namespace App\Repositories\Rating;

use App\Models\Rating;

interface IRatingRepository
{
    public function search($data);
}
