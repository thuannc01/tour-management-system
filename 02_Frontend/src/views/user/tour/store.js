import repository from './repository';

const conditions = {
    title: '',
    departure_time: '',
    arrival_time: '',
    adult_ticket_price: ' > 0 ',
    page_size: 9,
    page_number: 1,
    mode: 0
};
export default {
    namespaced: true,
    state: {
        conditions: { ...conditions },
        dataTable: [],
        priceOptions: [
            { id: ' > 0 ', name: 'Tất cả' },
            { id: ' < 2000000 ', name: 'Dưới 2tr' },
            { id: ' BETWEEN 2000000 AND 4000000 ', name: 'Từ 2tr - 4tr' },
            { id: ' BETWEEN 4000000 AND 6000000 ', name: 'Từ 4tr - 6tr' },
            { id: ' BETWEEN 6000000 AND 10000000 ', name: 'Từ 6tr - 10tr' },
            { id: ' BETWEEN 10000000 AND 20000000 ', name: 'Từ 10tr - 20tr' },
            { id: ' > 20000000 ', name: 'Trên 20tr' }
        ],
        pageSizeList: [
            { id: '6', name: '6 tour du lịch' },
            { id: '9', name: '9 tour du lịch' },
            { id: '12', name: '12 tour du lịch' }
        ],
        totalRows: 1
    },
    mutations: {
        setDataTable(state, data) {
            state.dataTable = [];
            //
            const moment = require('moment');
            const currentDate = moment();
            for (let i = 0; i < data.length; i++) {
                if (
                    !currentDate.isSameOrAfter(moment(data[i].departure_time))
                ) {
                    state.dataTable.push(data[i]);
                }
            }
        },
        setTotalRows(state, data) {
            state.totalRows = data;
        }
    },
    actions: {
        searchTour(context, conditions) {
            try {
                repository.searchTour(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit(
                            'setTotalRows',
                            data.Data.totalRows ?? 1
                        );
                        console.log('setDataTable: ', data.Data.dataSearch);
                        context.commit(
                            'setDataTable',
                            data.Data.dataSearch ?? ''
                        );
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
