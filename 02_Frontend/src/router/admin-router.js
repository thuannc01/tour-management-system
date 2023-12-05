const Dashboard = () => import('@/views/admin/dashboard');
const Dashboard2 = () => import('@/views/admin/dashboard2');
const Category = () => import('@/views/admin/category');
const TourAdmin = () => import('@/views/admin/tourAdmin');
const NewsAdmin = () => import('@/views/admin/news');
const FeedbackAdmin = () => import('@/views/admin/feedback');
const PeriodAdmin = () => import('@/views/admin/period');
const OrderAdmin = () => import('@/views/admin/order');
const TransportationAdmin = () => import('@/views/admin/transportation');

export default [
    {
        path: '/admin/statistics-by-revenue',
        name: 'Dashboard1',
        component: Dashboard,
        meta: {
            title: 'TK - Theo doanh thu',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/statistics-by-tour',
        name: 'Dashboard2',
        component: Dashboard2,
        meta: {
            title: 'TK - Theo tour',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/category',
        name: 'Category',
        component: Category,
        meta: {
            title: 'Loại tour',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/tour',
        name: 'TourAdmin',
        component: TourAdmin,
        meta: {
            title: 'Quản lý tour',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/news',
        name: 'NewsAdmin',
        component: NewsAdmin,
        meta: {
            title: 'Tin tức & cẩm nang',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/feedback',
        name: 'FeedbackAdmin',
        component: FeedbackAdmin,
        meta: {
            title: 'Phản hồi đánh giá',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/period',
        name: 'PeriodAdmin',
        component: PeriodAdmin,
        meta: {
            title: 'Thời gian mở bán tour',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/order',
        name: 'OrderAdmin',
        component: OrderAdmin,
        meta: {
            title: 'Đơn đặt tour',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/transportation',
        name: 'TransportationAdmin',
        component: TransportationAdmin,
        meta: {
            title: 'Phương tiện liên kết',
            layout: 'AdminLayout'
        }
    }
];
