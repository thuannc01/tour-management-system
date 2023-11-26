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
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        selectOptions: {
            provinceList: [],
            categoryList: [],
            segmentList: []
        }
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
        getAllLocation(context) {
            try {
                repository.getAllLocation().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setProvinceList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
