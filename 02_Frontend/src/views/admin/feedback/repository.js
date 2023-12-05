import repository from '@/utils/repository';
const ratingResource = '/rating';

export default {
    searchRating: (data) => {
        return repository.get(`${ratingResource}`, {
            params: data
        });
    },
    saveResponse: (data) => {
        return repository.post(`${ratingResource}`, data);
    }
};
