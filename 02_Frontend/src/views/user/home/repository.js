import repository from '@/utils/repository';

const resource = '';
const resourceTourHome = '/tour/home';
const resourceNewsHome = '/news/home';
const reservationResource = '/reservation';

export default {
    checkAccount: (payload) => {
        return repository.post(`${resource}/login`, {
            email: payload.email,
            password: payload.password
        });
    },
    getToursHome: () => {
        return repository.get(`${resourceTourHome}`);
    },
    getNewsHome: () => {
        return repository.get(`${resourceNewsHome}`);
    },
    getNotification: (data) => {
        return repository.get(`${reservationResource}/get-notification`, {
            params: data
        });
    }
};
