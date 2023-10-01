const Home = () => import('@/views/user/home');
const Contact = () => import('@/views/user/contact');

export default [
    {
        path: '/',
        name: 'Home',
        component: Home,
        meta: {
            title: 'Trang chủ',
            layout: 'MainLayout'
        }
    },
    {
        path: '/contact',
        name: 'Contact',
        component: Contact,
        meta: {
            title: 'Liên hệ',
            layout: 'MainLayout'
        }
    }
];
