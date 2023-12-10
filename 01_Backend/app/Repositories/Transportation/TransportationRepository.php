<?php

namespace App\Repositories\Transportation;

use App\Repositories\Transportation\ITransportationRepository;
use App\Repositories\BaseRepository;
use Illuminate\Support\Facades\DB;
use App\Models\Transportation;
use App\Models\Reservation;

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

    public function getDataToBookTrans($data){
        $departure_time = $data['departure_time'];
        $type_transportation = $data['type_transportation'];
        $quantity = $data['quantity'];
        $from_location = $data['from_location'];
        $to_location = $data['to_location'];

        $sqlString = "
         select * from transportation
         where type_transportation_id = '" . $type_transportation ."'   
         and departure_time = '" . $departure_time ."'   
         and quantity >= '" . $quantity ."'   
         and from_location LIKE '%" .$from_location. "%' 
         and to_location LIKE '%" .$to_location. "%' ";
        return  DB::select($sqlString);
    }

    public function bookTrans($data){
        try {
            $reservationID = $data['id'];
            $reservation = Reservation::find($reservationID);
            // 
            $dataUpdate = [
                'transportation_id'             => $data['transportation_id'] ?? null,
                'transportation_ticket_price'   => $data['transportation_ticket_price'] ?? null,
                'transportation_quantity'       => $data['transportation_quantity'] ?? null,
                'status'                        => 'Đã đặt phương tiện thành công'
            ];
            $reservation->update($dataUpdate);
            // 
            return 'Ok';
        }
        catch (\Exception $e) {
            dd($e);
        }
    }
}
