<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import HomeStore from '@/views/user/home/store';
import label from './label';
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from 'swiper/vue';
// Import Swiper styles
import { Navigation, Pagination, Scrollbar, A11y } from 'swiper/modules';

import template from './template.html';
import './style.scss';

var Home = {
    template: template,
    components: {
        Swiper,
        SwiperSlide,
        modules: [Navigation, Pagination, Scrollbar, A11y]
    },
    beforeCreate() {
        if (!store.hasModule('HomeStore')) {
            store.registerModule('HomeStore', HomeStore);
        }
    },
    created() {},
    mounted() {},
    watch: {},
    data() {
        return {
            label: label
        };
    },
    computed: {
        // app
        // module
        ...mapState('HomeStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', ['']),
        onSwiper(swiper) {
            console.log(swiper);
        },
        onSlideChange() {
            console.log('slide change');
        }
    }
};
export default Home;
</script>
