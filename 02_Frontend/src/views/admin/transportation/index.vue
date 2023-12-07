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
        //
        this.doSearch();
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
    watch: {
        'conditions.page_number'() {
            this.doSearch();
        },
        'conditions.parent_id'() {
            this.doSearch();
        },
        'conditions.page_size': 'reloadComponent',
        'conditions.total_rows': 'reloadComponent'
    },
    data() {
        return {
            reloadKey: 0
        };
    },
    computed: {
        ...mapState('app', ['userData']),
        ...mapState('TransportationStore', [
            'totalRows',
            'dataTable',
            'data',
            'conditions'
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
            'setRoutePagePathAdmin3',
            'showHeaderError',
            'showModalMessage',
            'hideHeaderError'
        ]),
        //
        ...mapActions('TransportationStore', ['searchTransportation']),
        ...mapMutations('TransportationStore', ['setParentId']),
        //
        doSearch() {
            const vm = this;
            const conditions = {
                parent_id: vm.conditions.parent_id,
                name: vm.conditions.name,
                page_size: vm.conditions.page_size,
                page_number: vm.conditions.page_number
            };
            vm.searchTransportation(conditions);
        },
        setType(id) {
            const vm = this;
            vm.setParentId(id);
        },
        reloadComponent() {
            this.reloadKey += 1;
        },
        formatCurrency(number) {
            let numericValue = parseFloat(number.replace(/[^0-9.-]/g, ''));
            return numericValue.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
        },
        linkTo() {
            // this.$router.push('');
            window.open('https://www.trip.com/?locale=en-xx', '_blank');
        }
    }
};

export default Transportation;
</script>
