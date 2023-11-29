<?php

namespace App\Repositories\News;

use App\Repositories\News\INewsRepository;
use App\Repositories\BaseRepository;
use Carbon\Carbon;
use App\Models\News;
use Illuminate\Support\Facades\DB;

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

    public function search($data){
        $title = $data['title'] ?? '';
        $type = $data['type'] ?? '';
        $sort = $data['sort'] ?? '';
        $page_size = $data['page_size'] ?? '4';
        $page_number = $data['page_number'] ?? '1';
         // cal
        $offset = ($page_number - 1) * $page_size; //số lượng dòng bỏ qua từ đầu kết quả trước khi bắt đầu lấy các dòng
        $totalRows  = News::whereNull('deleted_at')->count('id');
        // 
        $sqlString = "";
        $sqlString = " select news.*, users.full_name author from news " .
        " join users on news.author_id = users.id ".
        " where title LIKE '%". $title ."%' and news.deleted_at is null ";
        if(trim($type) != ''){
            $sqlString = $sqlString . " and type = '" . $type . "'  ";
        }
        if(trim($sort) != ''){
            $sqlString = $sqlString . " order by created_at " . $sort . "  ";
        }
        $sqlString = $sqlString  . " limit " .$page_size. " offset " .$offset;
        // 
        $dataSearch = DB::select($sqlString);
        $response = [
            'totalRows' => $totalRows,
            'dataSearch' => $dataSearch,
        ];

        return $response;
    }

    public function deleteNews($id){
        $news = News::find($id);
        $news->deleted_at = Carbon::now();
        $news->save();
    }
}
