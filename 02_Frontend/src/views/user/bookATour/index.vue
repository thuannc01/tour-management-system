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
        this.setDataInit();
        this.widthTourInfo = document.getElementById('info-tour').offsetWidth;
        this.marginRight = this.getMarginRightTourDetail();
        this.paddingLeft = this.getPaddingLeftTourInfo();
        this.setPositionInfoTour();
        window.addEventListener('resize', this.setPositionInfoTour);
        window.addEventListener('scroll', this.setPositionInfoTour);
        //
        this.getDataTourPeriodId();
        //
        this.setCustomerInfoFirstly(this.userData);
        console.log('data customer: ', this.customerInfo);
        //
        this.setUserBank(this.userData.id);
    },
    unmounted() {
        window.removeEventListener('resize', this.setPositionInfoTour);
        window.removeEventListener('scroll', this.setPositionInfoTour);
        this.setCustomerCount(0);
    },
    watch: {
        'data.advance_payment'() {
            if (this.data.advance_payment == 'true') {
                this.setPaymentAmount(
                    Math.round(Number(this.data.total_amount) * 0.5)
                );
            } else {
                this.setPaymentAmount(this.data.total_amount);
            }
        }
    },
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
        ...mapState('app', ['userData']),
        // module
        ...mapState('BookATourStore', [
            'periodData',
            'tourData',
            'serviceData',
            'data',
            'customerInfo',
            'priceOrder',
            'serviceList',
            'locationList',
            'customerCount',
            'statusAddress',
            'bankData',
            'fromProvinceName'
        ])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', [
            'showHeaderError',
            'showModalMessage',
            'hideHeaderError'
        ]),
        // module
        ...mapActions('BookATourStore', ['getDataPeriod', 'getAllLocation']),
        ...mapMutations('BookATourStore', [
            'setPriceOrder',
            'setDataInit',
            'setData',
            'setAdditionalServiceIdList',
            'setAdditionalServiceQuantityList',
            'setCustomerInfoFirstly',
            'setCustomerCount',
            'setStatusAddress',
            'setBankName',
            'setPaymentAmount',
            'setFromProvinceName',
            'setUserBank'
        ]),
        //
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
            if (!this.checkData()) {
                return;
            }
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
                //
                this.getAllLocation();
                this.getFromProvinceName();
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
                const vm = this;
                // check address
                if (vm.customerInfo[0].address.trim() == '') {
                    this.showHeaderError([
                        'Vui lòng thiết lập địa chỉ trong cài đặt tài khoản của bạn.'
                    ]);
                    this.setStatusAddress(false);
                    return;
                }
                this.setStatusAddress(true);
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
                const vm = this;
                // check payment method
                if (vm.data.payment_method.trim() == '') {
                    this.showHeaderError([
                        'Vui lòng chọn phương thức thanh toán.'
                    ]);
                    return;
                }
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
        clickImgBank(bankName) {
            const vm = this;
            vm.setBankName(bankName);
            vm.showModalBankAccount();
        },
        getDataTourPeriodId() {
            const condition = {
                tour_period_id: this.$route.params.tourPeriodId
            };
            this.getDataPeriod(condition);
        },
        formatNumber(number) {
            let numStr = number.toString();

            let result = [];

            for (let i = numStr.length - 1, j = 0; i >= 0; i--, j++) {
                if (j > 0 && j % 3 === 0) {
                    result.unshift('.');
                }
                result.unshift(numStr[i]);
            }
            return result.join('');
        },
        formatDate(inputDate) {
            let dateObject = new Date(inputDate);

            let day = dateObject.getDate();
            let month = dateObject.getMonth() + 1;
            let year = dateObject.getFullYear();

            day = day < 10 ? '0' + day : day;
            month = month < 10 ? '0' + month : month;

            let formattedDate = `${day}/${month}/${year}`;

            return formattedDate;
        },
        // step 1
        calculateTotalAmount() {
            const vm = this;
            // handeling service
            let servicePrice = '\n';
            const serviceData = vm.serviceData;
            let totalAmountServices = 0;
            let listServiceID = '';
            let listQuantityService = '';
            for (let i = 0; i < serviceData.length; i++) {
                listServiceID += serviceData[i].id + '###';
                listQuantityService += vm.serviceList[i] + '###';
                //
                totalAmountServices += vm.serviceList[i] * serviceData[i].price;
                servicePrice =
                    servicePrice +
                    '(' +
                    (vm.serviceList[i] +
                        ' x ' +
                        `${vm.formatNumber(serviceData[i].price)}đ`) +
                    ')' +
                    '   +   ';
            }
            servicePrice.replace(/\+$/, '');
            vm.setAdditionalServiceIdList(listServiceID);
            vm.setAdditionalServiceQuantityList(listQuantityService);
            //
            const adult_ticket_price = vm.convertCurrencyStringToNumber(
                vm.tourData[0].adult_ticket_price
            );
            const child_ticket_price = vm.convertCurrencyStringToNumber(
                vm.tourData[0].child_ticket_price
            );
            const infant_ticket_price = vm.convertCurrencyStringToNumber(
                vm.tourData[0].infant_ticket_price
            );
            //
            let totalAmountTour =
                adult_ticket_price * (vm.data.adult_ticket_quantity ?? 0) +
                child_ticket_price * (vm.data.child_ticket_quantity ?? 0) +
                infant_ticket_price * (vm.data.infant_ticket_quantity ?? 0);
            //
            let customerCount =
                Number(vm.data.adult_ticket_quantity ?? 0) +
                Number(vm.data.child_ticket_quantity ?? 0) +
                Number(vm.data.infant_ticket_quantity ?? 0);
            vm.setCustomerCount(customerCount);
            //
            let totalAmount =
                (totalAmountServices ?? 0) + (totalAmountTour ?? 0);
            //
            let data = {
                adult:
                    vm.data.adult_ticket_quantity +
                    ' x ' +
                    vm.tourData[0].adult_ticket_price,
                child:
                    vm.data.child_ticket_quantity +
                    ' x ' +
                    vm.tourData[0].child_ticket_price,
                infant:
                    vm.data.infant_ticket_quantity +
                    ' x ' +
                    vm.tourData[0].infant_ticket_price,
                service: servicePrice,
                sum: totalAmount
            };
            //
            vm.setPriceOrder(data);
            //
            const dataSet = {
                user_id: vm.userData.id,
                tour_period_id: this.$route.params.tourPeriodId,
                total_amount: totalAmount
            };
            vm.setData(dataSet);
            console.log('data ở bước này: ', vm.data);
        },
        // step 2
        inputInfoCustomer() {
            //
        },
        //
        convertCurrencyStringToNumber(currencyString) {
            const cleanedString = currencyString.replace(/[₫,.]/g, '');
            const integerValue = parseInt(cleanedString, 10);

            return integerValue;
        },
        checkData() {
            const vm = this;
            vm.hideHeaderError();
            let result = false;
            // check adult_ticket_quantity
            if (
                vm.data.adult_ticket_quantity != 0 &&
                vm.data.adult_ticket_quantity != ''
            ) {
                result = true;
            } else {
                this.showHeaderError([
                    'Số lượng người lớn phải lớn hơn 0 (> 0)'
                ]);
            }
            return result;
        },
        saveBankInfo() {
            const vm = this;
            vm.hideHeaderError();
            if ((vm.bankData.atm_card_number.trim() ?? '') == '') {
                this.showHeaderError(['Vui lòng nhập số thẻ ATM']);
                return;
            } else if ((vm.bankData.cardholder_name.trim() ?? '') == '') {
                this.showHeaderError(['Vui lòng nhập tên chủ thẻ']);
                return;
            } else if ((vm.bankData.expiry_date.trim() ?? '') == '') {
                this.showHeaderError(['Vui lòng nhập thời gian hết hạn thẻ']);
                return;
            } else if (vm.data.advance_payment == null) {
                this.showHeaderError([
                    'Chọn hình thức thanh toán tiền một phần hay toàn phần.'
                ]);
                return;
            }
            document.getElementById('hideModalBankAccount').click();
            vm.navBookATour(4);
        },
        getFromProvinceName() {
            const vm = this;
            let province = vm.locationList.find(
                (item) => item.id === vm.tourData[0].from_province_id
            );
            console.log(province.name);
            vm.setFromProvinceName(province.name);
        }
    }
};
export default BookATour;
</script>
