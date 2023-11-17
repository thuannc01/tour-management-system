<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import CategoryStore from '@/views/admin/category/store';

var Category = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('CategoryStore')) {
            store.registerModule('CategoryStore', CategoryStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Cập nhật loại tour du lịch');
        this.setPagePathAdmin1('Dashboard 111');
        this.setRoutePagePathAdmin1('/thuan-nguyen');
        document
            .getElementById('sidebar-item-category')
            .classList.add('active');
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
        document
            .getElementById('sidebar-item-category')
            .classList.remove('active');
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

export default Category;
</script>
