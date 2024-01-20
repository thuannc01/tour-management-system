<?php

namespace App\Repositories\Statistical;
use Illuminate\Support\Facades\DB;

use App\Repositories\Statistical\IStatisticalRepository;
use App\Repositories\BaseRepository;
// model
use App\Models\Period;
use App\Models\Reservation;
use App\Models\User;
use App\Models\Tour;

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

    public function statisticalByTour($data){
        // conditions
        $area = $data['area'];
        $province = $data['province'];
        $category = $data['category'];
        $segment = $data['segment'];
        $hasTourist = $data['hasTourist'];
        $order = $data['order'];
        $tour = $data['tour'] ?? 0;
        // tour data
        $sqlQueryTourData = "
            SELECT
                subquery.id,
                MAX(subquery.periods_id) AS periods_id,
                MAX(subquery.title) AS title,
                MAX(subquery.from_province_name) AS from_province_name,
                MAX(subquery.to_province_name) AS to_province_name,
                SUM(subquery.total_number_customer) as total_number_customer,
                TO_CHAR(MAX(subquery.created_at), 'DD/MM/YYYY') AS created_at
            FROM
            (
                SELECT
                    tours.id,
                    periods.id AS periods_id,
                    tours.title,
                    from_province.name AS from_province_name,
                    to_province.name AS to_province_name,
                    tours.created_at,
                    SUM(reservations.adult_ticket_quantity + reservations.child_ticket_quantity + reservations.child_ticket_quantity) as total_number_customer
                FROM
                    tours
                JOIN province AS from_province ON from_province.id = tours.from_province_id
                JOIN province AS to_province ON to_province.id = tours.to_province_id
                JOIN periods ON periods.tour_id = tours.id
                JOIN reservations ON reservations.tour_period_id = periods.id
                JOIN category_details ON category_details.tour_id = tours.id
                JOIN segment_details ON segment_details.tour_id = tours.id

                WHERE to_province.area = '".$area."'
                AND tours.to_province_id IN (".$province.")
                AND category_details.category_id IN (".$category.")
                AND segment_details.tourist_segment_id IN (".$segment.")

                GROUP BY
                    tours.id,
                    periods.id,
                    tours.title,
                    from_province_name,
                    to_province_name,
                    tours.created_at
                ORDER BY ". $order ."    
            ) AS subquery
            GROUP BY
                subquery.id
            HAVING
                SUM(subquery.total_number_customer) ". $hasTourist .";
            ";
        $tourData = DB::select($sqlQueryTourData);
        // period data
        $sqlQueryPeriodData = "
            select tours.title title, TO_CHAR(TO_DATE(periods.departure_time, 'YYYY-MM-DD'), 'DD/MM/YYYY') AS departure_time
            , to_province.area area, to_province.name AS to_province_name
            , SUM(reservations.adult_ticket_quantity + reservations.child_ticket_quantity + reservations.child_ticket_quantity) as total_number_customer
            from periods
            join tours on tours.id = periods.tour_id
            JOIN province AS to_province ON to_province.id = tours.to_province_id
            JOIN reservations ON reservations.tour_period_id = periods.id
            where tours.id = ". $tour ."
            group by title, departure_time, area, to_province_name
        ";
        $periodData = DB::select($sqlQueryPeriodData);
        // res
        $response = [
            'tourData' => $tourData ?? [],
            'periodData' => $periodData ?? [],
            'adult_ticket_quantity' => $adult_ticket_quantity ?? 0,
            'child_ticket_quantity' => $child_ticket_quantity ?? 0,
            'infant_ticket_quantity' => $infant_ticket_quantity ?? 0
        ];
        return $response;
    }
}
