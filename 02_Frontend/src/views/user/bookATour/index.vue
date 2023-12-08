<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import BookATourStore from '@/views/user/bookATour/store';
import label from './label';

import template from './template.html';
import './style.scss';

var BookATour = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('BookATourStore')) {
            store.registerModule('BookATourStore', BookATourStore);
        }
    },
    created() {},
    mounted() {
        this.widthTourInfo = document.getElementById('info-tour').offsetWidth;
        this.marginRight = this.getMarginRightTourDetail();
        this.paddingLeft = this.getPaddingLeftTourInfo();
        this.setPositionInfoTour();
        window.addEventListener('resize', this.setPositionInfoTour);
        window.addEventListener('scroll', this.setPositionInfoTour);
        //
        this.getDataTourPeriodId();
    },
    unmounted() {
        window.removeEventListener('resize', this.setPositionInfoTour);
        window.removeEventListener('scroll', this.setPositionInfoTour);
    },
    watch: {},
    data() {
        return {
            label: label,
            widthTourInfo: 0,
            marginRight: 0,
            paddingLeft: 0,
            rating: 3.5
        };
    },
    computed: {
        // app
        // module
        ...mapState('BookATourStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', ['']),
        setPositionInfoTour() {
            const widthTourInfo_ = this.widthTourInfo;
            const marginRight_ = parseFloat(this.marginRight);
            const paddingLeft_ = parseFloat(this.paddingLeft);
            const scrollY = window.scrollY;
            const divInfoTour = document.getElementById('info-tour');
            const divHeader = document.getElementById('header-navbar');
            const divBreadcrumb = document.getElementById(
                'breadcrumb-tour-detail'
            );
            const heightDivBreadcrumb = divBreadcrumb.offsetHeight;
            const heightDivHeader = divHeader.offsetHeight;
            if (scrollY >= heightDivBreadcrumb) {
                divInfoTour.classList.add('info-tour-position');
                divInfoTour.style.top = `${heightDivHeader + 10}px`;
                divInfoTour.style.right = `${marginRight_ + paddingLeft_}px`;
                divInfoTour.style.width = `${widthTourInfo_}px`;
                divInfoTour.style.bottom = `${200}px`;
            } else {
                divInfoTour.classList.remove('info-tour-position');
                divInfoTour.style.top = '';
                divInfoTour.style.left = '';
            }
            //
            const footer = document.getElementById('footer');
            const footerRect = footer.getBoundingClientRect();
            const windowHeight = window.innerHeight;
            if (footerRect.top <= windowHeight - 200) {
                divInfoTour.classList.remove('info-tour-position');
            }
        },
        getMarginRightTourDetail() {
            var element = document.getElementById('detail-tour');
            var style = window.getComputedStyle(element);
            var marginRight = style
                .getPropertyValue('margin-right')
                .replace(/[^\d.]/g, '');
            return marginRight;
        },
        getPaddingLeftTourInfo() {
            var element = document.getElementById('info-tour');
            var style = window.getComputedStyle(element);
            var paddingLeft = style
                .getPropertyValue('padding-left')
                .replace(/[^\d.]/g, '');
            return paddingLeft;
        },
        navBookATour(id) {
            window.scrollTo(0, 100);
            // nav
            // const navChooseService = document.getElementById(
            //     'nav-choose-service-book-tour'
            // );
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
                // navChooseService.classList.remove('active');
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
                // navChooseService.classList.remove('active');
                // navInputInfo.classList.remove('active');
                navPayment.classList.add('active');
                navConfirm.classList.remove('active');
                // body
                this.addDisplayNone(bodyChooseService);
                this.addDisplayNone(bodyInputInfo);
                this.removeDisplayNone(bodyPayment);
                this.addDisplayNone(bodyConfirm);
            } else if (id == 4) {
                //nav
                // navChooseService.classList.remove('active');
                // navInputInfo.classList.remove('active');
                // navPayment.classList.remove('active');
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
        onBack(id) {
            window.scrollTo(0, 100);
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
            //
            if (id == 2) {
                window.history.back();
            } else if (id == 3) {
                //nav
                navChooseService.classList.add('active');
                navInputInfo.classList.remove('active');
                navPayment.classList.remove('active');
                navConfirm.classList.remove('active');
                // body
                this.removeDisplayNone(bodyChooseService);
                this.addDisplayNone(bodyInputInfo);
                this.addDisplayNone(bodyPayment);
                this.addDisplayNone(bodyConfirm);
            } else if (id == 4) {
                //nav
                navChooseService.classList.add('active');
                navInputInfo.classList.add('active');
                navPayment.classList.remove('active');
                navConfirm.classList.remove('active');
                // body
                this.addDisplayNone(bodyChooseService);
                this.removeDisplayNone(bodyInputInfo);
                this.addDisplayNone(bodyPayment);
                this.addDisplayNone(bodyConfirm);
            } else if (id == 5) {
                //nav
                navChooseService.classList.add('active');
                navInputInfo.classList.add('active');
                navPayment.classList.add('active');
                navConfirm.classList.remove('active');
                // body
                this.addDisplayNone(bodyChooseService);
                this.addDisplayNone(bodyInputInfo);
                this.removeDisplayNone(bodyPayment);
                this.addDisplayNone(bodyConfirm);
            }
        },
        showModalBankAccount() {
            document.getElementById('showModalBankAccount').click();
        },
        clickImgBank() {
            const vm = this;
            vm.showModalBankAccount();
        },
        getDataTourPeriodId() {
            const condition = {
                id: this.$route.params.tourPeriodId
            };
            console.log('getDataTourPeriodId: ', condition);
        }
    }
};
export default BookATour;
</script>
