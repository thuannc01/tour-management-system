import repository from './repository';

const initData = {
    // data save
    tour_id: 0,
    id: 0,
    status: 'Chờ duyệt – Không hiển thị',
    responder: '',
    message_response: '',
    // data show
    tour_name: '',
    responder_name: ''
};
const conditions = {
    status: '',
    star_count: 5,
    page_size: 4,
    page_number: 1
};

export default {
    namespaced: true,
    state: {
        data: { ...initData },
        dataTable: [],
        conditions: { ...conditions },
        totalRows: 0
    },
    mutations: {
        setStatusRating(state, data) {
            state.conditions.status = data;
        },
        setTotalRows(state, data) {
            state.totalRows = data;
        },
        setDataTable(state, data) {
            state.dataTable = [];
            state.dataTable = data;
        },
        setData(state, data) {
            state.data.tour_id = data.tour_id;
            state.data.id = data.id;
            state.data.status = data.status;
            state.data.responder = data.responder;
            state.data.message_response = data.message_response;
            state.data.tour_name = data.tour_name;
            state.data.responder_name = data.responder_name;
        }
    },
    actions: {
        saveResponse(context, data) {
            try {
                repository.saveResponse(data).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        // context.dispatch('searchRating');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        searchRating(context, conditions) {
            try {
                repository.searchRating(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setDataTable', data.Data.dataSearch);
                        context.commit('setTotalRows', data.Data.totalRows);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
