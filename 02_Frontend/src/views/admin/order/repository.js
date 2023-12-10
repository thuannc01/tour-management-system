import repository from '@/utils/repository';

const reservationResource = '/reservation';

export default {
    getDataReservation: (data) => {
        return repository.get(`${reservationResource}/get-data-reservation`, {
            params: data
        });
    }
};
