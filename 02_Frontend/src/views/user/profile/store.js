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
        ratingData: { ...ratingData }
    },
    mutations: {
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
                            title: 'Đã đánh giá thành công',
                            content:
                                'Cảm ơn bạn đã đánh giá tour du lịch này. Chúc bạn một ngày tốt lành!',
                            okText: 'Tiếp tục',
                            callback: (ok) => {
                                if (ok) {
                                    document
                                        .getElementById('hideModalRating')
                                        .click();
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
