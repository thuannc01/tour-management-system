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
        return repository.post(`${periodResource}/search`, {
            params: data
        });
    },
    deletePeriod: (id) => {
        return repository.delete(`${periodResource}/${id}`);
    },
    getPeriodByID: (id) => {
        return repository.get(`${periodResource}/${id}`);
    },
    updatePeriod: (data) => {
        return repository.post(`${periodResource}/update`, data);
    }
};
