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
use Carbon\Carbon;

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
        select * , tours.*
        from reservations
        join periods on periods.id = reservations.tour_period_id
        join tours on tours.id = periods.tour_id
        where reservations.status = '" .$status ."' and user_id = " .$user_id;

        if($status  == 'Chờ đặt phương tiện'){
            $sqlString = "
            select * , tours.*
            from reservations
            join periods on periods.id = reservations.tour_period_id
            join tours on tours.id = periods.tour_id
            where reservations.status = '" .$status ."' or reservations.status = 'Đã đặt phương tiện thành công' 
            and user_id = " .$user_id;
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

        return 'ok';
    }
}
