<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
// user
use App\Repositories\User\IUserRepository;
use App\Repositories\User\UserRepository;
// role
use App\Repositories\Role\IRoleRepository;
use App\Repositories\Role\RoleRepository;
// category
use App\Repositories\Category\ICategoryRepository;
use App\Repositories\Category\CategoryRepository;
// segment
use App\Repositories\Segment\ISegmentRepository;
use App\Repositories\Segment\SegmentRepository;
// type transportation
use App\Repositories\TypeTransportation\ITypeTransportationRepository;
use App\Repositories\TypeTransportation\TypeTransportationRepository;
// location
use App\Repositories\Location\ILocationRepository;
use App\Repositories\Location\LocationRepository;
// additional service
use App\Repositories\AdditionalService\IAdditionalServiceRepository;
use App\Repositories\AdditionalService\AdditionalServiceRepository;
// food spot
use App\Repositories\FoodSpot\IFoodSpotRepository;
use App\Repositories\FoodSpot\FoodSpotRepository;
// hotel spot
use App\Repositories\HotelSpot\IHotelSpotRepository;
use App\Repositories\HotelSpot\HotelSpotRepository;
// tour
use App\Repositories\Tour\ITourRepository;
use App\Repositories\Tour\TourRepository;
// statistical
use App\Repositories\Statistical\IStatisticalRepository;
use App\Repositories\Statistical\StatisticalRepository;
// period
use App\Repositories\Period\IPeriodRepository;
use App\Repositories\Period\PeriodRepository;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(IRepository::class, BaseRepository::class);
        // user
        $this->app->bind(IUserRepository::class, UserRepository::class);
        // role
        $this->app->bind(IRoleRepository::class, RoleRepository::class);
        // category
        $this->app->bind(ICategoryRepository::class, CategoryRepository::class);
        // segment
        $this->app->bind(ISegmentRepository::class, SegmentRepository::class);
        // type transportation
        $this->app->bind(ITypeTransportationRepository::class, TypeTransportationRepository::class);
        // location
        $this->app->bind(ILocationRepository::class, LocationRepository::class);
        // additional service
        $this->app->bind(IAdditionalServiceRepository::class, AdditionalServiceRepository::class);
        // food spot
        $this->app->bind(IFoodSpotRepository::class, FoodSpotRepository::class);
        // hotel spot
        $this->app->bind(IHotelSpotRepository::class, HotelSpotRepository::class);
        // tour
        $this->app->bind(ITourRepository::class, TourRepository::class);
        // statistical
        $this->app->bind(IStatisticalRepository::class, StatisticalRepository::class);
        // period
        $this->app->bind(IPeriodRepository::class, PeriodRepository::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
