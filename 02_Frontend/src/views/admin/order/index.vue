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
    watch: {},
    data() {
        return {};
    },
    computed: {
        ...mapState('app', []),
        ...mapState('OrderStore', [])
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
        ...mapMutations('OrderStore', []),
        handleButtonClick() {
            alert('Button clicked!');
        }
    }
};

export default Order;
</script>
