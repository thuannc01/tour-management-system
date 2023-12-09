<?php

namespace App\Repositories\Rating;

use App\Models\Rating;

interface IRatingRepository
{
    public function search($data);
    public function response($data);
    public function review($data);
}
