<?php

namespace App\Repositories\User;

use App\Repositories\User\IUserRepository;
use App\Repositories\BaseRepository;
use App\Models\User;

class UserRepository extends BaseRepository implements IUserRepository
{
    public function getModel()
    {
        return \App\Models\User::class;
    }

    public function saveData($data){
        try {
            // data
            $id = $data['id'];
            // 
            $user = User::find($id);
            // 
            $user->update([
                'full_name' => $data['full_name'],
                'email' => $data['email'],
                'phone_number' => $data['phone_number'],
                'province_id' => $data['province_id'],
                'address' => $data['address'],
                'gender' => $data['gender'],
                'avatar_path' => $data['avatar_path']
            ]);

            return 'Ok';

        } catch (\Exception $e) {
            return 'Error: ' . $e->getMessage();
        }
    }
}
