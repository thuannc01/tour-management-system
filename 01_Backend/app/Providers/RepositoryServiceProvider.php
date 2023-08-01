<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
// user
use App\Repositories\User\IUserRepository;
use App\Repositories\User\UserRepository;

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
