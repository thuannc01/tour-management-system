import repository from './repository';

const initData = {
    areaList: '',
    provinceIDList: '',
    categoryIDList: '',
    segmentIDList: '',
    countTotalTours: 0,
    countTotalTourDeployed: 0,
    countTotalCustomer: 0,
    totalRevenue: 0
};

const statisticalConditions = {
    area: 'Miền Bắc',
    province: [],
    category: [],
    segment: [],
    hasTourist: ' >= 0 ',
    order: ' tours.created_at desc ',
    tour: 0
    // page_size: 5,
    // page_number: 1
};

export default {
    namespaced: true,
    state: {
        data: { ...initData },
        selectOptions: {
            provinceList: [],
            categoryList: [],
            segmentList: []
        },
        statisticalConditions: { ...statisticalConditions },
        // totalRows: 0,
        tourData: [],
        periodData: []
    },
    mutations: {
        setDataInit(state) {
            state.data = { ...initData };
            state.selectOptions.provinceList = [];
            state.selectOptions.categoryList = [];
            state.selectOptions.segmentList = [];
        },
        setInitData2(state, data) {
            state.data.countTotalTours = data.countTotalTours;
            state.data.countTotalTourDeployed = data.countTotalTourDeployed;
            state.data.countTotalCustomer = data.countTotalCustomer;
            state.data.totalRevenue = data.totalRevenue;
        },
        setProvinceList(state, data) {
            state.selectOptions.provinceList = data;
        },
        setCategoryList(state, data) {
            state.selectOptions.categoryList = data;
        },
        setSegmentList(state, data) {
            state.selectOptions.segmentList = data;
        },
        setTourData(state, data) {
            state.tourData = data;
        },
        setPeriodData(state, data) {
            state.periodData = data;
        },
        resetData(state) {
            state.data = { ...initData };
            state.statisticalConditions = { ...statisticalConditions };
        }
    },
    actions: {
        getDataInit(context) {
            try {
                repository.getDataInit().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setInitData2', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getAllCategories(context) {
            try {
                repository.getAllCategories().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setCategoryList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getAllSegment(context) {
            try {
                repository.getAllSegment().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setSegmentList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getProvinceByArea(context, conditions) {
            try {
                repository.getProvinceByArea(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setProvinceList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        statisticalByTour(context, conditions) {
            try {
                repository.statisticalByTour(conditions).then((res) => {
                    const { data } = res;
                    console.log(data);
                    if (data.Code == 200) {
                        console.log('statisticalByTour: ', data.Data);
                        context.commit('setTourData', data.Data.tourData ?? '');
                        context.commit(
                            'setPeriodData',
                            data.Data.periodData ?? ''
                        );
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
