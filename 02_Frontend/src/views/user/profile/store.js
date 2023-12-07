import repository from './repository';

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
        locationList: []
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
        setLocationList(state, data) {
            state.locationList = data;
        },
        setAvatarImg(state, data) {
            state.userDataUpdate.avatar_path = data;
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
                        context.dispatch('searchNews');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
