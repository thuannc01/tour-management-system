<?php

namespace App\Repositories\News;

use App\Models\News;

interface INewsRepository
{
    public function saveData($data);
    public function search($data);
    public function deleteNews($data);
    public function getNewsHome();
}
