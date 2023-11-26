<?php

namespace App\Repositories\Tour;

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
        dd($data);
    }
}
