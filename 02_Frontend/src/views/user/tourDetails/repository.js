import repository from '@/utils/repository';

const resource = '/tour-detail';

export default {
    getTourDetail: (data) => {
        return repository.get(`${resource}`, {
            params: data
        });
    }
};
