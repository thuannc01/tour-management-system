import repository from './repository';

const initData = {
    status: 'Chờ xác nhận'
};
const conditions = {
    status: '',
    title: '',
    page_size: 4,
    page_number: 1
};

export default {
    namespaced: true,
    state: {
        conditions: { ...conditions },
        data: { ...initData },
        dataTable: [],
        totalRows: 1,
        selectOptions: {
            statusOrder: [
                {
                    id: 'Chờ thanh toán',
                    name: 'Chờ thanh toán'
                },
                {
                    id: 'Chờ xác nhận',
                    name: 'Chờ xác nhận'
                },
                {
                    id: 'Chờ đặt phương tiện',
                    name: 'Chờ đặt phương tiện'
                },
                {
                    id: 'Hoàn thành',
                    name: 'Hoàn thành'
                }
            ]
        }
    },
    mutations: {
        setStatusOrder(state, data) {
            state.conditions.status = data;
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
        getDataReservation(context, conditions) {
            try {
                repository.getDataReservation(conditions).then((res) => {
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
