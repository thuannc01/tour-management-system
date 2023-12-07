import repository from '@/utils/repository';

const newsResource = '/news';

export default {
    searchNews: (data) => {
        return repository.get(`${newsResource}`, {
            params: data
        });
    }
};
