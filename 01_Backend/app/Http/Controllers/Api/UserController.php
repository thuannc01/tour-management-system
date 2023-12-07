<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repositories\User\IUserRepository;
use App\Constants\ResponseCodeConstant;

class UserController extends Controller
{
    protected $userRepository;

    public function __construct(IUserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * Get the authenticated User (user-profile)
     * Created: 2023/08/13
     * @param  LoginRequest $request
     * @return DataResponse
     *  @OA\Get(
     *      path="/user-profile",
     *      tags={"User"},
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
     *          description="Result after success",
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
    public function userProfile() { 
        return response()->json(auth()->user());
    }

    /**
     * Save/Update data user info
     *  @OA\POST(
     *      path="/user",
     *      tags={"User"},
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
     *           description="User info data",
     *           @OA\JsonContent(
     *               @OA\Property(property="id", type="int", example="1"),
     *               @OA\Property(property="full_name", type="string", example="Nguyễn Công Thuận"),
     *               @OA\Property(property="email", type="string", example="x@gmail.com"),
     *               @OA\Property(property="phone_number", type="string", example="0..."),
     *               @OA\Property(property="province_id", type="int", example="1"),
     *               @OA\Property(property="address", type="string", example="1"),
     *               @OA\Property(property="gender", type="string", example="Nam"),
     *               @OA\Property(property="avatar_path", type="string", example="...."),
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
            $data_res = $this->userRepository->saveData($request->all());
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
