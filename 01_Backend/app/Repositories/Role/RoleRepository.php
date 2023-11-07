<?php

namespace App\Repositories\Role;

use App\Repositories\Role\IRoleRepository;
use App\Repositories\BaseRepository;

class RoleRepository extends BaseRepository implements IRoleRepository
{
    public function getModel()
    {
        return \App\Models\Role::class;
    }
}
