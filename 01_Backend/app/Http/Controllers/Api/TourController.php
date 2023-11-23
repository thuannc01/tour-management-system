<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Constants\ResponseCodeConstant;
use App\Repositories\Tour\ITourRepository;

class TourController extends Controller
{
    protected $tourRepository;

    public function __construct(ITourRepository $tourRepository)
    {
        $this->tourRepository = $tourRepository;
    }

    /**
     * Search tour
     *  @OA\GET(
     *      path="/tour",
     *      tags={"Tour"},
     *      security={{"apiAuth":{}}},
     *      description="
     *      Code
     *          200 - Success
     *          400 - Bad request
     *          401 - Not authentication
     *          403 - Not access
     *          422 - Input invalidate
     *          423 - Have other error
     *          500 - Server error
     *      ",
     *      @OA\Parameter(
     *          name="title",
     *          description="Tên tour du lịch",
     *          in="query",
     *          @OA\Schema(type="string")
     *      ),
     *      @OA\Parameter(
     *          name="departure_time",
     *          description="Ngày đi",
     *          in="query",
     *          @OA\Schema(type="string")
     *      ),
     *      @OA\Parameter(
     *          name="arrival_time",
     *          description="Ngày về",
     *          in="query",
     *          @OA\Schema(type="string")
     *      ),
     *      @OA\Parameter(
     *          name="adult_ticket_price",
     *          description="Giá tour",
     *          in="query",
     *          @OA\Schema(type="string")
     *      ),
     *      @OA\Parameter(
     *          name="offset",
     *          description="Số lượng hiển thị",
     *          in="query",
     *          @OA\Schema(type="int")
     *      ),
     *      @OA\Parameter(
     *          name="currentPage",
     *          description="Chọn page hiện tại",
     *          in="query",
     *          @OA\Schema(type="int")
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Result of success",
     *          @OA\JsonContent(
     *              @OA\Property(property="Code", type="integer", example="200"),
     *              @OA\Property(
     *                  property="Data",
     *                  description="Result of success"
     *              )
     *          )
     *      )
     *  )
     */
    public function index(Request $request)
    {
        try {
            $data_res = $this->tourRepository->search($request->all());

            $response = response()->json([
                'Code'         => ResponseCodeConstant::OK,
                'Data'         => $data_res,
                'MessageNo'    => "",
                'Message'      => "",
                'DataErrors'   => []
            ]);
        }
        catch (\Exception $e) {
            //
        }
        return $response;
    }

    /**
     * Save tour
     *  @OA\POST(
     *      path="/tour",
     *      tags={"Tour"},
     *      security={{"apiAuth":{}}},
     *      description="
     *      Code
     *          200 - Success
     *          400 - Bad request
     *          401 - Not authentication
     *          403 - Not access
     *          422 - Input invalidate
     *          423 - Have other error
     *          500 - Server error
     *      ",
     *      @OA\RequestBody(
     *           description="Start date",
     *           @OA\JsonContent(
     *               required={"type_transportation_id", "from_province_id", "to_province_id", "title", "number_of_day"},
     *               @OA\Property(property="type_transportation_id", type="int", example="1"),
     *               @OA\Property(property="from_province_id", type="int", example="1"),
     *               @OA\Property(property="to_province_id", type="int", example="1"),
     *               @OA\Property(property="title", type="string", example="thuannc"),
     *               @OA\Property(property="number_of_day", type="int", example="1"),
     *               @OA\Property(property="itinerary_highlight", type="string", example="itinerary_highlight..."),
     *               @OA\Property(property="policy", type="string", example="policy..."),
     *               @OA\Property(property="note", type="string", example="note..."),
     *               @OA\Property(property="adult_ticket_price", type="string", example="12.000.000đ"),
     *               @OA\Property(property="child_ticket_price", type="string", example="12.000.000đ"),
     *               @OA\Property(property="infant_ticket_price", type="string", example="12.000.000đ"),
     * 
     *               @OA\Property(property="category_id", type="arr", example="[1,2,3]"),
     *               @OA\Property(property="tourist_segment_id", type="arr", example="[1,2,3]"),
     *               @OA\Property(property="additional_services_id", type="arr", example="[1,2,3]"),
     * 
     *               @OA\Property(property="schedules", type="arr", example="[{}, {}]")
     *          )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Result of success",
     *          @OA\JsonContent(
     *              @OA\Property(property="Code", type="integer", example="200"),
     *              @OA\Property(
     *                  property="Data",
     *                  description="Result of success"
     *              )
     *          )
     *      )
     *  )
     */
    public function store(Request $request)
    {
        try {
            $data_res = $this->tourRepository->saveData($request->all());

            $response = response()->json([
                'Code'         => ResponseCodeConstant::OK,
                'Data'         => $data_res,
                'MessageNo'    => "",
                'Message'      => "",
                'DataErrors'   => []
            ]);
        }
        catch (\Exception $e) {
            //
        }
        return $response;
    }
}
