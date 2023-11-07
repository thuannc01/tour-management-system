<?php

namespace App\Repositories\User;

use App\Repositories\User\IUserRepository;
use App\Repositories\BaseRepository;

class UserRepository extends BaseRepository implements IUserRepository
{
    public function getModel()
    {
        return \App\Models\User::class;
    }
}
