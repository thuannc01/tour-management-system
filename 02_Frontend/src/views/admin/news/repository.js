import repository from '@/utils/repository';

const newResource = '/news';

export default {
    searchNews: (data) => {
        return repository.get(`${newResource}`, {
            params: data
        });
    },
    saveNews: (data) => {
        return repository.post(`${newResource}`, data);
    },
    deleteNews: (id) => {
        return repository.delete(`${newResource}/${id}`);
    }
};
