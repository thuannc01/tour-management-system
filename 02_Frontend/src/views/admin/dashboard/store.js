import repository from './repository';

const initData = {
    countTotalTours: 0,
    countTotalTourDeployed: 0,
    countTotalCustomer: 0,
    totalRevenue: 0
};
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        selectOptions: [
            { code: '1', name: 'Option 1' },
            { code: '2', name: 'Option 2' },
            { code: '3', name: 'Option 3' }
        ]
    },
    mutations: {
        setInitData(state, data) {
            state.data.countTotalTours = data.countTotalTours;
            state.data.countTotalTourDeployed = data.countTotalTourDeployed;
            state.data.countTotalCustomer = data.countTotalCustomer;
            state.data.totalRevenue = data.totalRevenue;
        }
    },
    actions: {
        getDataInit(context) {
            try {
                repository.getDataInit().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setInitData', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
