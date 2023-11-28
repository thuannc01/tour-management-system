<?php

namespace App\Repositories\News;

use App\Models\News;

interface INewsRepository
{
    public function saveData($data);
}
