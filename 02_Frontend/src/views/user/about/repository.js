import repository from '@/utils/repository';

const resource = '';

export default {
    checkAccount: (payload) => {
        return repository.post(`${resource}/login`, {
            email: payload.email,
            password: payload.password
        });
    }
};
