import { createRouter, createWebHistory } from 'vue-router';
import store from '@/store';
import messages, { MSG_TYPE, MSG_TITLE } from '../utils/messages';
import AuthRoutes from '@/router/auth-router';
import AdminRoutes from '@/router/admin-router';
import UserRoutes from '@/router/user-router';

const PageNotFound = () => import('@/views/common/404');
const ServerError = () => import('@/views/common/500');

const baseRoutes = [
    {
        path: '/404',
        name: 'PageNotFound',
        component: PageNotFound,
        meta: {
            title: 'Error-404',
            layout: 'EmptyLayout'
        }
    },
    {
        path: '/500',
        name: 'ServerError',
        component: ServerError,
        meta: {
            title: 'Error-500',
            layout: 'EmptyLayout'
        }
    },
    {
        path: '/:catchAll(.*)',
        redirect: '/404'
    }
];

const routes = baseRoutes
    .concat(AuthRoutes)
    .concat(AdminRoutes)
    .concat(UserRoutes);

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
    scrollBehavior() {
        return { top: 0 };
    }
});

router.beforeEach((to, from, next) => {
    const func_logout = () => {
        localStorage.removeItem('token');
        localStorage.removeItem('historyURL');
        store.commit('app/setLogout', false);
        store.commit('app/setLogin', false);
    };
    const func_beforeEach = (to, from, next) => {
        store.commit('app/hideHeaderError');
        const publicPages = ['/login'];
        const authRequired = !publicPages.includes(to.path);
        let loggedIn = false;
        const token = localStorage.getItem('token');
        const tokenTimeout = localStorage.getItem('tokenTimeout');
        if (token && tokenTimeout && new Date(tokenTimeout) >= new Date()) {
            loggedIn = true;
            store.commit('app/setLogin', true);
            if (!authRequired) {
                return next('/');
            }
        } else {
            localStorage.removeItem('token');
            localStorage.removeItem('tokenTimeout');
        }
        if (authRequired && !loggedIn) {
            localStorage.setItem('beforeUrl', window.location.pathname);
            if (!store._state.data.app.isLogin) {
                store.commit('app/setLogin', false);
                // return next('/login');
            } else {
                store.commit('app/showModalMessage', {
                    type: MSG_TYPE.ERROR,
                    title: MSG_TITLE.E000,
                    content: messages.E401,
                    callback: () => {
                        store.commit('app/setLogin', false);
                        return next('/login');
                    }
                });
            }
        }
        if (!authRequired && loggedIn) {
            store.commit('app/showModalMessage', {
                type: MSG_TYPE.ERROR,
                title: MSG_TITLE.E000,
                content: messages.E401,
                callback: () => {
                    store.commit('app/setLogin', false);
                    return next('/');
                }
            });
        }
        if (to.path == '/') {
            const url = localStorage.getItem('urlAfterLogin');
            if (url && url != '/') {
                return next(url);
            }
        }
        document.title = (to.meta.title || 'Thuận') + ' | Thuận';
        next();
    };
    if (store._state.data.app.isLogout) {
        func_logout();
    }
    func_beforeEach(to, from, next);
});

export default router;
