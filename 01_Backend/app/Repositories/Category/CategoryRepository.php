<?php

namespace App\Repositories\Category;

use App\Repositories\Category\ICategoryRepository;
use App\Repositories\BaseRepository;

class CategoryRepository extends BaseRepository implements ICategoryRepository
{
    public function getModel()
    {
        return \App\Models\Category::class;
    }
}
