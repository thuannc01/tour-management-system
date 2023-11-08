import repository from '@/utils/repository';

const resource = '/role';

export default {
    getRoleName: (data) => {
        return repository.get(`${resource}`, {
            params: data
        });
    }
};
