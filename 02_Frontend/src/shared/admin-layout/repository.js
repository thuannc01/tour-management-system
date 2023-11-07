import repository from '@/utils/repository';

const resource = '/role';

export default {
    getRoleName: (payload) => {
        return repository.get(`${resource}`, payload);
    }
};
