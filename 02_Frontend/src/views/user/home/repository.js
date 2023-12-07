import repository from '@/utils/repository';

const resource = '';
const resourceTourHome = '/tour/home';
const resourceNewsHome = '/news/home';

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
    }
};
