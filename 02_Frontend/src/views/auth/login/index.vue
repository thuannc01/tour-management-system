<script>
import { mapActions, mapMutations } from 'vuex';

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
            this.saveAccount = true;
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
    methods: {
        ...mapActions('login', ['login']),
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),

        checkForm: function (e) {
            e.preventDefault();
            const { email, password } = this;
            if (!email && password) {
                this.showHeaderError('ID' + [messages.E001]);
                return;
            }
            this.login({ email, password });
            return true;
        }
    }
};
export default Login;
</script>
