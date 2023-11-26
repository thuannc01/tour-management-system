<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import DashboardStore from '@/views/admin/dashboard/store';

var Dashboard = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('DashboardStore')) {
            store.registerModule('DashboardStore', DashboardStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Thống kê theo doanh thu');
        this.setPagePathAdmin1('Theo doanh thu');
        this.setRoutePagePathAdmin1('/admin/statistics-by-revenue');
        document
            .getElementById('sidebar-item-statistical')
            .classList.add('active');
        document
            .getElementById('sidebar-item-statistical-revenue')
            .classList.add('active');
        // init data
        this.getDataInit();
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-statistical')
            .classList.remove('active');
        document
            .getElementById('sidebar-item-statistical-revenue')
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
        return {
            rows: 10,
            perPage: 3,
            currentPage: 1
        };
    },
    computed: {
        ...mapState('DashboardStore', ['data', 'selectOptions'])
    },
    methods: {
        ...mapActions('app', ['']),
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
        ...mapActions('DashboardStore', ['getDataInit']),
        ...mapMutations('DashboardStore', []),
        handleButtonClick() {
            alert('Button clicked!');
        }
    }
};

export default Dashboard;
</script>
