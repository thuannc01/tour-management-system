<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import FeedbackStore from '@/views/admin/feedback/store';

var Feedback = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('FeedbackStore')) {
            store.registerModule('FeedbackStore', FeedbackStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Phản hồi & đánh giá');
        this.setPagePathAdmin1('Phản hồi & đánh giá tour du lịch');
        this.setRoutePagePathAdmin1('/admin/feedback');
        document.getElementById('sidebar-item-rating').classList.add('active');
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-rating')
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
        ...mapState('FeedbackStore', [])
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
        ...mapActions('FeedbackStore', []),
        ...mapMutations('FeedbackStore', []),
        handleButtonClick() {
            alert('Button clicked!');
        }
    }
};

export default Feedback;
</script>
