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
        try {
            $tourData = $data['tourData'];
            $tourDateData = $data['tourDateData'];
            // update
            if(isset($tourData['id']) && !empty($tourData['id'])){
                // 
            } else {
                // insert
                $paramsTour = [
                    'type_transportation_id' => $tourData['type_transportation_id'] ?? NULL,
                    'from_province_id'       => $tourData['from_province_id'] ?? NULL,
                    'to_province_id'       => $tourData['to_province_id'] ?? NULL,
                    'title'                 => $tourData['title'] ?? NULL,
                    'number_of_day'           => $tourData['number_of_day'] ?? NULL,
                    'itinerary_highlight'           => $tourData['itinerary_highlight'] ?? NULL,
                    'policy'           => $tourData['policy'] ?? NULL,
                    'note'           => $tourData['note'] ?? NULL,
                    'adult_ticket_price'           => $tourData['adult_ticket_price'] ?? NULL,
                    'child_ticket_price'           => $tourData['child_ticket_price'] ?? NULL,
                    'infant_ticket_price'           => $tourData['infant_ticket_price'] ?? NULL,
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
                        'img_name' => $img['original_filename'] ?? NULL,
                        'path' => $img['secure_url'] ?? NULL,
                        'type' => 'Tour',
                        'created_at' => Carbon::now()
                    ];
                    Image::insert($imgData);
                }
                // insert category_details table
                $categoryDetailsList = $tourData['category_id'];
                foreach ($categoryDetailsList as $cate) {
                    $categoryDetailData = [
                        'category_id' => $cate['id'] ?? NULL,
                        'tour_id' => $maxIdTour,
                        'created_at' => Carbon::now()
                    ];
                    CategoryDetail::insert($categoryDetailData);
                }
                // insert segment_details table
                $segmentDetailsList = $tourData['tourist_segment_id'] ;
                foreach ($segmentDetailsList as $segment) {
                    $segmentDetailData = [
                        'tourist_segment_id' => $segment['id'] ?? NULL,
                        'tour_id' => $maxIdTour,
                        'created_at' => Carbon::now()
                    ];
                    SegmentDetail::insert($segmentDetailData);
                }
                // insert service_details table
                $serviceDetailsList = $tourData['additional_services_id'];
                foreach ($serviceDetailsList as $service) {
                    $serviceDetailData = [
                        'additional_services_id' => $service['id'] ?? NULL,
                        'tour_id' => $maxIdTour,
                        'created_at' => Carbon::now()
                    ];
                    ServiceDetail::insert($serviceDetailData);
                }
                // insert schedules
                foreach ($tourDateData as $day) {
                    $dayData = [
                        'tour_id' => $maxIdTour,
                        'day' => (int)$day['day'] - 1 ?? NULL,
                        'title' => $day['title'] ?? NULL,
                        'body' => $day['body'] ?? NULL,
                        'food_spot_id_list' => $day['food_spot_id'] ?? NULL,
                        'hotel_spot_id_list' => $day['hotel_spot_id'] ?? NULL,
                        'created_at' => Carbon::now()
                    ];
                    Schedule::insert($dayData);
                }
            }
            return 'Ok';
        }
        catch (\Exception $e) {
            dd($e);
        }
    }

    public function search($data){
        $sqlString = "";
        // params input
        $title = $data['title'] ?? '';
        $departure_time = $data['departure_time'] ?? '';
        $arrival_time = $data['arrival_time'] ?? '';
        $adult_ticket_price = $data['adult_ticket_price'] ?? '';
        $page_size = empty($data['page_size']) ? 6 : $data['page_size'];
        $page_number = $data['page_number'] ?? 1;
        $mode = $data['mode'] ?? 0;
        // cal
        $offset = ($page_number - 1) * $page_size; //số lượng dòng bỏ qua từ đầu kết quả trước khi bắt đầu lấy các dòng
        $totalRows  = Tour::whereNull('deleted_at')->count('id');
        // 
        if($mode == 1){
            $sqlString = "Select DISTINCT ON (tours.id) tours.id, tours.*, types_transportation.name transportation, images.path AS img, periods.departure_time departure_time "
            ." from tours inner join periods on tours.id = periods.tour_id  
            inner join types_transportation on types_transportation.id = tours.type_transportation_id 
            LEFT JOIN (
                SELECT
                    foreign_key_1,
                    path,
                    ROW_NUMBER() OVER (PARTITION BY foreign_key_1 ORDER BY id) AS row_num
                FROM
                    images
            ) images ON images.foreign_key_1 = tours.id AND images.row_num = 1 
             where periods.departure_time::date > NOW() and tours.title LIKE '%". $title ."%' 
             and periods.departure_time LIKE '%". $departure_time ."%' 
             and periods.arrival_time LIKE '%". $arrival_time ."%' 
             and (SELECT
             REPLACE(
                 REPLACE(
                     REPLACE(
                         REPLACE(TRIM(BOTH ' ' FROM tours.adult_ticket_price), '₫', ''),
                         '.',
                         ''
                     ),
                     ',',
                     '.'),
                 ' ', ''
             )::INTEGER) ".  $adult_ticket_price . " 
             and tours.deleted_at is null 
             group by tours.id, tours.title, types_transportation.id, images.path, periods.departure_time 
             order by tours.id desc 
             limit " .$page_size ." 
             offset " .$offset ." ";
            //  dd($sqlString);
        } else {
            $sqlString = "Select tours.*, types_transportation.name transportation, images.path AS img from tours 
             inner join types_transportation on types_transportation.id = tours.type_transportation_id 
             LEFT JOIN (
                SELECT
                    foreign_key_1,
                    path,
                    ROW_NUMBER() OVER (PARTITION BY foreign_key_1 ORDER BY id) AS row_num
                FROM
                    images
            ) images ON images.foreign_key_1 = tours.id AND images.row_num = 1 
             where tours.title LIKE '%". $title ."%' 
             and tours.deleted_at is null 
             group by tours.id, tours.title, types_transportation.id, images.path
             order by tours.id desc 
             limit " .$page_size ." 
             offset " .$offset ." ";
        }
        // dd($sqlString);
        //
        $dataSearch = DB::select($sqlString);
 
        $response = [
            'totalRows' => $totalRows,
            'dataSearch' => $dataSearch,
        ];

        return $response;
    }

    public function deleteTour($tourID){
        $tour = Tour::find($tourID);
        $tour->deleted_at = Carbon::now();
        $tour->save();
    }

    public function getTourHome(){
        $sqlString1 = "
         SELECT tours.*, images.path AS img FROM tours
         LEFT JOIN (
            SELECT
                foreign_key_1,
                path,
                ROW_NUMBER() OVER (PARTITION BY foreign_key_1 ORDER BY id) AS row_num
            FROM
                images
        ) images ON images.foreign_key_1 = tours.id AND images.row_num = 1 
         where tours.deleted_at is null 
        ORDER BY created_at DESC
        LIMIT 8; ";
        $newTours = DB::select($sqlString1);
        //
        $sqlString2 = "
        SELECT t.*, images.path AS img
        FROM tours t
        JOIN (
            SELECT
                tour_id,
                AVG(star_count) AS avg_rating,
                ROW_NUMBER() OVER (PARTITION BY tour_id ORDER BY AVG(star_count) DESC) AS row_num
            FROM ratings
            GROUP BY tour_id 
        ) r ON t.id = r.tour_id AND r.row_num = 1
        LEFT JOIN (
            SELECT
                foreign_key_1,
                path,
                ROW_NUMBER() OVER (PARTITION BY foreign_key_1 ORDER BY id) AS row_num
            FROM
                images
        ) images ON images.foreign_key_1 = t.id AND images.row_num = 1 
        WHERE t.deleted_at IS NULL 
        LIMIT 8;
         ";
        $hotTours = DB::select($sqlString2);
        // 
        $response = [
            'newTours' => $newTours,
            'hotTours' => $hotTours
        ];  

        return $response;
    }
}
