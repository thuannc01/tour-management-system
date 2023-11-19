<?php

namespace App\Repositories\AdditionalService;

use App\Repositories\AdditionalService\IAdditionalServiceRepository;
use App\Repositories\BaseRepository;

class AdditionalServiceRepository extends BaseRepository implements IAdditionalServiceRepository
{
    public function getModel()
    {
        return \App\Models\AdditionalService::class;
    }
}
