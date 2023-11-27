import repository from '@/utils/repository';

const resourceCategory = '/category';
const resourceSegment = '/segment';
const resourceTypesTransportation = '/type-transportation';
const resourceLocation = '/location';
const resourceFoodSpot = '/food-spot';
const resourceHotelSpot = '/hotel-spot';
const resourceAdditionalService = '/additional-service';
const resourceTour = '/tour';

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
    },
    getAllAdditionalService: () => {
        return repository.get(`${resourceAdditionalService}`);
    },
    saveTour: (data) => {
        return repository.post(`${resourceTour}`, data);
    },
    searchTour: (data) => {
        return repository.get(`${resourceTour}`, {
            params: data
        });
    },
    deleteTour: (id) => {
        return repository.delete(`${resourceTour}/${id}`);
    }
};
