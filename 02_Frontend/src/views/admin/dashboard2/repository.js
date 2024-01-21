import repository from '@/utils/repository';

const resourceSegment = '/segment';
const resourceCategory = '/category';
const resourceLocation = '/location';
const resourceStatistical = '/statistical';

export default {
    getAllSegment: () => {
        return repository.get(`${resourceSegment}`);
    },
    getAllCategories: () => {
        return repository.get(`${resourceCategory}`);
    },
    getProvinceByArea: (data) => {
        return repository.get(`${resourceLocation}/get-province-by-area`, {
            params: data
        });
    },
    getDataInit: () => {
        return repository.get(`${resourceStatistical}`);
    },
    statisticalByTour: (data) => {
        return repository.post(
            `${resourceStatistical}/statistical-by-tour`,
            data
        );
    }
};
