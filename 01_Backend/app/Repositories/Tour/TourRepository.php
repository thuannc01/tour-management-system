<?php

namespace App\Repositories\Tour;
use Illuminate\Support\Facades\DB;

use App\Repositories\Tour\ITourRepository;
use App\Repositories\BaseRepository;
use Carbon\Carbon;
use App\Models\Tour;
use App\Models\Image;
use App\Models\CategoryDetail;
use App\Models\SegmentDetail;
use App\Models\ServiceDetail;
use App\Models\Schedule;

class TourRepository extends BaseRepository implements ITourRepository
{
    public function getModel()
    {
        return \App\Models\Tour::class;
    }

    public function saveData($data){
        $tourData = $data['tourData'];
        $tourDateData = $data['tourDateData'];
        // update
        if(isset($tourData['id']) && !empty($tourData['id'])){
            // 
        } else {
            // insert
            $paramsTour = [
                'type_transportation_id' => $tourData['type_transportation_id'] ?? "",
                'from_province_id'       => $tourData['from_province_id'] ?? "",
                'to_province_id'       => $tourData['to_province_id'] ?? "",
                'title'                 => $tourData['title'] ?? "",
                'number_of_day'           => $tourData['number_of_day'] ?? "",
                'itinerary_highlight'           => $tourData['itinerary_highlight'] ?? "",
                'policy'           => $tourData['policy'] ?? "",
                'note'           => $tourData['note'] ?? "",
                'adult_ticket_price'           => $tourData['adult_ticket_price'] ?? "",
                'child_ticket_price'           => $tourData['child_ticket_price'] ?? "",
                'infant_ticket_price'           => $tourData['infant_ticket_price'] ?? "",
                'created_at' => Carbon::now()
            ];
            // insert into tours table
            Tour::insert($paramsTour);
            // get id max
            $maxIdTour = Tour::max('id');
            // insert images table
            $imgList = $tourData['images'];
            foreach ($imgList as $img) {
                $imgData = [
                    'foreign_key_1' => $maxIdTour,
                    'foreign_key_2' => null,
                    'img_name' => $img['original_filename'] ?? '',
                    'path' => $img['secure_url'] ?? '',
                    'type' => 'Tour',
                    'created_at' => Carbon::now()
                ];
                Image::insert($imgData);
            }
            // insert category_details table
            $categoryDetailsList = $tourData['category_id'];
            foreach ($categoryDetailsList as $cate) {
                $categoryDetailData = [
                    'category_id' => $cate['id'] ?? '',
                    'tour_id' => $maxIdTour,
                    'created_at' => Carbon::now()
                ];
                CategoryDetail::insert($categoryDetailData);
            }
            // insert segment_details table
            $segmentDetailsList = $tourData['tourist_segment_id'] ;
            foreach ($segmentDetailsList as $segment) {
                $segmentDetailData = [
                    'tourist_segment_id' => $segment['id'] ?? '',
                    'tour_id' => $maxIdTour,
                    'created_at' => Carbon::now()
                ];
                SegmentDetail::insert($segmentDetailData);
            }
            // insert service_details table
            $serviceDetailsList = $tourData['additional_services_id'];
            foreach ($serviceDetailsList as $service) {
                $serviceDetailData = [
                    'additional_services_id' => $service['id'] ?? '',
                    'tour_id' => $maxIdTour,
                    'created_at' => Carbon::now()
                ];
                ServiceDetail::insert($serviceDetailData);
            }
            // insert schedules
            foreach ($tourDateData as $day) {
                $dayData = [
                    'tour_id' => $maxIdTour,
                    'day' => (int)$day['day'] - 1 ?? '',
                    'title' => $day['title'] ?? '',
                    'body' => $day['body'] ?? '',
                    'food_spot_id' => $day['food_spot_id'] ?? '',
                    'hotel_spot_id' => $day['hotel_spot_id'] ?? '',
                    'created_at' => Carbon::now()
                ];
                Schedule::insert($dayData);
            }
        }
        return 'Ok';
    }

    public function search($data){
        $sqlString = "";
        // params input
        $title = $data['title'] ?? '';
        $departure_time = $data['departure_time'] ?? '';
        $arrival_time = $data['arrival_time'] ?? '';
        $adult_ticket_price = $data['adult_ticket_price'] ?? '';
        $page_size = empty($data['page_size']) ? 9 : $data['page_size'];
        $page_number = $data['page_number'] ?? 1;
        $mode = $data['mode'] ?? 0;
        // cal
        $offset = ($page_number - 1) * $page_size; //số lượng dòng bỏ qua từ đầu kết quả trước khi bắt đầu lấy các dòng
        $totalRows  = Tour::whereNull('deleted_at')->count('id');

        $sqlString = $sqlString. "Select tours.*, types_transportation.name transportation, images.path AS img "
                ."from tours ";
        if($mode != 0) {
            $sqlString = $sqlString ."inner join periods on tours.id = periods.tour_id ";
        }
        $sqlString = $sqlString ."inner join types_transportation on types_transportation.id = tours.type_transportation_id "
                ."LEFT JOIN (
                    SELECT
                        foreign_key_1,
                        path,
                        ROW_NUMBER() OVER (PARTITION BY foreign_key_1 ORDER BY id) AS row_num
                    FROM
                        images
                ) images ON images.foreign_key_1 = tours.id AND images.row_num = 1 "
                ."where tours.title LIKE '%". $title ."%' ";
        if($mode != 0){
            $sqlString = $sqlString ."and periods.departure_time LIKE '%". $departure_time ."%' "
                ."and periods.arrival_time LIKE '%". $arrival_time ."%' ";
        }
        $sqlString = $sqlString ."and tours.adult_ticket_price LIKE '%". $adult_ticket_price ."%' "
                ."and tours.deleted_at is null "
                ."group by tours.id, tours.title, types_transportation.id, images.path "
                ."order by tours.id "
                ."limit " .$page_size ." "
                ."offset " .$offset ." ";

        $dataSearch = DB::select($sqlString);

        $response = [
            'totalRows' => $totalRows,
            'dataSearch' => $dataSearch,
        ];

        return $response;
    }

    public function deleteTour($data){
        dd($data['id']);
        // $tour = Tour::find(1);
    }
}
