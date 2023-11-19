<?php

namespace App\Repositories\Segment;

use App\Repositories\Segment\ISegmentRepository;
use App\Repositories\BaseRepository;

class SegmentRepository extends BaseRepository implements ISegmentRepository
{
    public function getModel()
    {
        return \App\Models\Segment::class;
    }
}
