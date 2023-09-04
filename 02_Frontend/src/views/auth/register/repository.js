import repository from '@/utils/repository';

const resource = '';

export default {
    register: (payload) => {
        return repository.post(`${resource}/register`, {
            name: payload.fullName,
            email: payload.email,
            password: payload.password,
            password_confirmation: payload.password_confirmation
        });
    }
};
