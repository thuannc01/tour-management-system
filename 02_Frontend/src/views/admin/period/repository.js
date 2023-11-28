import repository from '@/utils/repository';

const periodResource = '/period';

export default {
    getDataInit: () => {
        return repository.get(`${periodResource}`);
    },
    savePeriod: (data) => {
        return repository.post(`${periodResource}`, data);
    },
    searchPeriod: (data) => {
        return repository.get(`${periodResource}/search`, {
            params: data
        });
    },
    deletePeriod: (id) => {
        return repository.delete(`${periodResource}/${id}`);
    }
};
