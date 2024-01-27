import repository from '@/utils/repository';

const reservationResource = '/reservation';
const resourceLocation = '/location';
const resourceMail = '/send-otp';
const resourceMail2 = '/check-otp';

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
    },
    sendMail: (data) => {
        return repository.post(`${resourceMail}`, data);
    },
    checkOTP: (data) => {
        return repository.get(`${resourceMail2}`, {
            params: data
        });
    }
};
