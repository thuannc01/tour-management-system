<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Constants\ResponseCodeConstant;
use App\Repositories\Transportation\ITransportationRepository;

class TransportationController extends Controller
{
    protected $transportationRepository;

    public function __construct(ITransportationRepository $transportationRepository)
    {
        $this->transportationRepository = $transportationRepository;
    }

    /**
     * Get transportation detail
     *  @OA\GET(
     *      path="/transportation",
     *      tags={"Transportation"},
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
     *          name="parent_id",
     *          description="Id loại phương tiện",
     *          in="query",
     *          @OA\Schema(type="int")
     *      ),
     *      @OA\Parameter(
     *          name="name",
     *          description="Tên phương tiện",
     *          in="query",
     *          @OA\Schema(type="string")
     *      ),
     *      @OA\Parameter(
     *          name="page_size",
     *          description="Số dữ liệu trên trang",
     *          in="query",
     *          @OA\Schema(type="int")
     *      ),
     *      @OA\Parameter(
     *          name="page_number",
     *          description="Trang hiện tại",
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
        $response = response()->json([]);
        
        try {
            $data_res = $this->transportationRepository->search($request->all());

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
     * Get transportation data to book transportation
     *  @OA\GET(
     *      path="/transportation/get-data-to-book-trans",
     *      tags={"Transportation"},
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
     *          name="departure_time",
     *          description="thời gian khởi hành",
     *          in="query",
     *          @OA\Schema(type="int")
     *      ),
     *      @OA\Parameter(
     *          name="type_transportation",
     *          description="Loại phương tiện",
     *          in="query",
     *          @OA\Schema(type="int")
     *      ),
     *      @OA\Parameter(
     *          name="quantity",
     *          description="Số lượng người đi",
     *          in="query",
     *          @OA\Schema(type="int")
     *      ),
     *      @OA\Parameter(
     *          name="from_location",
     *          description="Nơi khởi hành",
     *          in="query",
     *          @OA\Schema(type="string")
     *      ),
     *      @OA\Parameter(
     *          name="to_location",
     *          description="Nơi đến",
     *          in="query",
     *          @OA\Schema(type="string")
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
    public function getDataToBookTrans(Request $request)
    {
        $response = response()->json([]);
        
        try {
            $data_res = $this->transportationRepository->getDataToBookTrans($request->all());

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
     * Book trans
     *  @OA\POST(
     *      path="/transportation",
     *      tags={"Transportation"},
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
     *           description="News data",
     *           @OA\JsonContent(
     *               @OA\Property(property="id", type="int", example="1"),
     *               @OA\Property(property="transportation_id", type="int", example="1"),
     *               @OA\Property(property="transportation_ticket_price", type="int", example="4235435"),
     *               @OA\Property(property="transportation_quantity", type="int", example="3"),
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
        $response = null;
        try {
            $data_res = $this->transportationRepository->bookTrans($request->all());
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
