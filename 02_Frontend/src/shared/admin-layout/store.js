import repository from './repository';

export default {
    namespaced: true,
    state: {
        data: {
            roleName: ''
        }
    },
    mutations: {
        setRoleName(state, data) {
            state.data.roleName = data ?? '';
        }
    },
    actions: {
        getRoleName(context, payload) {
            try {
                repository.getRoleName(payload).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        console.log(data.Data);
                        if (data.Data != null) {
                            context.commit('setRoleName', data.Data.name ?? '');
                        }
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        }
    }
};
