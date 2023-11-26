<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import NewsStore from '@/views/admin/news/store';

var New = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('NewsStore')) {
            store.registerModule('NewsStore', NewsStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Tin tức & cẩm nang');
        this.setPagePathAdmin1('Cập nhật tin tức & cẩm nang du lịch');
        this.setRoutePagePathAdmin1('/admin/news');
        document.getElementById('sidebar-item-news').classList.add('active');
    },
    beforeRouteLeave(to, from, next) {
        document.getElementById('sidebar-item-news').classList.remove('active');

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
        ...mapState('NewsStore', [])
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
        ...mapActions('NewsStore', []),
        ...mapMutations('NewsStore', []),
        handleButtonClick() {
            alert('Button clicked!');
        }
    }
};

export default New;
</script>
