import repository from '@/utils/repository';

const resourceCategory = '/category';
const resourceSegment = '/segment';
const resourceTypesTransportation = '/type-transportation';
const resourceLocation = '/location';
const resourceFoodSpot = '/food-spot';
const resourceHotelSpot = '/hotel-spot';

export default {
    getAllCategories: () => {
        return repository.get(`${resourceCategory}`);
    },
    getAllSegment: () => {
        return repository.get(`${resourceSegment}`);
    },
    getAllTypesTransportation: () => {
        return repository.get(`${resourceTypesTransportation}`);
    },
    getAllLocation: () => {
        return repository.get(`${resourceLocation}`);
    },
    getAllFoodSpots: () => {
        return repository.get(`${resourceFoodSpot}`);
    },
    getAllHotelSpots: () => {
        return repository.get(`${resourceHotelSpot}`);
    }
};
