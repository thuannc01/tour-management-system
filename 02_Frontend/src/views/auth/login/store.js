import repository from './repository';
import Router from '@/router';

export default {
    namespaced: true,
    state: {
        isLoginSuccessfully: true
    },
    mutations: {},
    actions: {
        login(context, user) {
            try {
                const vm = this;
                repository.checkAccount(user).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        if (data.Data[0].access_token) {
                            localStorage.setItem(
                                'token',
                                data.Data[0].access_token
                            );
                            localStorage.setItem(
                                'tokenTimeout',
                                new Date(
                                    new Date().getTime() +
                                        data.Data[0].expires_in * 60000
                                )
                            );
                            vm.commit('app/hideModalMessage', null, {
                                root: true
                            });
                            const role = data.Data[0].user.role_id;
                            let beforeUrl = '/';
                            if (role != 1) {
                                beforeUrl = '/admin/statistics-by-revenue';
                            }
                            Router.push(beforeUrl);
                        }
                        vm.commit('app/setUserData', data.Data[0].user);
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        }
    }
};
