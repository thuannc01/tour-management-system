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
        // 
        $status = $data['status'] ?? '';
        $star_count = $data['star_count'] ?? -1;
        $page_size = $data['page_size'];
        $page_number = $data['page_number'];
        // 
        $offset = ($page_number - 1) * $page_size;
        $totalRows  = Rating::whereNull('deleted_at')->count('id');
        // 
        $sqlString = " select ratings.*, users.full_name, tours.title from ratings
        join users on users.id = ratings.reviewer 
        join tours on tours.id = ratings.tour_id where ";
        if(trim($status) != ''){
            $sqlString = $sqlString . " ratings.status = '" .$status. "' and ";
        }
        if($star_count != -1){
            $sqlString = $sqlString . " ratings.star_count = " .$star_count;
        }
        $sqlString = $sqlString . " order by ratings.id limit ". $page_size ." offset ". $offset;
        //
        $dataSearch = DB::select($sqlString);
        $response = [
            'totalRows' => $totalRows,
            'dataSearch' => $dataSearch,
        ];

        return $response;
    }

    public function response($data){
        $id = $data['id'];
        $rating = Rating::find($id);
        // 
        $rating->responder = $data['responder'];
        $rating->message_response = $data['message_response'];
        $rating->status = $data['status'];
        // 
        $rating->save();
        return 'Ok';
    }
}
