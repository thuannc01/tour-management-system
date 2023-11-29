import repository from './repository';

const initData = {
    author_id: '',
    title: '',
    body: '',
    status: '',
    type: ''
};
const conditions = {
    title: '',
    type: '',
    sort: '',
    page_size: 4,
    page_number: 1
};
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        dataTable: [],
        conditions: { ...conditions },
        totalRows: 0,
        authorName: ''
    },
    mutations: {
        setDataTable(state, data) {
            state.dataTable = [];
            state.dataTable = data;
        },
        setTotalRows(state, data) {
            state.totalRows = data;
        },
        setAuthor(state, data) {
            state.authorName = data.authorName;
            state.data.author_id = data.author_id;
        }
    },
    actions: {
        saveNews(context, data) {
            try {
                repository.saveNews(data).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.dispatch('searchNews');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        searchNews(context, conditions) {
            try {
                repository.searchNews(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setDataTable', data.Data.dataSearch);
                        context.commit('setTotalRows', data.Data.totalRows);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        deleteNews(context, id) {
            try {
                repository.deleteNews(id).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.dispatch('searchNews');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
