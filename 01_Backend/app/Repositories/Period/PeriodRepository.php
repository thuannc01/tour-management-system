<?php

namespace App\Repositories\Period;
use Illuminate\Support\Facades\DB;

use Carbon\Carbon;
use App\Repositories\Period\IPeriodRepository;
use App\Repositories\BaseRepository;
use App\Models\Tour;
use App\Models\User;
use App\Models\Period;

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

    public function saveData($data){
        try {
            $dataPeriod = [
                'tour_id' => (int)($data['tour_id'] ?? 0),
                'departure_time' => $data['departure_time'],
                'arrival_time' => $data['arrival_time'],
                'maximum_quantity' => (int)($data['maximum_quantity'] ?? 0),
                'tourist_guide_id' => (int)($data['tourist_guide_id'] ?? 0),
                'created_at' => Carbon::now()
            ];
    
            Period::insert($dataPeriod);
    
            return 'Ok';
        } catch (\Exception $e) {
            return 'Error: ' . $e->getMessage();
        }
    }

    public function search($data){
        $title = $data['title'] ?? '';
        $page_size = $data['page_size'] ?? '4';
        $page_number = $data['page_number'] ?? '1';
         // cal
        $offset = ($page_number - 1) * $page_size; //số lượng dòng bỏ qua từ đầu kết quả trước khi bắt đầu lấy các dòng
        $totalRows  = Period::whereNull('deleted_at')->count('id');
        // 
        $sqlString = "select periods.*, tours.title title, users.full_name touristGuide
        from periods
        left join tours on tours.id = periods.tour_id
        left join users on users.id = periods.tourist_guide_id
        where tours.title LIKE '%". $title ."%' and periods.deleted_at is null 
        order by tours.id 
        limit ". $page_size ."
        offset ". $offset;
        // 
        $dataSearch = DB::select($sqlString);
        $response = [
            'totalRows' => $totalRows,
            'dataSearch' => $dataSearch,
        ];

        return $response;
    }

    public function deletePeriod($periodID){
        $period = Period::find($periodID);
        $period->deleted_at = Carbon::now();
        $period->save();
    }
}
