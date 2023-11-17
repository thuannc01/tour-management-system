// import repository from './repository';

const initData = {};
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        btnUpdateTour: {
            backDisable: true,
            nextDisable: true,
            btnList: true,
            btnUpdate: false
        }
    },
    mutations: {
        setBtnUpdateTour(state, data) {
            state.btnUpdateTour.backDisable = data.backDisable;
            state.btnUpdateTour.nextDisable = data.nextDisable;
            state.btnUpdateTour.btnList = data.btnList;
            state.btnUpdateTour.btnUpdate = data.btnUpdate;
        }
    },
    actions: {}
};
