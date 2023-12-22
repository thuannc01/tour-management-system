<?php

namespace App\Repositories\Reservation;

use Illuminate\Support\Facades\DB;
use App\Repositories\Reservation\IReservationRepository;
use App\Repositories\BaseRepository;
use App\Models\Rating;
use App\Models\Period;
use App\Models\Tour;
use App\Models\BankAccount;
use App\Models\Reservation;
use App\Models\CustomerDetail;
use Carbon\Carbon;
use App\Models\Notification;

class ReservationRepository extends BaseRepository implements IReservationRepository
{
    public function getModel()
    {
        return \App\Models\Reservation::class;
    }

    public function getOrderByStatus($data){
        $status = $data['status'];
        $user_id = $data['user_id'];
        // 
        $sqlString = "
        select reservations.id reservationID, * , tours.*
        from reservations
        join periods on periods.id = reservations.tour_period_id
        join tours on tours.id = periods.tour_id
        where reservations.status = '" .$status ."' and reservations.user_id = " .$user_id;

        if($status  == 'Chờ đặt phương tiện'){
            $sqlString = "
            select reservations.id reservationID, * , tours.*
            from reservations
            join periods on periods.id = reservations.tour_period_id
            join tours on tours.id = periods.tour_id
            where (reservations.status = '" .$status ."' or reservations.status = 'Đã đặt phương tiện thành công')
            and reservations.user_id = " .$user_id;
        }
        $orderData = DB::select($sqlString);
        return $orderData;
    }

    public function getDataPeriod($data){
        $tour_period_id = $data['tour_period_id'];
        // 
        $periodData = Period::where('id', '=', $tour_period_id)->get();
        // 
        $tour_id = $periodData[0]->tour_id;
        $tourData = Tour::where('id', '=', $tour_id)->get();
        // 
        $sqlString = "
         SELECT s.*
        FROM tours t
        JOIN service_details sd ON t.id = sd.tour_id
        JOIN additional_services s ON s.id = sd.additional_services_id
        WHERE t.id = " . $tour_id;
        $serviceData =  DB::select($sqlString);
        // 
        $response = [
            'periodData' => $periodData,
            'tourData' => $tourData,
            'serviceData' => $serviceData
        ];

        return $response;
    }

    public function saveData($data){
        $bankAccountData = $data['bankAccountData'];
        $reservationData = $data['reservationData'];
        // save bank account
        $dataSetBank = [
            'bank_name' => $bankAccountData['bank_name'] ?? null,
            'atm_card_number' => $bankAccountData['atm_card_number'] ?? null,
            'cardholder_name' => $bankAccountData['cardholder_name'] ?? null,
            'expiry_date' => $bankAccountData['expiry_date'] ?? null,
            'user_id' => $bankAccountData['user_id'] ?? null,
            'created_at' => Carbon::now()
        ];
        BankAccount::insert($dataSetBank);
        // save reservation
        $maxIdBankAccount = BankAccount::max('id');
        $dataSetReservation = [
            'tour_period_id'            => $reservationData['tour_period_id'] ?? null,
            'bank_account_id'           => $maxIdBankAccount ?? null,
            'user_id'                   => $reservationData['user_id'] ?? null,
            'transportation_id'         => $reservationData['transportation_id'] ?? null,
            'adult_ticket_quantity'     => $reservationData['adult_ticket_quantity'] ?? null,
            'child_ticket_quantity'     => $reservationData['child_ticket_quantity'] ?? null,
            'infant_ticket_quantity'    => $reservationData['infant_ticket_quantity'] ?? null,
            'additional_service_id_list'            => $reservationData['additional_service_id_list'] ?? null,
            'additional_service_quantity_list'      => $reservationData['additional_service_quantity_list'] ?? null,
            'total_amount'                          => $reservationData['total_amount'] ?? null,
            'status'                                => $reservationData['status'] ?? null,
            'otp_code'                              => $reservationData['otp_code'] ?? null,
            'transportation_ticket_price'     => $reservationData['transportation_ticket_price'] ?? null,
            'transportation_quantity'    => $reservationData['transportation_quantity'] ?? null,
            'payment_method'    => $reservationData['payment_method'] ?? null,
            'payment_amount'    => $reservationData['payment_amount'] ?? null,
            'payment_date'                   => Carbon::now(),
            'advance_payment'         => $reservationData['advance_payment'] ?? null,
            'payment_detail'     => $reservationData['payment_detail'] ?? null,
            'created_at' => Carbon::now()
        ];
        Reservation::insert($dataSetReservation);
        // 
        $maxIdReservation = Reservation::max('id');
        // update quantity
        $tour_period_id = $reservationData['tour_period_id'];
        Period::where('id', $tour_period_id)->increment('quantity');
        // save reservation
        $customerInfoList = $data['customerInfo'];
        foreach ($customerInfoList as $user) {
            $customerDetailData = [
                'reservation_id' => $maxIdReservation ?? 1,
                'full_name' => $user['full_name'] ?? null,
                'phone_number' => $user['phone_number'] ?? null,
                'email' => $user['email'] ?? null,
                'province_id' => $user['province_id'] ?? null,
                'address' => $user['address'] ?? null,
                'created_at' => Carbon::now()
            ];
            CustomerDetail::insert($customerDetailData);
        }
        // 
        return 'ok';
    }

    public function getDataReservation($data){
        $status = $data['status'] ?? '';
        $title = $data['title'] ?? '';
        $page_size = $data['page_size'];
        $page_number = $data['page_number'];
        // 
        $offset = ($page_number - 1) * $page_size;
        $totalRows  = Reservation::whereNull('deleted_at')->count('id');
        // 
        $sqlString = "
        select reservations.id reservation_id, reservations.* , tours.*, periods.*, users.* ,  reservations.created_at reservation_date, reservations.status reservations_status, 
        from_province.name AS from_province_name, to_province.name AS to_province_name, types_transportation.name type_transportation 
        from reservations
        join users on users.id = reservations.user_id
        join periods on periods.id = reservations.tour_period_id
        join tours on tours.id = periods.tour_id

        JOIN province AS from_province ON from_province.id = tours.from_province_id
        JOIN province AS to_province ON to_province.id = tours.to_province_id
        JOIN types_transportation ON types_transportation.id = tours.type_transportation_id

        where reservations.status = '" .$status ."' and tours.title LIKE '%" .$title. "%' 
        order by reservations.id desc limit ". $page_size ." offset ". $offset;

        if($status  == 'Chờ đặt phương tiện'){
            $sqlString = "
            select reservations.id reservation_id, reservations.* , tours.*, periods.* , users.* ,  reservations.created_at reservation_date, reservations.status reservations_status, 
            from_province.name AS from_province_name, to_province.name AS to_province_name, types_transportation.name type_transportation 
            from reservations
            join users on users.id = reservations.user_id
            join periods on periods.id = reservations.tour_period_id
            join tours on tours.id = periods.tour_id

            JOIN province AS from_province ON from_province.id = tours.from_province_id
            JOIN province AS to_province ON to_province.id = tours.to_province_id
            JOIN types_transportation ON types_transportation.id = tours.type_transportation_id

            where reservations.status = '" .$status ."' or reservations.status = 'Đã đặt phương tiện thành công' 
            and tours.title LIKE '%" .$title. "%' 
            order by reservations.id desc limit ". $page_size ." offset ". $offset;
        }
        if(trim($status) == ''){
            $sqlString = "
            select reservations.id reservation_id, reservations.* , tours.*, periods.*  , users.* , reservations.created_at reservation_date, reservations.status reservations_status, 
            from_province.name AS from_province_name, to_province.name AS to_province_name, types_transportation.name type_transportation
            from reservations
            join users on users.id = reservations.user_id
            join periods on periods.id = reservations.tour_period_id
            join tours on tours.id = periods.tour_id

            JOIN province AS from_province ON from_province.id = tours.from_province_id
            JOIN province AS to_province ON to_province.id = tours.to_province_id
            JOIN types_transportation ON types_transportation.id = tours.type_transportation_id

            where tours.title LIKE '%" .$title. "%' 
            order by reservations.id desc limit ". $page_size ." offset ". $offset;
        }
        //
        $dataSearch = DB::select($sqlString);
        // 
        $response = [
            'totalRows' => $totalRows,
            'dataSearch' => $dataSearch,
        ];

        return $response;
    }

    public function getOrderByIdReservation($data){
        $id_reservation = $data['id'];
        $reservationData = Reservation::find($id_reservation);
        // 
        $customerDetail = CustomerDetail::where('reservation_id', '=', $id_reservation)->get();
        // 
        $idServiceList = " select rtrim(regexp_replace(additional_service_id_list, '###', ',', 'g'), ',')
         from reservations where id = ".$id_reservation;
        $idServiceList = DB::select($idServiceList)[0]->rtrim;
        $serviceData = " select * from additional_services where id in (". $idServiceList .") ";
        $serviceData = DB::select($serviceData);
        $arrQuantity = " select rtrim(regexp_replace(additional_service_quantity_list, '###', ',', 'g'), ',')
        from reservations where id = ".$id_reservation;
        $arrQuantity = DB::select($arrQuantity)[0]->rtrim;
        $arrQuantity = explode(",", $arrQuantity);
        $i = 0;
        foreach ($serviceData as $object) {
            $object->quantity = $arrQuantity[$i];
            $i ++;
        }
        // 
        $tourData = " 
        select reservations.* , tours.*, periods.*, users.* ,  reservations.created_at reservation_date, reservations.status reservations_status, 
        from_province.name AS from_province_name, to_province.name AS to_province_name, types_transportation.name type_transportation 
        from reservations
        join users on users.id = reservations.user_id
        join periods on periods.id = reservations.tour_period_id
        join tours on tours.id = periods.tour_id

        JOIN province AS from_province ON from_province.id = tours.from_province_id
        JOIN province AS to_province ON to_province.id = tours.to_province_id
        JOIN types_transportation ON types_transportation.id = tours.type_transportation_id
        where reservations.id = " . $id_reservation;
        $tourData = DB::select($tourData);
        // 
        $transportationData = " select transportation.* 
        from transportation
        join reservations on reservations.transportation_id  = transportation.id 
        where reservations.id = " . $id_reservation;
        $transportationData = DB::select($transportationData);
        // 
        $bankAccountData = " select * from bank_accounts where id = ". $reservationData->bank_account_id;
        $bankAccountData = DB::select($bankAccountData);
        // 
        $response = [
            'reservationData' => $reservationData,
            'customerDetail'  => $customerDetail,
            'serviceData'     => $serviceData,
            'tourData'        => $tourData,
            'transportationData'    => $transportationData,
            'bankAccountData'       => $bankAccountData
        ];
        // 
        return $response; 
    }

    public function updateStatus($data){
        $reservation = Reservation::find($data['id']);
        $reservation->status = $data['status'] ?? null;
        $reservation->updated_at = Carbon::now();
        $reservation->save();
    }

    public function saveNotification($data){
        $dataInsert = [
            'title'         => $data['title'] ?? '', 
            'message'       => $data['message'] ?? '', 
            'sender_id'     => $data['sender_id'] ?? 1, 
            'receiver_id'   => $data['receiver_id'] ?? 1,
            'created_at' => Carbon::now()
        ];
        Notification::insert($dataInsert);

        return 'Ok';
    }

    public function getNotificationByUser($data){
        $notification = Notification::where('receiver_id', $data['id'])
        ->orderBy('created_at', 'desc')
        ->first();
        return $notification;
    }

    public function updateRefund($data){
        try {
            $reservation = Reservation::find($data['reservationID']);
            $reservation->status = 'Huỷ đơn';
            $reservation->refund_amount = $data['refundAmount'];
            $reservation->refund_method = $data['refundMethod'];
            $reservation->updated_at = Carbon::now();
            $reservation->save();
            return 'Ok';
        }
        catch (\Exception $e) {
            dd($e);
        }
    }
}
