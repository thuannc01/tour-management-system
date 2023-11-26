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
    getAllLocation: () => {
        return repository.get(`${resourceLocation}`);
    },
    getDataInit: () => {
        return repository.get(`${resourceStatistical}`);
    }
};
