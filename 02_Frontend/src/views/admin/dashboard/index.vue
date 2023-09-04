<script>
import { mapActions, mapMutations } from 'vuex';

import template from './template.html';

import store from '@/store';
import DashboardStore from '@/views/admin/dashboard/store';

var Dashboard = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('dashboard')) {
            store.registerModule('dashboard', DashboardStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Dashboard');
        this.setPagePathAdmin1('Dashboard');
        this.setRoutePagePathAdmin1('/thuannc');
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
    },
    data() {
        return {};
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
        ])
    }
};

export default Dashboard;
</script>
