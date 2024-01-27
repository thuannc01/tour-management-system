import repository from './repository';

const initData = {
    typeOfTime: 'month',
    startTime: '',
    endTime: '',
    category: 2,
    order: 'time',
    countTotalTours: 0,
    countTotalTourDeployed: 0,
    countTotalCustomer: 0,
    totalRevenue: 0
};
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        dataTable: [],
        revenueByTimeAndCategory: [],
        revenueByArea: [
            { label: 'Miền Bắc', color: '#41B883', value: 40 },
            { label: 'Miền Trung', color: '#E46651', value: 20 },
            { label: 'Miền Nam', color: '#00D8FF', value: 80 }
        ]
    },
    mutations: {
        setInitData(state, data) {
            state.dataTable = data.dataTable;
            state.revenueByArea = data.revenueByArea;
            state.data.countTotalCustomer = data.countTotalCustomer;
            state.revenueByTimeAndCategory = data.revenueByTimeAndCategory;
        },
        setInitDataHeader(state, data) {
            state.data.countTotalTours = data.countTotalTours;
            state.data.countTotalTourDeployed = data.countTotalTourDeployed;
            state.data.countTotalCustomer = data.countTotalCustomer;
            state.data.totalRevenue = data.totalRevenue;
        },
        resetData(state) {
            state.data = { ...initData };
        }
    },
    actions: {
        getDataInit(context, conditions) {
            try {
                repository.getDataInit(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        console.log('getDataInit: ', data.Data);
                        context.commit('setInitData', data.Data ?? []);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getDataInitHeader: (context) => {
            try {
                repository.getDataInitHeader().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        console.log('setInitDataHeader', data.Data);
                        context.commit('setInitDataHeader', data.Data ?? []);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
