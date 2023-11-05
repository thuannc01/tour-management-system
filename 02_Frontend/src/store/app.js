import messages, { MSG_TYPE, MSG_TITLE } from '@/utils/messages';
// import helpers from '@/utils/helpers';

const dataPathAdmin = {
    pageNameAdmin: '',
    pagePathAdmin1: '',
    routePagePathAdmin1: '',
    pagePathAdmin2: '',
    routePagePathAdmin2: '',
    pagePathAdmin3: '',
    routePagePathAdmin3: ''
};
const userInfo = {
    id: '',
    role_id: '',
    full_name: '',
    email: '',
    phone_number: '',
    avatar_url: '',
    province_id: '',
    district_id: '',
    ward_id: '',
    address: '',
    gender: '',
    status: ''
};

export default {
    namespaced: true,
    state: {
        initPathAdminLayout: { ...dataPathAdmin },
        isLoading: false,
        userData: { ...userInfo },
        isForceLoading: false,
        isNoLoading: false,
        countLoading: 0,
        isShowHeaderError: false,
        headerErrors: [],
        isShowModalMessage: false,
        modalMessage: {
            type: MSG_TYPE.ERROR,
            title: '',
            content: '',
            okText: 'Ok',
            cancelText: 'Huỷ bỏ',
            callback: () => {}
        },
        footer: {
            footerButtons: []
        },
        footerModals: [],
        isShowMenu: false,
        screenId: 'login',
        isLogout: false,
        isLogin: false
    },
    getters: {},
    mutations: {
        setUserData(state, data) {
            state.userData.id = data.id ?? '';
            state.userData.role_id = data.role_id ?? '';
            state.userData.full_name = data.full_name ?? '';
            state.userData.email = data.email ?? '';
            state.userData.phone_number = data.phone_number ?? '';
            state.userData.avatar_url = data.avatar_url ?? '';
            state.userData.province_id = data.province_id ?? '';
            state.userData.district_id = data.district_id ?? '';
            state.userData.ward_id = data.ward_id ?? '';
            state.userData.address = data.address ?? '';
            state.userData.gender = data.gender ?? '';
            state.userData.status = data.status ?? '';
        },
        setPageNameAdmin(state, data) {
            state.initPathAdminLayout.pageNameAdmin = data;
        },
        setPagePathAdmin1(state, data) {
            state.initPathAdminLayout.pagePathAdmin1 = data;
        },
        setRoutePagePathAdmin1(state, data) {
            state.initPathAdminLayout.routePagePathAdmin1 = data;
        },
        setPagePathAdmin2(state, data) {
            state.initPathAdminLayout.pagePathAdmin2 = data;
        },
        setRoutePagePathAdmin2(state, data) {
            state.initPathAdminLayout.routePagePathAdmin2 = data;
        },
        setPagePathAdmin3(state, data) {
            state.initPathAdminLayout.pagePathAdmin3 = data;
        },
        setRoutePagePathAdmin3(state, data) {
            state.initPathAdminLayout.routePagePathAdmin3 = data;
        },
        showLoading(state) {
            state.isLoading = true;
        },
        hideLoading(state) {
            state.isLoading = false;
        },
        showForceLoading(state) {
            state.isForceLoading = true;
        },
        hideForceLoading(state) {
            state.isForceLoading = false;
        },
        showHeaderError(state, errors) {
            state.isShowHeaderError = true;
            state.headerErrors = errors;
        },
        hideHeaderError(state) {
            state.isShowHeaderError = false;
            state.headerErrors = [];
        },
        showModalMessage(state, message) {
            state.isShowHeaderError = false;
            state.headerErrors = [];
            state.isShowModalMessage = true;
            if (message) {
                if (message.type) {
                    state.modalMessage.type = message.type;
                } else {
                    state.modalMessage.type = MSG_TYPE.ERROR;
                }
                state.modalMessage.title = message.title;
                if (message.content) {
                    state.modalMessage.content = message.content;
                } else {
                    state.modalMessage.content = messages.E000;
                }
                if (message.okText) {
                    state.modalMessage.okText = message.okText;
                } else {
                    state.modalMessage.okText = 'OK';
                }
                if (message.cancelText) {
                    state.modalMessage.cancelText = message.cancelText;
                } else {
                    state.modalMessage.cancelText = 'Huỷ bỏ';
                }
                state.modalMessage.callback = message.callback;
            } else {
                state.modalMessage = {
                    type: MSG_TYPE.ERROR,
                    title: MSG_TITLE.E000,
                    content: messages.E000,
                    okText: 'OK',
                    cancelText: 'Huỷ bỏ',
                    callback: () => {}
                };
            }
        },
        updateShowModalMessage(state, value) {
            state.isShowModalMessage = value;
        },
        hideModalMessage(state) {
            state.isShowModalMessage = false;
            state.modalMessage = {
                type: MSG_TYPE.ERROR,
                title: '',
                content: '',
                okText: 'OK',
                cancelText: 'Huỷ bỏ',
                callback: () => {}
            };
        },
        setNoLoading(state, val) {
            state.isNoLoading = val;
        },
        increaseCountLoading(state) {
            state.countLoading += 1;
        },
        decreaseCountLoading(state) {
            state.countLoading -= 1;
            if (state.countLoading < 0) {
                state.countLoading = 0;
            }
        },
        setLogout(state, data) {
            state.isLogout = data;
        },
        setLogin(state, data) {
            state.isLogin = data;
        }
    },
    actions: {}
};
