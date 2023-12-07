<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import OrderStore from '@/views/admin/order/store';

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
            'selectOptions'
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
        ...mapActions('OrderStore', []),
        ...mapMutations('OrderStore', ['setStatusOrder']),
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
            console.log('conditions: ', conditions);
        },
        setStatus(status) {
            const vm = this;
            vm.setStatusOrder(status);
        }
    }
};

export default Order;
</script>
