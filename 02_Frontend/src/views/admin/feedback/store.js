// import repository from './repository';

const initData = {
    rating_id: '',
    tour_name: '',
    responder: '',
    message_response: '',
    status: 'Chờ duyệt – Không hiển thị'
};
const conditions = {
    status: '',
    star_count: 0,
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
        }
    },
    actions: {}
};
