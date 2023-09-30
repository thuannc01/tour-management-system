const Home = () => import('@/views/user/home');
const Contact = () => import('@/views/user/contact');
const About = () => import('@/views/user/about');

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
    },
    {
        path: '/about',
        name: 'About',
        component: About,
        meta: {
            title: 'Về chúng tôi',
            layout: 'MainLayout'
        }
    }
];
