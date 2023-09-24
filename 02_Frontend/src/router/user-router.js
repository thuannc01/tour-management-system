const Home = () => import('@/views/user/home');

export default [
    {
        path: '/home',
        name: 'Home',
        component: Home,
        meta: {
            title: 'Trang chủ',
            layout: 'MainLayout'
        }
    }
];
