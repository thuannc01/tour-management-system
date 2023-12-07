import repository from './repository';

export default {
    namespaced: true,
    state: {
        data: {}
    },
    mutations: {
        setData(state, data) {
            state.data = data;
        }
    },
    actions: {
        getNewsDetail(context, conditions) {
            try {
                repository.getNewsDetail(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setData', data.Data[0] ?? {});
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
