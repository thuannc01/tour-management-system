import repository from './repository';

export default {
    namespaced: true,
    state: {
        tourData: [],
        periodData: [],
        ratingData: [],
        imgTourData: [],
        scheduleData: [],
        countRatingData: 0,
        starCountData: 0
    },
    mutations: {
        setTourData(state, data) {
            state.tourData = data;
        },
        setPeriodData(state, data) {
            state.periodData = [];
            //
            const moment = require('moment');
            const currentDate = moment();
            for (let i = 0; i < data.length; i++) {
                if (
                    !currentDate.isSameOrAfter(moment(data[i].departure_time))
                ) {
                    state.periodData.push(data[i]);
                }
            }
        },
        setRatingData(state, data) {
            state.ratingData = data;
        },
        setCountRatingData(state, data) {
            state.countRatingData = data;
        },
        setImgTourData(state, data) {
            state.imgTourData = data;
        },
        setScheduleData(state, data) {
            state.scheduleData = data;
        },
        setStarCountData(state, data) {
            state.starCountData = data;
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
                        context.commit(
                            'setCountRatingData',
                            data.Data.countRatingData[0].count ?? 0
                        );
                        context.commit(
                            'setImgTourData',
                            data.Data.imgTourData ?? []
                        );
                        context.commit(
                            'setScheduleData',
                            data.Data.scheduleData ?? []
                        );
                        if (data.Data.starCountData[0]) {
                            context.commit(
                                'setStarCountData',
                                data.Data.starCountData[0].starcount ?? 0
                            );
                        }
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
