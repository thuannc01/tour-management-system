import repository from '@/utils/repository';

const resourceCategory = '/category';
const resourceSegment = '/segment';
const resourceTypesTransportation = '/type-transportation';

export default {
    getAllCategories: () => {
        return repository.get(`${resourceCategory}`);
    },
    getAllSegment: () => {
        return repository.get(`${resourceSegment}`);
    },
    getAllTypesTransportation: () => {
        return repository.get(`${resourceTypesTransportation}`);
    }
};
