const Dashboard = () => import('@/views/admin/dashboard');

export default [
    {
        path: '/dashboard',
        name: 'Dashboard',
        component: Dashboard,
        meta: {
            title: 'Dashboard',
            layout: 'AdminLayout'
        }
    }
];
