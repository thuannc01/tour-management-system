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
            fullName: '',
            email: '',
            phoneNumber: '',
            password: '',
            password_confirmation: ''
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
            const vm = this;
            const {
                fullName,
                email,
                phoneNumber,
                password,
                password_confirmation
            } = this;
            e.preventDefault();
            if (vm.isStringEmpty(fullName)) {
                this.showHeaderError(['Họ và tên' + messages.E002]);
                return false;
            } else if (!vm.isUsernameValid(fullName)) {
                this.showHeaderError([messages.E005]);
                return false;
            } else if (vm.isStringEmpty(email)) {
                this.showHeaderError(['Email' + messages.E002]);
                return false;
            } else if (!vm.isEmail(email)) {
                this.showHeaderError([messages.E003]);
                return false;
            } else if (vm.isStringEmpty(phoneNumber)) {
                this.showHeaderError(['Số điện thoại' + messages.E002]);
                return false;
            } else if (!vm.isNumber(phoneNumber)) {
                this.showHeaderError([messages.E004]);
                return false;
            } else if (vm.isStringEmpty(password)) {
                this.showHeaderError(['Mật khẩu' + messages.E002]);
                return false;
            } else if (vm.isStringEmpty(password_confirmation)) {
                this.showHeaderError(['Xác nhận lại mật khẩu' + messages.E002]);
                return false;
            }
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
        },
        isEmail(email) {
            const emailRegex =
                /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            return emailRegex.test(email);
        },
        isStringEmpty(str) {
            return str.trim() === '';
        },
        isNumber(value) {
            return !isNaN(parseFloat(value)) && isFinite(value);
        },
        isUsernameValid(username) {
            const regex = /^[^0-9]/;
            return regex.test(username);
        }
    }
};
export default Register;
</script>
