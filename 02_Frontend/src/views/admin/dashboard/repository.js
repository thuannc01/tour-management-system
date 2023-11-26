import repository from '@/utils/repository';

const resourceStatistical = '/statistical';

export default {
    getDataInit: () => {
        return repository.get(`${resourceStatistical}`);
    }
};
