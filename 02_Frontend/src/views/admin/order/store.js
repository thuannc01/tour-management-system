import repository from './repository';
import store from '@/store';
import { MSG_TYPE } from '@/utils/messages';

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
        },
        bookTransData: [],
        bookTransCondition: {
            reservationID: '',
            departure_time: '',
            type_transportation: '',
            quantity: '',
            from_location: '',
            to_location: '',
            type_transportation_name: ''
        },
        //
        reservationData: [],
        customerDetail: [],
        serviceData: [],
        tourData: [],
        transportationData: [],
        bankAccountData: [],
        priceSpread: 0
    },
    mutations: {
        setReservationData(state, data) {
            state.reservationData = data;
        },
        setCustomerDetail(state, data) {
            state.customerDetail = data;
        },
        setServiceData(state, data) {
            state.serviceData = data;
        },
        setTourData(state, data) {
            state.tourData = data;
        },
        setTransportationData(state, data) {
            state.transportationData = data;
        },
        setBankAccountData(state, data) {
            state.bankAccountData = data;
        },
        setStatusOrder(state, data) {
            state.conditions.status = data;
        },
        setDataTable(state, data) {
            state.dataTable = [];
            state.dataTable = data;
        },
        setTotalRows(state, data) {
            state.totalRows = data;
        },
        setBookTransData(state, data) {
            state.bookTransData = data;
        },
        setBookTransCondition(state, data) {
            state.bookTransCondition.reservationID = data.reservationID ?? null;
            state.bookTransCondition.departure_time = data.departure_time;
            state.bookTransCondition.type_transportation =
                data.type_transportation;
            state.bookTransCondition.quantity = data.quantity;
            state.bookTransCondition.from_location = data.from_location;
            state.bookTransCondition.to_location = data.to_location;
            state.bookTransCondition.type_transportation_name =
                data.type_transportation_name;
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
        },
        getDataToBookTrans(context, conditions) {
            try {
                repository.getDataToBookTrans(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setBookTransData', data.Data);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        bookTrans(context, { conditions, anotherCallback }) {
            try {
                repository.bookTrans(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        store.commit('app/showModalMessage', {
                            type: MSG_TYPE.SUCCESS,
                            title: 'Đặt phương tiện thành công',
                            content:
                                'Bạn đã đặt phương tiện thành công. Click vào [Tiếp tục] để trở lại màn hình chính!',
                            okText: 'Tiếp tục',
                            callback: (ok) => {
                                if (ok) {
                                    document
                                        .getElementById(
                                            'btn-close-modal-book-trans'
                                        )
                                        .click();
                                }
                            }
                        });
                        if (anotherCallback) anotherCallback();
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getDetailOrderData(context, conditions) {
            try {
                repository.getDetailOrderData(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit(
                            'setReservationData',
                            data.Data.reservationData
                        );
                        context.commit(
                            'setCustomerDetail',
                            data.Data.customerDetail
                        );
                        context.commit('setServiceData', data.Data.serviceData);
                        context.commit('setTourData', data.Data.tourData);
                        context.commit(
                            'setTransportationData',
                            data.Data.transportationData
                        );
                        context.commit(
                            'setBankAccountData',
                            data.Data.bankAccountData
                        );
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
