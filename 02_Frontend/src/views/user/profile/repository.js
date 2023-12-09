import repository from '@/utils/repository';

const resourceLocation = '/location';
const resourceUser = '/user';
const orderResource = '/reservation';
const ratingResource = '/rating';

export default {
    getAllLocation: () => {
        return repository.get(`${resourceLocation}`);
    },
    updateInfoUser: (data) => {
        return repository.post(`${resourceUser}`, data);
    },
    getOrderByStatus: (data) => {
        return repository.get(`${orderResource}`, {
            params: data
        });
    },
    review: (data) => {
        return repository.post(`${ratingResource}/review`, data);
    }
};
