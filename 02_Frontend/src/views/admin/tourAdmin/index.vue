<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import TourAdminStore from '@/views/admin/tourAdmin/store';

var TourAdmin = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('TourAdminStore')) {
            store.registerModule('TourAdminStore', TourAdminStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Quản lý tour du lịch');
        this.setPagePathAdmin1('Cập nhật tour du lịch');
        this.setRoutePagePathAdmin1('/admin/tour');
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

export default TourAdmin;
</script>
