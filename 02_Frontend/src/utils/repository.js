import axios from 'axios';
import _ from 'lodash-uuid';
import messages, { MSG_TYPE, MSG_TITLE } from './messages';
import label from './label';
import store from '@/store';
import Router from '@/router';

const baseUrl = process.env.VUE_APP_BASE_DOMAIN + process.env.VUE_APP_BASE_PATH;
const apiKey = process.env.VUE_APP_API_KEY;
const timeout = process.env.VUE_APP_API_TIMEOUT;

var repository = axios.create({
    baseURL: baseUrl,
    timeout: timeout,
    headers: {
        'x-api-key': apiKey
    }
});

repository.interceptors.request.use(
    function (config) {
        config.headers['x-request-id'] = _.uuid();
        const token = localStorage.getItem('token');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        const clientCode = localStorage.getItem('clientcode');
        if (clientCode) {
            config.headers['clientcode'] = clientCode;
        }
        const isNoLoading = store.state.app.isNoLoading;
        store.commit('app/showLoading');
        if (!isNoLoading) {
            store.commit('app/increaseCountLoading');
        }
        return config;
    },
    function (error) {
        return Promise.reject(error);
    }
);

repository.interceptors.response.use(
    function (response) {
        const countLoading = store.state.app.countLoading;
        if (countLoading - 1 <= 0) {
            store.commit('app/hideLoading');
        }
        store.commit('app/decreaseCountLoading');
        const { data } = response;
        if (data.Code !== 200) {
            if (data.Code === 401) {
                store.dispatch('app/showModalMessage', {
                    type: MSG_TYPE.ERROR,
                    title: MSG_TITLE.E000,
                    content: messages.E401,
                    callback: () => {
                        localStorage.setItem(
                            'beforeUrl',
                            window.location.pathname
                        );
                        localStorage.removeItem('token');
                        localStorage.removeItem('tokenTimeout');
                        Router.push('/login');
                    }
                });
            } else if (data.Code === 403) {
                store.commit('app/showHeaderError', [messages.E000]);
            } else if (data.Code === 422) {
                let i = 0;
                for (const key in data.DataErrors) {
                    if (
                        Object.prototype.hasOwnProperty.call(
                            data.DataErrors,
                            key
                        ) &&
                        i == 0
                    ) {
                        const screenId = store.state.app.screenId;
                        const tbl = label[screenId][key];
                        store.commit('app/showHeaderError', [
                            tbl + messages[data.DataErrors[key][0]]
                        ]);
                        i++;
                    }
                }
            } else if (data.Code === 423) {
                store.commit('app/showHeaderError', [data.Message]);
            } else {
                store.commit('app/showHeaderError', [messages.E000]);
            }
            store.commit('app/hideForceLoading');
        }
        return response;
    },
    function (error) {
        const countLoading = store.state.app.countLoading;
        if (countLoading - 1 <= 0) {
            store.commit('app/hideLoading');
            store.commit('app/hideForceLoading');
        }
        store.commit('app/decreaseCountLoading');
        store.commit('app/showHeaderError', [messages.E000]);
        return Promise.reject(error);
    }
);

export default repository;
