import repository from '@/utils/repository';

const resourceTour = '/tour';

export default {
    searchTour: (data) => {
        return repository.get(`${resourceTour}`, {
            params: data
        });
    }
};
