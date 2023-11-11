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
        this.setPagePathAdmin1('Dashboard 111');
        this.setRoutePagePathAdmin1('/thuan-nguyen');
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
        ...mapState('DashboardStore', ['data', 'selectOptions'])
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
        handleButtonClick() {
            alert('Button clicked!');
        }
    }
};

export default Dashboard2;
</script>
