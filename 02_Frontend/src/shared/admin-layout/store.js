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
            state.data.roleName = data;
        }
    },
    actions: {
        getRoleName(context, payload) {
            try {
                repository.getRoleName(payload).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        //
                        console.log('role name: ', data);
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        }
    }
};
