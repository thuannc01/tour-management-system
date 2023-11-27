import repository from './repository';

const initData = {
    tour_id: 0,
    departure_time: '',
    arrival_time: '',
    maximum_quantity: 0,
    tourist_guide_id: 1
};
const conditions = {
    title: '',
    page_size: 4,
    page_number: 1
};
export default {
    namespaced: true,
    state: {
        conditions: { ...conditions },
        data: { ...initData },
        selectOptions: {
            toursList: [],
            tourGuideList: []
        },
        dataTable: [],
        totalRows: 1,
        numberOfDay: 0
    },
    mutations: {
        setDataInit(state, data) {
            state.selectOptions.toursList = data.allTours;
            state.data.tour_id = data.allTours[0].id;
            state.numberOfDay = data.allTours[0].number_of_day;
            state.selectOptions.tourGuideList = data.allTourGuide;
        },
        setArrivalTime(state, data) {
            state.data.arrival_time = data;
        },
        setNumberOfDay(state, data) {
            const numberOfDay = state.selectOptions.toursList.find(
                (item) => item.id == data
            );
            state.numberOfDay = numberOfDay.number_of_day;
        }
    },
    actions: {
        getDataInit(context) {
            try {
                repository.getDataInit().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setDataInit', data.Data ?? 1);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        savePeriod(context, data) {
            try {
                repository.savePeriod(data).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        // context.commit('setDataInit', data.Data ?? 1);
                        console.log('save ok');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
