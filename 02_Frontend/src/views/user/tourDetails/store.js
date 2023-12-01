import repository from './repository';

export default {
    namespaced: true,
    state: {
        tourData: [],
        periodData: [],
        ratingData: []
    },
    mutations: {
        setTourData(state, data) {
            state.tourData = data;
        },
        setPeriodData(state, data) {
            state.periodData = data;
        },
        setRatingData(state, data) {
            state.ratingData = data;
        }
    },
    actions: {
        getTourDetail(context, conditions) {
            try {
                repository.getTourDetail(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setTourData', data.Data.tourData ?? '');
                        context.commit(
                            'setPeriodData',
                            data.Data.periodData ?? ''
                        );
                        context.commit(
                            'setRatingData',
                            data.Data.ratingData ?? ''
                        );
                        console.log(
                            'tourData[0].title: ',
                            context.state.tourData[0].title
                        );
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
