<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import OrderStore from '@/views/admin/order/store';
import moment from 'moment';

var Order = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('OrderStore')) {
            store.registerModule('OrderStore', OrderStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Đơn đặt tour du lịch');
        this.setPagePathAdmin1('Cập nhật đơn đặt tour du lịch');
        this.setRoutePagePathAdmin1('/admin/order');
        document.getElementById('sidebar-item-order').classList.add('active');
        //
        this.doSearch();
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-order')
            .classList.remove('active');

        next();
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
    },
    watch: {
        'conditions.page_number'() {
            this.doSearch();
        },
        'conditions.status'() {
            this.doSearch();
        },
        'conditions.page_size': 'reloadComponent',
        'conditions.total_rows': 'reloadComponent'
    },
    data() {
        return {
            currentDateTime: '',
            reloadKey: 0
        };
    },
    computed: {
        ...mapState('app', []),
        ...mapState('OrderStore', [
            'totalRows',
            'dataTable',
            'data',
            'conditions',
            'selectOptions',
            'bookTransData',
            'bookTransCondition',
            'reservationData',
            'customerDetail',
            'serviceData',
            'tourData',
            'transportationData',
            'bankAccountData',
            'priceSpread'
        ])
    },
    methods: {
        ...mapActions('app', []),
        ...mapMutations('app', [
            'showHeaderError',
            'setPageNameAdmin',
            'setPagePathAdmin1',
            'setRoutePagePathAdmin1',
            'setPagePathAdmin2',
            'setRoutePagePathAdmin2',
            'setPagePathAdmin3',
            'setRoutePagePathAdmin3'
        ]),
        ...mapActions('OrderStore', [
            'getDataReservation',
            'getDataToBookTrans',
            'bookTrans',
            'getDetailOrderData',
            'updateStatus'
        ]),
        ...mapMutations('OrderStore', [
            'setStatusOrder',
            'setIsOrderTrans',
            'setBookTransData',
            'setBookTransCondition',
            'setReservationId'
        ]),
        handleButtonClick() {
            alert('Button clicked!');
        },
        reloadComponent() {
            this.reloadKey += 1;
        },
        doSearch() {
            const vm = this;
            const conditions = {
                status: vm.conditions.status ?? '',
                title: vm.conditions.title ?? '',
                page_size: vm.conditions.page_size,
                page_number: vm.conditions.page_number
            };
            vm.getDataReservation(conditions);
        },
        setStatus(status) {
            const vm = this;
            vm.setStatusOrder(status);
        },
        sumQuantity(x1, x2, x3) {
            return Number(x1) + Number(x2) + Number(x3);
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
        formatDate2(inputText) {
            const parts = inputText.split(/[- :]/);
            const formattedDate = new Date(
                parts[0],
                parts[1] - 1,
                parts[2],
                parts[3],
                parts[4],
                parts[5]
            );

            const day = String(formattedDate.getDate()).padStart(2, '0');
            const month = String(formattedDate.getMonth() + 1).padStart(2, '0');
            const year = formattedDate.getFullYear();
            const hours = String(formattedDate.getHours()).padStart(2, '0');
            const minutes = String(formattedDate.getMinutes()).padStart(2, '0');
            const seconds = String(formattedDate.getSeconds()).padStart(2, '0');

            const formattedString = `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;

            return formattedString;
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
        showModalTrans(
            departure_time,
            type_transportation,
            quantity,
            from_location,
            to_location,
            type_transportation_name,
            reservationID
        ) {
            const conditions = {
                reservationID: reservationID,
                departure_time: departure_time,
                type_transportation: type_transportation,
                quantity: quantity,
                from_location: from_location,
                to_location: to_location,
                type_transportation_name: type_transportation_name
            };
            this.setBookTransCondition(conditions);
            console.log('conditions showModalTrans: ', conditions);
            this.getDataToBookTrans(conditions);
        },
        bookingTrans(transportation_quantity) {
            const vm = this;
            const conditions = {
                id: vm.bookTransCondition.reservationID,
                transportation_id: vm.bookTransCondition.type_transportation,
                transportation_ticket_price: transportation_quantity,
                transportation_quantity: vm.bookTransCondition.quantity
            };
            vm.bookTrans({
                conditions: conditions,
                anotherCallback: vm.doSearch
            });
        },
        showModalDetailOrder(reservation_id) {
            const vm = this;
            vm.setReservationId(reservation_id);
            const conditions = {
                id: reservation_id
            };
            vm.getDetailOrderData(conditions);
        },
        formatDate3(date) {
            const inputMoment = moment(date);

            return inputMoment.format('DD/MM/YYYY HH:mm:ss');
        },
        saveStatusOrder() {
            const vm = this;
            const conditions = {
                id: vm.data.reservation_id,
                status: vm.data.status
            };
            vm.updateStatus({
                conditions: conditions,
                anotherCallback: vm.doSearch
            });
        }
    }
};

export default Order;
</script>
