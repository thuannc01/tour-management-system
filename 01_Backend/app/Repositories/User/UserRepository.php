<?php

namespace App\Repositories\User;

use App\Repositories\User\IUserRepository;
use App\Repositories\BaseRepository;

class UserRepository extends BaseRepository implements IUserRepository
{
    //lấy model tương ứng
    public function getModel()
    {
        return \App\Models\User::class;
    }

    public function getUser()
    {
        return $this->model->select('name')->take(5)->get();
    }
}
