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
        this.doSearch();
        this.getDataInitHeader();
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
        this.resetData();
    },
    watch: {
        'data.typeOfTime'() {
            this.doSearch();
        },
        'data.startTime'() {
            this.doSearch();
        },
        'data.endTime'() {
            this.doSearch();
        },
        'data.category'() {
            this.doSearch();
        },
        'data.order'() {
            this.doSearch();
        }
    },
    data() {
        return {
            rows: 10,
            perPage: 3,
            currentPage: 1
        };
    },
    computed: {
        ...mapState('DashboardStore', [
            'data',
            'dataTable',
            'revenueByArea',
            'revenueByTimeAndCategory'
        ])
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
        ...mapActions('DashboardStore', ['getDataInit', 'getDataInitHeader']),
        ...mapMutations('DashboardStore', ['resetData']),
        handleButtonClick() {
            alert('Button clicked!');
        },
        doSearch() {
            const vm = this;
            const conditions = {
                typeOfTime: vm.data.typeOfTime,
                startTime: vm.data.startTime,
                endTime: vm.data.endTime,
                category: vm.data.category,
                order: vm.data.order
            };
            vm.getDataInit(conditions);
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
        }
    }
};

export default Dashboard;
</script>
