import repository from './repository';
import moment from 'moment';

const priceOrder = {
    adult: 0,
    child: 0,
    infant: 0,
    service: 0,
    sum: 0
};
const data = {
    tour_period_id: 0,
    bank_account_id: 0,
    user_id: 0,
    adult_ticket_quantity: 0,
    child_ticket_quantity: 0,
    infant_ticket_quantity: 0,
    additional_service_id_list: '',
    additional_service_quantity_list: '',
    total_amount: 0,
    status: 'Chờ thanh toán',
    otp_code: 0,
    payment_method: '',
    //
    payment_amount: 0,
    payment_date: moment().format('DD/MM/YYYY HH:mm:ss'),
    advance_payment: null,
    payment_detail: ''
};

const bankData = {
    bank_name: '',
    atm_card_number: '',
    cardholder_name: '',
    expiry_date: '',
    user_id: ''
};

export default {
    namespaced: true,
    state: {
        periodData: [],
        tourData: [],
        serviceData: [],
        priceOrder: { ...priceOrder },
        data: { ...data },
        customerInfo: new Array(300).fill().map(() => ({
            full_name: '',
            phone_number: '',
            email: '',
            province_id: '',
            address: ''
        })),
        serviceList: new Array(300).fill(0),
        locationList: [],
        customerCount: 0,
        statusAddress: true,
        bankData: { ...bankData },
        fromProvinceName: ''
    },
    mutations: {
        setDataPeriod(state, data) {
            state.periodData = data.periodData ?? [];
            state.tourData = data.tourData ?? [];
            state.serviceData = data.serviceData ?? [];
        },
        setPriceOrder(state, data) {
            state.priceOrder.adult = data.adult;
            state.priceOrder.child = data.child;
            state.priceOrder.infant = data.infant;
            state.priceOrder.service = data.service;
            state.priceOrder.sum = data.sum;
        },
        setDataInit(state) {
            state.data = { ...data };
            state.priceOrder = { ...priceOrder };
        },
        setData(state, data) {
            state.data.tour_period_id =
                data.tour_period_id ?? state.data.tour_period_id;
            state.data.bank_account_id =
                data.bank_account_id ?? state.data.bank_account_id;
            state.data.user_id = data.user_id ?? state.data.user_id;
            state.data.adult_ticket_quantity =
                data.adult_ticket_quantity ?? state.data.adult_ticket_quantity;
            state.data.child_ticket_quantity =
                data.child_ticket_quantity ?? state.data.child_ticket_quantity;
            state.data.infant_ticket_quantity =
                data.infant_ticket_quantity ??
                state.data.infant_ticket_quantity;
            state.data.additional_service_id_list =
                data.additional_service_id_list ??
                state.data.additional_service_id_list;
            state.data.additional_service_quantity_list =
                data.additional_service_quantity_list ??
                state.data.additional_service_quantity_list;
            state.data.total_amount =
                data.total_amount ?? state.data.total_amount;
            state.data.status = data.status ?? state.data.status;
            state.data.otp_code = data.otp_code ?? state.data.otp_code;
            state.data.payment_method =
                data.payment_method ?? state.data.payment_method;
        },
        setAdditionalServiceIdList(state, data) {
            state.data.additional_service_id_list = data;
        },
        setAdditionalServiceQuantityList(state, data) {
            state.data.additional_service_quantity_list = data;
        },
        setCustomerInfoFirstly(state, data) {
            state.customerInfo[0].full_name = data.full_name;
            state.customerInfo[0].phone_number = data.phone_number;
            state.customerInfo[0].email = data.email;
            state.customerInfo[0].province_id = data.province_id;
            state.customerInfo[0].address = data.address;
        },
        setLocationList(state, data) {
            state.locationList = data;
        },
        setCustomerCount(state, data) {
            state.customerCount = Number(data);
            console.log('customerCount: ', state.customerCount);
        },
        setStatusAddress(state, data) {
            state.statusAddress = data;
        },
        setBankName(state, data) {
            state.bankData.bank_name = data;
        },
        setPaymentAmount(state, data) {
            state.data.payment_amount = data;
        },
        setFromProvinceName(state, data) {
            state.fromProvinceName = data;
        },
        setUserBank(state, data) {
            state.bankData.user_id = data;
        }
    },
    actions: {
        getDataPeriod(context, conditions) {
            try {
                repository.getDataPeriod(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        console.log('getDataPeriod: ', data.Data);
                        context.commit('setDataPeriod', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getAllLocation(context) {
            try {
                repository.getAllLocation().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setLocationList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
