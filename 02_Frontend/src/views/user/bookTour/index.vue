<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import BookTourStore from '@/views/user/bookTour/store';
import label from './label';

import template from './template.html';
import './style.scss';

var BookTour = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('BookTourStore')) {
            store.registerModule('BookTourStore', BookTourStore);
        }
    },
    created() {},
    mounted() {},
    watch: {},
    data() {
        return {
            label: label
        };
    },
    computed: {
        // app
        // module
        ...mapState('BookTourStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', ['']),
        navBookATour(id) {
            // nav
            const navChooseService = document.getElementById(
                'nav-choose-service-book-tour'
            );
            const navInputInfo = document.getElementById(
                'nav-input-info-book-tour'
            );
            const navPayment = document.getElementById('nav-payment-book-tour');
            const navConfirm = document.getElementById('nav-confirm-book-tour');
            // body content
            const bodyChooseService = document.getElementById(
                'choose-service-book-tour'
            );
            const bodyInputInfo = document.getElementById(
                'input-info-book-tour'
            );
            const bodyPayment = document.getElementById('payment-book-tour');
            const bodyConfirm = document.getElementById('confirm-book-tour');
            if (id == 1) {
                //
            } else if (id == 2) {
                //nav
                navChooseService.classList.remove('active');
                navInputInfo.classList.add('active');
                navPayment.classList.remove('active');
                navConfirm.classList.remove('active');
                // body
                this.addDisplayNone(bodyChooseService);
                this.removeDisplayNone(bodyInputInfo);
                this.addDisplayNone(bodyPayment);
                this.addDisplayNone(bodyConfirm);
            } else if (id == 3) {
                //nav
                navChooseService.classList.remove('active');
                navInputInfo.classList.remove('active');
                navPayment.classList.add('active');
                navConfirm.classList.remove('active');
                // body
                this.addDisplayNone(bodyChooseService);
                this.addDisplayNone(bodyInputInfo);
                this.removeDisplayNone(bodyPayment);
                this.addDisplayNone(bodyConfirm);
            } else if (id == 4) {
                //nav
                navChooseService.classList.remove('active');
                navInputInfo.classList.remove('active');
                navPayment.classList.remove('active');
                navConfirm.classList.add('active');
                // body
                this.addDisplayNone(bodyChooseService);
                this.addDisplayNone(bodyInputInfo);
                this.addDisplayNone(bodyPayment);
                this.removeDisplayNone(bodyConfirm);
            } else {
                console.log('đặt tour');
            }
        },
        addDisplayNone(elem) {
            elem.classList.add('d-none');
        },
        removeDisplayNone(elem) {
            elem.classList.remove('d-none');
        },
        onBack() {
            window.history.back();
        }
    }
};
export default BookTour;
</script>
