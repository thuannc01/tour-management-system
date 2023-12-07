<?php

namespace App\Repositories\Transportation;

use App\Repositories\Transportation\ITransportationRepository;
use App\Repositories\BaseRepository;
use Illuminate\Support\Facades\DB;
use App\Models\Transportation;

class TransportationRepository extends BaseRepository implements ITransportationRepository
{
    public function getModel()
    {
        return \App\Models\Transportation::class;
    }

    public function search($data){
        $parent_id = $data["parent_id"];
        $name = $data["name"] ?? '';
        $page_size = $data["page_size"];
        $page_number = $data["page_number"];
        // 
        $offset = ($page_number - 1) * $page_size;
        $totalRows  = Transportation::whereNull('deleted_at')->count('id');
        // 
        $sqlString = "
         SELECT *
        FROM transportation
        WHERE deleted_at is null and 
        name LIKE '%%' 
        ";
        if($parent_id  != 0){
            $sqlString = $sqlString . " and type_transportation_id IN (SELECT id FROM types_transportation WHERE parent_id = ". $parent_id .") ";
        }

        $sqlString = $sqlString . " order by transportation.id limit ". $page_size ." offset ". $offset;
        //
        $dataSearch = DB::select($sqlString);
        $response = [
            'totalRows' => $totalRows,
            'dataSearch' => $dataSearch,
        ];

        return $response;
    }
}
