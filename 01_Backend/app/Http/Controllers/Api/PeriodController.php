<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Constants\ResponseCodeConstant;
use App\Repositories\Period\IPeriodRepository;

class PeriodController extends Controller
{
    protected $periodRepository;

    public function __construct(IPeriodRepository $periodRepository)
    {
        $this->periodRepository = $periodRepository;
    }

    /**
     * Get data init
     *  @OA\GET(
     *      path="/period",
     *      tags={"Period"},
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
        try {
            $data_res = $this->periodRepository->getDataInit();

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
     * Save period
     *  @OA\POST(
     *      path="/period",
     *      tags={"Period"},
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
     *           description="Period data",
     *           @OA\JsonContent(
     *               @OA\Property(property="tour_id", type="int", example="1"),
     *               @OA\Property(property="departure_time", type="string", example="01/01/2023"),
     *               @OA\Property(property="arrival_time", type="string", example="01/01/2023"),
     *               @OA\Property(property="maximum_quantity", type="int", example="15"),
     *               @OA\Property(property="tourist_guide_id", type="int", example="1"),
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
            $data_res = $this->periodRepository->saveData($request->all());
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
     * Get data search periods
     * @OA\GET(
     *     path="/period/{id}",
     *     tags={"Period"},
     *     security={{"apiAuth":{}}},
     *     description="
     *      Code
     *          200 - Success
     *          400 - Bad request
     *          401 - Not authentication
     *          403 - Not access
     *          422 - Input invalidate
     *          423 - Have other error
     *          500 - Server error
     *      ",
     *     @OA\Parameter(
     *         name="id",
     *         description="ID tour du lịch",
     *         in="path",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="title",
     *         description="Tên tour du lịch",
     *         in="query",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="page_size",
     *         description="Số lượng dòng hiển thị trên mỗi trang của kết quả phân trang",
     *         in="query",
     *         @OA\Schema(type="int")
     *     ),
     *     @OA\Parameter(
     *         name="page_number",
     *         description="Trang hiện tại muốn lấy dữ liệu",
     *         in="query",
     *         @OA\Schema(type="int")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Result of success",
     *         @OA\JsonContent(
     *             @OA\Property(property="Code", type="integer", example="200"),
     *             @OA\Property(
     *                 property="Data",
     *                 description="Result of success"
     *             )
     *         )
     *     )
     * )
     */
    public function show($id, Request $request)
    {
        try {
            $data_res = $this->periodRepository->search($request->all());

            $response = response()->json([
                'Code'       => ResponseCodeConstant::OK,
                'Data'       => $data_res,
                'MessageNo'  => "",
                'Message'    => "",
                'DataErrors' => []
            ]);
        } catch (\Exception $e) {
            // Handle the exception as needed
        }

        return $response;
    }


    /**
     * Delete period
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     *
     * @OA\Delete(
     *      path="/period/{id}",
     *      tags={"Period"},
     *      security={{"apiAuth":{}}},
     *      description="
     *          Code
     *              200 - Success
     *              400 - Bad request
     *              401 - Not authentication
     *              403 - Not access
     *              422 - Input invalidate
     *              423 - Have other error
     *              500 - Server error
     *      ",
     *      @OA\Parameter(
     *          name="id",
     *          description="Id period",
     *          in="path",
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
     * )
     */
    public function destroy($id)
    {
        $response = null;
        try {
            $data_res = $this->periodRepository->deletePeriod($id);

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
