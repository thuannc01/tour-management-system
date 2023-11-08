<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import store from '@/store';
import LoginStore from '@/views/auth/login/store';
import messages from '@/utils/messages';
import label from './label';

var Login = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('login')) {
            store.registerModule('login', LoginStore);
        }
    },
    created() {},
    mounted() {
        const user = localStorage.getItem('email');
        if (user && user != '') {
            this.email = atob(user);
            const pass = localStorage.getItem('password');
            if (pass && pass != '') {
                this.password = atob(pass);
            }
        }
    },
    watch: {},
    data() {
        return {
            label: label,
            email: null,
            password: null,
            showPassword: false
        };
    },
    computed: {
        ...mapState('LoginStore', ['']),
        ...mapState('app', ['userData'])
    },
    methods: {
        ...mapActions('login', ['login']),
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),

        checkForm: function (e) {
            const { email, password } = this;
            const vm = this;
            e.preventDefault();
            if (vm.isStringEmpty(email)) {
                this.showHeaderError(['Email' + messages.E002]);
                return false;
            } else if (!vm.isEmail(email)) {
                this.showHeaderError([messages.E003]);
                return false;
            } else if (vm.isStringEmpty(password)) {
                this.showHeaderError(['Mật khẩu' + messages.E002]);
                return false;
            }
            this.login({ email, password });
            return true;
        },
        isEmail(email) {
            const emailRegex =
                /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            return emailRegex.test(email);
        },
        isStringEmpty(str) {
            return str.trim() === '';
        }
    }
};
export default Login;
</script>
