import repository from '@/utils/repository';

const reservationResource = '/reservation';
const transportationResource = '/transportation';

export default {
    getDataReservation: (data) => {
        return repository.get(`${reservationResource}/get-data-reservation`, {
            params: data
        });
    },
    getDataToBookTrans: (data) => {
        return repository.get(
            `${transportationResource}/get-data-to-book-trans`,
            {
                params: data
            }
        );
    },
    bookTrans: (data) => {
        return repository.post(`${transportationResource}`, data);
    },
    getDetailOrderData: (data) => {
        return repository.get(
            `${reservationResource}/get-order-by-id-reservation`,
            {
                params: data
            }
        );
    }
};
