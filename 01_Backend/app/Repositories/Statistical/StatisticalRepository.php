<?php

namespace App\Repositories\Statistical;

use App\Repositories\Statistical\IStatisticalRepository;
use App\Repositories\BaseRepository;
// model
use App\Models\Period;
use App\Models\Reservation;
use App\Models\User;

class StatisticalRepository extends BaseRepository implements IStatisticalRepository
{
    public function getModel()
    {
        return \App\Models\Segment::class;
    }

    public function initDataRevenue(){
        $countTotalTours = Period::whereNull('deleted_at')->count('id');
        $countTotalTourDeployed = Reservation::where('status', '=', 'Hoàn thành')->count('id');
        $countTotalCustomer = User::where('role_id', '=', 1)
            ->whereNull('deleted_at')
            ->count('id');
        $totalRevenue = Reservation::where('status', '<>', 'Chờ thanh toán')
                ->groupBy('id')
                ->sum('total_amount');
        $response = [
            'countTotalTours' => $countTotalTours ?? 0,
            'countTotalTourDeployed' => $countTotalTourDeployed ?? 0,
            'countTotalCustomer' => $countTotalCustomer ?? 0,
            'totalRevenue' => $totalRevenue ?? 0
        ];
        return $response;
    }
}
