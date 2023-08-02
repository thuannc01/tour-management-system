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
 */

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
