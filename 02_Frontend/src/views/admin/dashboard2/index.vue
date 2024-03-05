<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import Dashboard2Store from '@/views/admin/dashboard2/store';

var Dashboard2 = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('Dashboard2Store')) {
            store.registerModule('Dashboard2Store', Dashboard2Store);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Thống kê theo tour');
        this.setPagePathAdmin1('Theo tour');
        this.setRoutePagePathAdmin1('/admin/statistics-by-tour');
        document
            .getElementById('sidebar-item-statistical')
            .classList.add('active');
        document
            .getElementById('sidebar-item-statistical-tour')
            .classList.add('active');
        // init data
        this.getAllCategories();
        this.getAllSegment();
        this.getDataInit();
        this.getProvinceByArea({
            area: this.statisticalConditions.area
        });
        //
        this.doSearch();
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-statistical')
            .classList.remove('active');
        document
            .getElementById('sidebar-item-statistical-tour')
            .classList.remove('active');

        next();
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
        this.setDataInit();
        this.resetData();
    },
    watch: {
        'statisticalConditions.area'() {
            this.getProvinceByArea({
                area: this.statisticalConditions.area
            });
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
        ...mapState('Dashboard2Store', [
            'data',
            'selectOptions',
            'statisticalConditions',
            // 'totalRows',
            'tourData',
            'periodData'
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
        ...mapMutations('Dashboard2Store', ['setDataInit', 'resetData']),
        ...mapActions('Dashboard2Store', [
            'getProvinceByArea',
            'getAllSegment',
            'getAllCategories',
            'getDataInit',
            'statisticalByTour'
        ]),
        handleButtonClick() {
            alert('Button clicked!');
        },
        doSearch(tourID = 0) {
            const vm = this;
            const conditions = {
                area: vm.statisticalConditions.area,
                province: vm.statisticalConditions.province.join(','),
                category: vm.statisticalConditions.category.join(','),
                segment: vm.statisticalConditions.segment.join(','),
                hasTourist: vm.statisticalConditions.hasTourist,
                order: vm.statisticalConditions.order,
                tour: tourID
            };
            vm.statisticalByTour(conditions);
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

export default Dashboard2;
</script>
