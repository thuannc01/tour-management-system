import repository from '@/utils/repository';

const reservationResource = '/reservation';
const resourceLocation = '/location';

export default {
    getDataPeriod: (data) => {
        return repository.get(`${reservationResource}/get-data-period`, {
            params: data
        });
    },
    getAllLocation: () => {
        return repository.get(`${resourceLocation}`);
    },
    saveReservation: (data) => {
        return repository.post(`${reservationResource}`, data);
    }
};
