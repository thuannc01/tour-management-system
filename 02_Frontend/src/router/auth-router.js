const Login = () => import('@/views/auth/login');
const Register = () => import('@/views/auth/register');

export default [
    {
        path: '/login',
        name: 'Login',
        component: Login,
        meta: {
            title: 'Đăng nhập',
            layout: 'EmptyLayout'
        }
    },
    {
        path: '/register',
        name: 'Register',
        component: Register,
        meta: {
            title: 'Đăng ký',
            layout: 'EmptyLayout'
        }
    }
];
