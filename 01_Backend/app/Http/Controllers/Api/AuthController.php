<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Validator;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    /**
     * Login to get token.
     * Created: 2023/08/13
     * @param  LoginRequest $request
     * @return DataResponse
     *  @OA\Post(
     *      path="/login",
     *      tags={"Authentication"},
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
     *          description="Data login",
     *          @OA\JsonContent(
     *              required={"loginid", "password"},
     *              @OA\Property(property="email", type="string", example="thuan@gmail.com"),
     *              @OA\Property(property="password", type="string", format="password", example="123123"),
     *          )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Result after check account",
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
    public function login(Request $request){
    	$validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        if (! $token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        return $this->createNewToken($token);
    }
    
    /**
     * Register for a user account
     * Created: 2023/08/13
     * @param  LoginRequest $request
     * @return DataResponse
     *  @OA\Post(
     *      path="/register",
     *      tags={"Authentication"},
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
     *          description="Data login",
     *          @OA\JsonContent(
     *              required={"name", "email", "password", "password_confirms"},
     *              @OA\Property(property="name", type="string", example="Thuan Nguyen Cong"),
     *              @OA\Property(property="email", type="string", example="thuannc@gmail.com"),
     *              @OA\Property(property="password", type="string", format="password", example="123123"),
     *              @OA\Property(property="password_confirmation", type="string", format="password", example="123123"),
     *          )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Result after register account success",
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
    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|confirmed|min:6',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }
        $user = User::create(array_merge(
                    $validator->validated(),
                    ['password' => bcrypt($request->password)]
                ));
        return response()->json([
            'message' => 'User successfully registered',
            'user' => $user
        ], 201);
    }

    /**
     * Logout
     * Created: 2023/08/13
     * @param  LoginRequest $request
     * @return DataResponse
     *  @OA\Post(
     *      path="/logout",
     *      tags={"Authentication"},
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
    public function logout() {
        auth()->logout();
        return response()->json(['message' => 'User successfully signed out']);
    }
    
    /**
     * Refresh a token
     * Created: 2023/08/13
     * @param  LoginRequest $request
     * @return DataResponse
     *  @OA\Post(
     *      path="/refresh",
     *      tags={"Authentication"},
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
    public function refresh() {
        return $this->createNewToken(auth()->refresh());
    }

    /**
     * Get the authenticated User (user-profile)
     * Created: 2023/08/13
     * @param  LoginRequest $request
     * @return DataResponse
     *  @OA\Get(
     *      path="/user-profile",
     *      tags={"Authentication"},
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
    public function userProfile() {
        return response()->json(auth()->user());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token){
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }
}