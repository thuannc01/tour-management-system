import repository from './repository';

const initData = {
    //
};
const conditions = {
    parent_id: 0,
    name: '',
    page_size: 4,
    page_number: 1
};

export default {
    namespaced: true,
    state: {
        conditions: { ...conditions },
        data: { ...initData },
        dataTable: [],
        totalRows: 1
    },
    mutations: {
        setParentId(state, data) {
            state.conditions.parent_id = data;
        },
        setDataTable(state, data) {
            state.dataTable = [];
            state.dataTable = data;
        },
        setTotalRows(state, data) {
            state.totalRows = data;
        }
    },
    actions: {
        searchTransportation(context, conditions) {
            try {
                repository.searchTransportation(conditions).then((res) => {
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
