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
                            let beforeUrl = localStorage.getItem('beforeUrl');
                            if (
                                beforeUrl == undefined ||
                                beforeUrl == null ||
                                beforeUrl == ''
                            ) {
                                beforeUrl = '/';
                            }
                            localStorage.removeItem('beforeUrl');
                            if (user.saveAccount) {
                                localStorage.setItem(
                                    'username',
                                    btoa(user.username)
                                );
                                localStorage.setItem(
                                    'password',
                                    btoa(user.password)
                                );
                            } else {
                                localStorage.removeItem('username');
                                localStorage.removeItem('password');
                            }
                            Router.push(beforeUrl);
                        }
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        }
    }
};
