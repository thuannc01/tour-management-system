<?php

namespace App\Repositories\Rating;

use App\Repositories\Rating\IRatingRepository;
use App\Repositories\BaseRepository;
use Carbon\Carbon;
use App\Models\Rating;
use Illuminate\Support\Facades\DB;

class RatingRepository extends BaseRepository implements IRatingRepository
{
    public function getModel()
    {
        return \App\Models\Rating::class;
    }

    public function search($data){
        dd($data);
    }
}
