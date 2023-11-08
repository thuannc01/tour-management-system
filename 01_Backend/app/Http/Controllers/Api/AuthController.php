<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Validator;
use App\Constants\ResponseCodeConstant;
use Illuminate\Support\Facades\Hash;

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
     *                  description="Result of success"
     *              )
     *          )
     *      )
     *  )
     */
    public function login(Request $request){
        $code = ResponseCodeConstant::OK;
        $data = [];
        $messageNo = "";
        $message = "";
        $dataErrors = [];
        // get data
        $credentials = $request->only('email', 'password');
        //
        $user = User::where('email', $request->email)->first();
        // show error
        if (!$user) {
            $code = ResponseCodeConstant::HAVE_ERROR;
            $message = "Email đăng nhập không tồn tại";
        } elseif ($user && !Hash::check($request->password, $user->password)) {
            $code = ResponseCodeConstant::HAVE_ERROR;
            $message = "Mật khẩu không đúng";
        } elseif ($user && $user['status'] != "Hoạt động") {
            $code = ResponseCodeConstant::HAVE_ERROR;
            $message = "Tài khoản đã bị khoá hoặc chưa được kích hoạt";
        } else {
            if ($token = auth()->attempt($credentials)) {
                $data = [$this->createNewToken($token)->original];
            } else {
                $code = ResponseCodeConstant::UNAUTHORIZED;
            }
        }
        // response json
        $response = response()->json([
            'Code'         => $code,
            'Data'         => $data,
            'MessageNo'    => $messageNo,
            'Message'      => $message,
            'DataErrors'   => $dataErrors
        ]); 
        return $response;
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
     *              required={"name", "email", "password", "phone_number", "password_confirms"},
     *              @OA\Property(property="name", type="string", example="Thuan Nguyen Cong"),
     *              @OA\Property(property="email", type="string", example="thuannc@gmail.com"),
     *              @OA\Property(property="phone_number", type="string", example="0909090932"),
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
     *                  description="Result of success"
     *              )
     *          )
     *      )
     *  )
     */
    public function register(Request $request) {
        $code = ResponseCodeConstant::OK;
        $data_res = [];
        $messageNo = "";
        $message = "";
        $dataErrors = [];
        // get data
        $data = $request->only('name', 'email', 'phone_number', 'password', 'password_confirmation');
        // check password
        if ($data['password'] !== $data['password_confirmation']) {
            $code = ResponseCodeConstant::HAVE_ERROR;
            $message = "Mật khẩu xác nhận không khớp.";
        } elseif (User::where('email', $data['email'])->first()) {
            $code = ResponseCodeConstant::HAVE_ERROR;
            $message = "Email đã tồn tại.";
        } else {
            $user = new User();
            $user->full_name = $data['name'];
            $user->email = $data['email'];
            $user->phone_number = $data['phone_number'];
            $user->status = "Hoạt động";
            $user->role_id = 1;
            $user->password = bcrypt($data['password']);
            $user->save();
            $data_res = User::where('id', $user->id)->first();
            $message = "Đăng ký tài khoản khách hàng thành công";
        }
        // response json
        $response = response()->json([
            'Code'         => $code,
            'Data'         => $data_res,
            'MessageNo'    => $messageNo,
            'Message'      => $message,
            'DataErrors'   => $dataErrors
        ]); 
        return $response;
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
     *                  description="Result of success"
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
     *                  description="Result of success"
     *              )
     *          )
     *      )
     *  )
     */
    public function refresh() {
        return $this->createNewToken(auth()->refresh());
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