<?php

namespace App\Repositories\TypeTransportation;

use App\Repositories\TypeTransportation\ITypeTransportationRepository;
use App\Repositories\BaseRepository;
use App\Models\TypeTransportation;

class TypeTransportationRepository extends BaseRepository implements ITypeTransportationRepository
{
    public function getModel()
    {
        return \App\Models\TypeTransportation::class;
    }

    public function getData(){
        return TypeTransportation::whereNotNull('parent_id')->get();
    }
}
