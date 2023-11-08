import repository from '@/utils/repository';

export default {
    getUserInfo: (data) => {
        return repository.get(`/user-profile`, {
            params: data
        });
    }
};
