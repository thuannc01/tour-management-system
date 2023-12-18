import repository from './repository';
import store from '@/store';
import { MSG_TYPE } from '@/utils/messages';

const userDataUpdate = {
    id: '',
    full_name: '',
    email: '',
    phone_number: '',
    province_id: '',
    district_id: '',
    ward_id: '',
    address: '',
    gender: 'Nam',
    avatar_path: ''
};

const ratingData = {
    title: '',
    tour_id: 0,
    reviewerName: '',
    reviewer: 0,
    star_count: 5,
    message: '',
    status: 'Chờ duyệt – Không hiển thị'
};

const refundData = {
    reservationID: 0,
    title: '',
    paymentAmount: 0,
    cancellationReason: '',
    refundAmount: 0,
    refundMethod: 'Chuyển vào tài khoản thanh toán'
};

export default {
    namespaced: true,
    state: {
        userDataUpdate: { ...userDataUpdate },
        genderList: [
            {
                code: 'Nam',
                name: 'Nam'
            },
            {
                code: 'Nữ',
                name: 'Nữ'
            }
        ],
        locationList: [],
        dataTable: [],
        ratingData: { ...ratingData },
        refundData: { ...refundData }
    },
    mutations: {
        setRefundData(state, data) {
            state.refundData.reservationID =
                data.reservationID ?? state.refundData.reservationID;
            state.refundData.title = data.title ?? state.refundData.title;
            state.refundData.paymentAmount =
                data.paymentAmount ?? state.refundData.paymentAmount;
            state.refundData.cancellationReason =
                data.cancellationReason ?? state.refundData.cancellationReason;
            state.refundData.refundAmount =
                data.refundAmount ?? state.refundData.refundAmount;
            state.refundData.refundMethod =
                data.refundMethod ?? state.refundData.refundMethod;
        },
        setUserDataUpdate(state, data) {
            state.userDataUpdate.id = data.id;
            state.userDataUpdate.full_name = data.full_name;
            state.userDataUpdate.email = data.email;
            state.userDataUpdate.phone_number = data.phone_number;
            state.userDataUpdate.province_id = data.province_id;
            state.userDataUpdate.district_id = data.district_id;
            state.userDataUpdate.ward_id = data.ward_id;
            state.userDataUpdate.address = data.address ?? '';
            state.userDataUpdate.gender = data.gender ?? '';
            state.userDataUpdate.avatar_path = data.avatar_path;
        },
        setRatingData(state, data) {
            state.ratingData.title = data.title ?? state.ratingData.title;
            state.ratingData.tour_id = data.tour_id ?? state.ratingData.tour_id;
            state.ratingData.reviewerName =
                data.reviewerName ?? state.ratingData.reviewerName;
            state.ratingData.reviewer =
                data.reviewer ?? state.ratingData.reviewer;
            state.ratingData.star_count =
                data.star_count ?? state.ratingData.star_count;
            state.ratingData.message = data.message ?? state.ratingData.message;
        },
        setLocationList(state, data) {
            state.locationList = data;
        },
        setAvatarImg(state, data) {
            state.userDataUpdate.avatar_path = data;
        },
        setDataTable(state, data) {
            state.dataTable = [];
            state.dataTable = data;
        }
    },
    actions: {
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
        },
        updateInfoUser(context, data) {
            try {
                repository.updateInfoUser(data).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        //
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        getOrderByStatus(context, conditions) {
            try {
                repository.getOrderByStatus(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setDataTable', data.Data ?? []);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        review(context, data) {
            try {
                repository.review(data).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        store.commit('app/showModalMessage', {
                            type: MSG_TYPE.SUCCESS,
                            title: 'Đã huỷ tour thành công',
                            content:
                                'Bạn đã huỷ tour du lịch này thành công. Click vào [Ok] để tiếp tục!',
                            okText: 'OK',
                            callback: (ok) => {
                                if (ok) {
                                    document
                                        .getElementById(
                                            'cancel-order-modal-hide'
                                        )
                                        .click();
                                }
                            }
                        });
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        updateRefund(context, data) {
            try {
                repository.updateRefund(data).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        store.commit('app/showModalMessage', {
                            type: MSG_TYPE.SUCCESS,
                            title: 'Đã đặt tour thành công',
                            content:
                                'Dữ liệu đặt tour du lịch đã được cập nhật vào cơ sở dữ liệu. Về lại trang quản lý đơn hàng của bạn!',
                            okText: 'Tiếp tục',
                            callback: (ok) => {
                                if (ok) {
                                    context.commit('setIsDirectProfile');
                                }
                            }
                        });
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
