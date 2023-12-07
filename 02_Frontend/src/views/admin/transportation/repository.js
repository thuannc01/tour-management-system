import repository from '@/utils/repository';

const transportationResource = '/transportation';

export default {
    searchTransportation: (data) => {
        return repository.get(`${transportationResource}`, {
            params: data
        });
    }
};
