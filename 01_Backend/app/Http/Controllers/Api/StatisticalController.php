<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Constants\ResponseCodeConstant;
use App\Repositories\Statistical\IStatisticalRepository;

class StatisticalController extends Controller
{
    protected $statisticalRepository;

    public function __construct(IStatisticalRepository $statisticalRepository)
    {
        $this->statisticalRepository = $statisticalRepository;
    }

    /**
     * init data for statistics by revenue
     *  @OA\GET(
     *      path="/statistical",
     *      tags={"Statistical"},
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
    public function index()
    {
        $response = response()->json([]);
        try {
            $data_res = $this->statisticalRepository->initDataRevenue();
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
     * Get statistical by tour
     *  @OA\POST(
     *      path="/statistical/statistical-by-tour",
     *      tags={"Statistical"},
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
     *           description="Tour data to statistic",
     *           @OA\JsonContent(
     *               @OA\Property(property="area", type="string", example="Miền Trung"),
     *               @OA\Property(property="province", type="string", example="33"),
     *               @OA\Property(property="category", type="string", example="1,2,3,4,5,6,7,8,9"),
     *               @OA\Property(property="segment", type="string", example="1,2,3,4,5,6,7,8,9"),
     *               @OA\Property(property="hasTourist", type="string", example=" >= 0 "),
     *               @OA\Property(property="order", type="string", example=" tours.created_at desc "),
     *               @OA\Property(property="tour", type="int", example="13"),
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
    public function statisticalByTour(Request $request)
    {
        $response = null;
        try {
            $data_res = $this->statisticalRepository->statisticalByTour($request->all());

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
     * Get statistical by revenue
     *  @OA\POST(
     *      path="/statistical/statistical-by-revenue",
     *      tags={"Statistical"},
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
     *           description="Tour data to statistic",
     *           @OA\JsonContent(
     *               @OA\Property(property="typeOfTime", type="string", example="month or quarter or year"),
     *               @OA\Property(property="startTime", type="string", example=""),
     *               @OA\Property(property="endTime", type="string", example=""),
     *               @OA\Property(property="category", type="string", example="1 or 2"),
     *               @OA\Property(property="order", type="string", example="time or revenue"),
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
    public function statisticalByRevenue(Request $request)
    {
        $response = null;
        try {
            $data_res = $this->statisticalRepository->statisticalByRevenue($request->all());

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
