<?php

namespace App\Http\Controllers\api;

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
     *  @OA\GET(
     *      path="/user",
     *      tags={"User"},
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
     *          description="Successful operation"
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
