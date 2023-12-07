import repository from './repository';

export default {
    namespaced: true,
    state: {
        newsHomeList: [],
        hotToursList: [],
        newToursList: []
    },
    mutations: {
        setNewsHomeList(state, data) {
            state.newsHomeList = data;
        },
        setHotToursList(state, data) {
            state.hotToursList = data;
        },
        setNewToursList(state, data) {
            state.newToursList = data;
        }
    },
    actions: {
        getToursHome(context) {
            try {
                repository.getToursHome().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setHotToursList', data.Data.hotTours);
                        context.commit('setNewToursList', data.Data.newTours);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getNewsHome(context) {
            try {
                repository.getNewsHome().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setNewsHomeList', data.Data);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
