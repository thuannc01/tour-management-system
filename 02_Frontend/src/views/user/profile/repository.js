import repository from '@/utils/repository';

const resourceLocation = '/location';
const resourceUser = '/user';

export default {
    getAllLocation: () => {
        return repository.get(`${resourceLocation}`);
    },
    updateInfoUser: (data) => {
        return repository.post(`${resourceUser}`, data);
    }
};
