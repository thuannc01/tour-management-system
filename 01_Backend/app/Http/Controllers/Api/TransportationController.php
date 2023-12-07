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
}
