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
        this.getAllLocation();
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
        ...mapState('Dashboard2Store', ['data', 'selectOptions'])
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
        ...mapMutations('Dashboard2Store', ['setDataInit']),
        ...mapActions('Dashboard2Store', [
            'getAllLocation',
            'getAllSegment',
            'getAllCategories'
        ]),
        handleButtonClick() {
            alert('Button clicked!');
        }
    }
};

export default Dashboard2;
</script>
