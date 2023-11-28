<?php

namespace App\Repositories\News;

use App\Repositories\News\INewsRepository;
use App\Repositories\BaseRepository;
use Carbon\Carbon;
use App\Models\News;

class NewsRepository extends BaseRepository implements INewsRepository
{
    public function getModel()
    {
        return \App\Models\News::class;
    }

    public function saveData($data){
        try {
            $dataSave = [
                'author_id' => (int)$data['author_id'],
                'title' => $data['title'],
                'body' => $data['body'],
                'status' => $data['status'],
                'type' => $data['type'],
                'created_at' => Carbon::now()
            ];
            News::insert($dataSave);

            return 'Ok';

        } catch (\Exception $e) {
            return 'Error: ' . $e->getMessage();
        }
    }
}
