import repository from '@/utils/repository';

const periodCategory = '/period';

export default {
    getDataInit: () => {
        return repository.get(`${periodCategory}`);
    },
    savePeriod: (data) => {
        return repository.post(`${periodCategory}`, data);
    }
};
