import messages, { MSG_TYPE, MSG_TITLE } from '@/utils/messages';
import helpers from '@/utils/helpers';

const dataPathAdmin = {
    pageNameAdmin: '',
    pagePathAdmin1: '',
    routePagePathAdmin1: '',
    pagePathAdmin2: '',
    routePagePathAdmin2: '',
    pagePathAdmin3: '',
    routePagePathAdmin3: ''
};

export default {
    namespaced: true,
    state: {
        initPathAdminLayout: { ...dataPathAdmin },
        isLoading: false,
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
        header: {
            title: '',
            showBack: false,
            fixBc: false,
            onBack: () => {
                helpers.func_back();
            }
        },
        footer: {
            footerButtons: []
        },
        footerModals: [],
        isShowMenu: false,
        screenId: 'login',
        isLogout: false,
        isLogin: false,
        user: {}
    },
    getters: {},
    mutations: {
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
