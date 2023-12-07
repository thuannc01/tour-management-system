<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\RoleController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\SegmentController;
use App\Http\Controllers\Api\TypeTransportationController;
use App\Http\Controllers\Api\LocationController;
use App\Http\Controllers\Api\AdditionalServiceController;
use App\Http\Controllers\Api\FoodSpotController;
use App\Http\Controllers\Api\HotelSpotController;
use App\Http\Controllers\Api\TourController;
use App\Http\Controllers\Api\StatisticalController;
use App\Http\Controllers\Api\PeriodController;
use App\Http\Controllers\Api\NewsController;
use App\Http\Controllers\Api\RatingController;
use App\Http\Controllers\Api\TourDetailController;
use App\Http\Controllers\Api\TransportationController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Handel token
Route::get('/user-profile', [UserController::class, 'userProfile']);
Route::group([
    'middleware' => 'api',
], function () {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
});
// Auth
Route::group([
    'middleware' => 'auth'
], function () {
    // role
    Route::apiResource('/role', RoleController::class);
    // user
    Route::apiResource('/user', UserController::class);
    // category
    Route::apiResource('/category', CategoryController::class);
    // segment
    Route::apiResource('/segment', SegmentController::class);
    // type transportation
    Route::apiResource('/type-transportation', TypeTransportationController::class);
    // location
    Route::apiResource('/location', LocationController::class);
    // additional service
    Route::apiResource('/additional-service', AdditionalServiceController::class);
    // food spot
    Route::apiResource('/food-spot', FoodSpotController::class);
    // hotel spot
    Route::apiResource('/hotel-spot', HotelSpotController::class);
    // tour
    Route::apiResource('/tour', TourController::class)->only(['index', 'store', 'destroy']);
    Route::get('/tour/home', [TourController::class, 'getTourHome']);
    // statistical
    Route::apiResource('/statistical', StatisticalController::class);
    // period
    Route::apiResource('/period', PeriodController::class)->only(['index', 'store', 'destroy']);
    Route::get('/period/search', [PeriodController::class, 'search']);
    // news
    Route::apiResource('/news', NewsController::class)->only(['index', 'store', 'destroy']);
    Route::get('/news/home', [NewsController::class, 'getNewsHome']);
    Route::get('/news/detail', [NewsController::class, 'getDetail']);
    // rating
    Route::apiResource('/rating', RatingController::class);
    // tour detail
    Route::apiResource('/tour-detail', TourDetailController::class);
    // transportation
    Route::apiResource('/transportation', TransportationController::class);
});

// No auth