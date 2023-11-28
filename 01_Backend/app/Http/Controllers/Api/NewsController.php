<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Constants\ResponseCodeConstant;
use App\Repositories\News\INewsRepository;

class NewsController extends Controller
{
    protected $newsRepository;

    public function __construct(INewsRepository $newsRepository)
    {
        $this->newsRepository = $newsRepository;
    }

    /**
     * Save news
     *  @OA\POST(
     *      path="/news",
     *      tags={"News"},
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
     *               @OA\Property(property="author_id", type="int", example="1"),
     *               @OA\Property(property="title", type="string", example="Đà Nẵng thành phố biển mưa ngập biến thành sông ..."),
     *               @OA\Property(property="body", type="string", example="..."),
     *               @OA\Property(property="status", type="string", example="Tạm thời ẩn"),
     *               @OA\Property(property="type", type="string", example="Tin tức"),
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
            $data_res = $this->newsRepository->saveData($request->all());
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
