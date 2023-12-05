<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Constants\ResponseCodeConstant;
use App\Repositories\Rating\IRatingRepository;

class RatingController extends Controller
{
    protected $ratingRepository;

    public function __construct(IRatingRepository $ratingRepository)
    {
        $this->ratingRepository = $ratingRepository;
    }

    /**
     * Get data search rating
     * @OA\GET(
     *     path="/rating",
     *     tags={"Rating"},
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
     *         name="status",
     *         description="Trạng thái đánh giá",
     *         in="query",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="star_count",
     *         description="Số lượng sao đánh giá",
     *         in="query",
     *         @OA\Schema(type="number", format="float")
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
    public function index(Request $request)
    {
        $response = response()->json([]);
        try {
            $data_res = $this->ratingRepository->search($request->all());

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
     * Response rating
     *  @OA\POST(
     *      path="/rating",
     *      tags={"Rating"},
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
     *           description="Response data",
     *           @OA\JsonContent(
     *               @OA\Property(property="tour_id", type="int", example="1"),
     *               @OA\Property(property="id", type="int", example="1"),
     *               @OA\Property(property="status", type="string", example="Đã duyệt – Hiển thị"),
     *               @OA\Property(property="responder", type="int", example="1"),
     *               @OA\Property(property="message_response", type="string", example="Cảm ơn bạn."),
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
            $data_res = $this->ratingRepository->response($request->all());
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
