import repository from './repository';
import store from '@/store';

export default {
    namespaced: true,
    state: {
        newsHomeList: [],
        hotToursList: [],
        newToursList: [],
        notificationData: []
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
        },
        setNotificationData(state, data) {
            state.notificationData = data;
        }
    },
    actions: {
        getToursHome(context) {
            try {
                repository.getToursHome().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        console.log('setHotToursList: ', data.Data);
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
        },
        getNotification(context, conditions) {
            try {
                repository.getNotification(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        setTimeout(function () {
                            context.commit(
                                'setNotificationData',
                                data.Data ?? []
                            );
                            if (data.Data) {
                                store.commit('app/showModalMessage', {
                                    title: data.Data.title,
                                    content: data.Data.message,
                                    okText: 'Xác nhận',
                                    callback: (ok) => {
                                        if (ok) {
                                            //
                                        }
                                    }
                                });
                            }
                        }, 500);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
