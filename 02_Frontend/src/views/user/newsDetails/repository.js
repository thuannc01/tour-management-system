import repository from '@/utils/repository';

const resource = '/news/detail';

export default {
    getNewsDetail: (data) => {
        return repository.get(`${resource}`, {
            params: data
        });
    }
};
