const Home = () => import('@/views/user/home');
const Contact = () => import('@/views/user/contact');
const Tour = () => import('@/views/user/tour');
const News = () => import('@/views/user/news');
const Profile = () => import('@/views/user/profile');
const TourDetails = () => import('@/views/user/tourDetails');
const BookTour = () => import('@/views/user/bookTour');
const BookATour = () => import('@/views/user/bookATour');
const NewsDetails = () => import('@/views/user/newsDetails');

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
        path: '/tour',
        name: 'Tour',
        component: Tour,
        meta: {
            title: 'Tour du lịch',
            layout: 'MainLayout'
        }
    },
    {
        path: '/news',
        name: 'News',
        component: News,
        meta: {
            title: 'Tin tức',
            layout: 'MainLayout'
        }
    },
    {
        path: '/profile',
        name: 'Profile',
        component: Profile,
        meta: {
            title: 'Trang cá nhân',
            layout: 'MainLayout'
        }
    },
    {
        path: '/tour-detail',
        name: 'TourDetails',
        component: TourDetails,
        meta: {
            title: 'Chi tiết tour',
            layout: 'MainLayout'
        }
    },
    {
        path: '/book-tour',
        name: 'BookTour',
        component: BookTour,
        meta: {
            title: 'Đặt tour du lịch',
            layout: 'MainLayout'
        }
    },
    {
        path: '/book-a-tour',
        name: 'BookATour',
        component: BookATour,
        meta: {
            title: 'Đặt tour du lịch',
            layout: 'MainLayout'
        }
    },
    {
        path: '/news-detail',
        name: 'NewsDetails',
        component: NewsDetails,
        meta: {
            title: 'Chi tiết tin tức',
            layout: 'MainLayout'
        }
    }
];
