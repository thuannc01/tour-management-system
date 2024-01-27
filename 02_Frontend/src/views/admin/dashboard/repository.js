import repository from '@/utils/repository';

const resourceStatistical = '/statistical/statistical-by-revenue';
const resourceStatisticalHeader = '/statistical';

export default {
    getDataInit: (data) => {
        return repository.post(`${resourceStatistical}`, data);
    },
    getDataInitHeader: () => {
        return repository.get(`${resourceStatisticalHeader}`);
    }
};
