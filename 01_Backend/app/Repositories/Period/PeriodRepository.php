<?php

namespace App\Repositories\Period;

use App\Repositories\Period\IPeriodRepository;
use App\Repositories\BaseRepository;
use App\Models\Tour;
use App\Models\User;

class PeriodRepository extends BaseRepository implements IPeriodRepository
{
    public function getModel()
    {
        return \App\Models\Period::class;
    }

    public function getDataInit(){
        $allTours = Tour::whereNull('deleted_at')->get();
        $allTourGuide = User::where('role_id', '=', 3)->get();

        $response = [
            'allTours'      => $allTours,
            'allTourGuide'  => $allTourGuide
        ];

        return $response;
    }
}
