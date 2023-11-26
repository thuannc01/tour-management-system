<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import PeriodStore from '@/views/admin/period/store';

var Period = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('PeriodStore')) {
            store.registerModule('PeriodStore', PeriodStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Thời gian mở bán tour');
        this.setPagePathAdmin1('Cập nhật thời gian mở bán tour du lịch');
        this.setRoutePagePathAdmin1('/admin/period');
        document
            .getElementById('sidebar-item-tour-time')
            .classList.add('active');
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-tour-time')
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
        ...mapState('PeriodStore', [])
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
        ...mapActions('PeriodStore', []),
        ...mapMutations('PeriodStore', []),
        handleButtonClick() {
            alert('Button clicked!');
        }
    }
};

export default Period;
</script>
