const Dashboard = () => import('@/views/admin/dashboard');
const Dashboard2 = () => import('@/views/admin/dashboard2');
const Category = () => import('@/views/admin/category');

export default [
    {
        path: '/admin/statistics-by-revenue',
        name: 'Dashboard1',
        component: Dashboard,
        meta: {
            title: 'Thống kê theo doanh thu',
            layout: 'AdminLayout'
        }
    },
    {
        path: '/admin/statistics-by-tour',
        name: 'Dashboard2',
        component: Dashboard2,
        meta: {
            title: 'Thống kê theo tour',
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
    }
];
