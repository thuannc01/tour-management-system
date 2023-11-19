<?php

namespace App\Repositories\TypeTransportation;

use App\Repositories\TypeTransportation\ITypeTransportationRepository;
use App\Repositories\BaseRepository;

class TypeTransportationRepository extends BaseRepository implements ITypeTransportationRepository
{
    public function getModel()
    {
        return \App\Models\TypeTransportation::class;
    }
}
