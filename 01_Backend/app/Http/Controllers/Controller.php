<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

/**
 * @OA\Info(
 *     title="API Documentation - ThuanNC",
 *      description="L5 Swagger OpenApi description",
 *     version="v1.0",
 *      @OA\Contact(
 *          email="congthuan701@gmail.com"
 *      ),
 * ),
 * @OA\Server(
 *      description="Laravel & PostgreSQL",
 *      url="http://thuan-be:2001/api"
 *  ),
 * @OA\Tag(
 *     name="ThuanTourist Project",
 *     description="API Endpoints of Projects"
 * )
 * @OA\SecurityScheme(
 *     type="http",
 *     description="Login with email and password to get the authentication token",
 *     name="Token based Based",
 *     in="header",
 *     scheme="bearer",
 *     bearerFormat="JWT",
 *     securityScheme="apiAuth",
 * )
 */

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
