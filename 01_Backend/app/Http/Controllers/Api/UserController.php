<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Repositories\User\IUserRepository;

class UserController extends Controller
{
    protected $userRepository;

    public function __construct(IUserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * Get all user.
     * Created: 2023/08/13
     * @param  LoginRequest $request
     * @return DataResponse
     *  @OA\GET(
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
     *      @OA\Response(
     *          response=200,
     *          description="Result after success",
     *          @OA\JsonContent(
     *              @OA\Property(property="Code", type="integer", example="200"),
     *              @OA\Property(
     *                  property="Data",
     *                  description="Data of token after login. Empty if have error"
     *              )
     *          )
     *      )
     *  )
     */
    public function index()
    {   
        $data = $this->userRepository->getAll();
        
        return response()->json([
            "message" => 'success',
            'data' => $data
        ]);
    }
}
