<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import messages, { MSG_TYPE, MSG_TITLE } from '@/utils/messages';

import template from './template.html';

import store from '@/store';
import RegisterStore from '@/views/auth/register/store';
import label from './label';

var Register = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('register')) {
            store.registerModule('register', RegisterStore);
        }
    },
    created() {},
    mounted() {},
    data() {
        return {
            label: label,
            fullName: null,
            email: null,
            phoneNumber: null,
            password: null,
            password_confirmation: null
        };
    },
    computed: {
        ...mapState('register', ['data'])
    },
    methods: {
        ...mapActions('register', ['register']),
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),

        checkForm: function (e) {
            e.preventDefault();
            const {
                fullName,
                email,
                phoneNumber,
                password,
                password_confirmation
            } = this;
            this.register({
                fullName,
                email,
                phoneNumber,
                password,
                password_confirmation
            });
            setTimeout(() => {
                if (this.data.status) {
                    const vm = this;
                    vm.showModalMessage({
                        type: MSG_TYPE.SUCCESS,
                        title: MSG_TITLE.S001,
                        content: messages.S001,
                        okText: 'Đồng ý',
                        callback: (ok) => {
                            if (ok) {
                                this.$router.push('/login');
                            }
                        }
                    });
                }
            }, 600);
        }
    }
};
export default Register;
</script>
