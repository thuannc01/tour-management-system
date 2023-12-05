<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import TransportationStore from '@/views/admin/transportation/store';

var Transportation = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('TransportationStore')) {
            store.registerModule('TransportationStore', TransportationStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Đồng bộ phương tiện liên kết');
        this.setPagePathAdmin1('Phương tiện liên kết');
        this.setRoutePagePathAdmin1('/admin/transportation');
        document
            .getElementById('sidebar-item-transport')
            .classList.add('active');
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-transport')
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
        ...mapState('app', ['userData']),
        ...mapState('TransportationStore', ['data', 'dataTable'])
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
            'setRoutePagePathAdmin3',
            'showHeaderError',
            'showModalMessage',
            'hideHeaderError'
        ]),
        //
        ...mapActions('TransportationStore', []),
        ...mapMutations('TransportationStore', [])
        //
    }
};

export default Transportation;
</script>
