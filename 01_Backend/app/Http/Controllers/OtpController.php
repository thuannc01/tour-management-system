<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\OtpMail;
use App\Constants\ResponseCodeConstant;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class OtpController extends Controller
{

    /**
     * Send mail otp
     *  @OA\POST(
     *      path="/send-otp",
     *      tags={"Send mail"},
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
     *           description="Email",
     *           @OA\JsonContent(
     *               @OA\Property(property="email", type="string", example="thuan.23701@gmail.com"),
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
    public function sendOtp(Request $request)
    {
        $response = null;
        try {
            $otp = $this->generateOtp();
            $uuid = Str::uuid();

            $recipientEmail = $request->input('email');

            // send mail
            Mail::to($recipientEmail)->send(new OtpMail($otp));

            // save otp to check
            $sqlCreateTbl = " 
                CREATE TABLE IF NOT EXISTS temp_otp_storage (id character varying(50) PRIMARY KEY,
                otp_code INT NOT NULL)
            ";
            $sqlInsert = " INSERT INTO temp_otp_storage VALUES  ( '". $uuid ."' , " . $otp ." ) ";
            DB::select($sqlCreateTbl);
            DB::select($sqlInsert);
    
            $response = response()->json([
                'Code'         => ResponseCodeConstant::OK,
                'Data'         => [
                    'uuid'     => $uuid
                ],
                'MessageNo'    => "",
                'Message'      => "OTP sent successfully",
                'DataErrors'   => []
            ]);
        }
        catch (\Exception $e) {
            dd($e);
        }
        return $response;
    }

    /**
     * Check OTP is valid
     *  @OA\GET(
     *      path="/check-otp",
     *      tags={"Send mail"},
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
     *          name="uuid",
     *          description="Uuid",
     *          in="query",
     *          @OA\Schema(type="string")
     *      ),
     *      @OA\Parameter(
     *          name="otpCode",
     *          description="Mã OTP",
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
    public function checkOTP(Request $request)
    {
        try {
            $data = $request->all();
            $uuid = $data['uuid'];
            $otpCode = $data['otpCode'];
            
            $query = "SELECT * FROM temp_otp_storage WHERE id = '$uuid' and otp_code = $otpCode ";
            $data = DB::select($query);

            if (!empty($data)) {
                $query = "DELETE FROM temp_otp_storage WHERE id = '$uuid' and otp_code = $otpCode ";
                DB::select($query);
                $response = response()->json([
                    'Code'         => ResponseCodeConstant::OK,
                    'Data'         => [],
                    'MessageNo'    => "",
                    'Message'      => "",
                    'DataErrors'   => []
                ]);
            } else {
                $response = response()->json([
                    'Code'         => ResponseCodeConstant::HAVE_ERROR,
                    'Data'         => [],
                    'MessageNo'    => "",
                    'Message'      => "Mã OTP không chính xác, vui lòng nhập lại!",
                    'DataErrors'   => []
                ]);
            }
        }
        catch (\Exception $e) {
            //
        }
        return $response;
    }

    protected function generateOtp()
    {
        return rand(1000, 9999);
    }
}
