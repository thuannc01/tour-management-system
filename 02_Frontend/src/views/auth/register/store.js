import repository from './repository';

export default {
    namespaced: true,
    state: {
        data: {
            status: false
        }
    },
    mutations: {
        setStatus(state, data) {
            state.data.status = data;
        }
    },
    actions: {
        register(context, user) {
            try {
                repository.register(user).then((res) => {
                    const { data } = res;
                    console.log('data: ', data.user.id);
                    if (data.user.id) {
                        context.commit('setStatus', true);
                    } else {
                        context.commit('setStatus', false);
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        }
    }
};
