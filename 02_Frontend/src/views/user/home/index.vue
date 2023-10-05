<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import HomeStore from '@/views/user/home/store';
import label from './label';
// import Swiper core and required modules
import {
    Navigation,
    Pagination,
    Scrollbar,
    A11y,
    Autoplay
} from 'swiper/modules';

// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from 'swiper/vue';

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css/scrollbar';

import template from './template.html';
import './style.scss';

var Home = {
    template: template,
    components: {
        Swiper,
        SwiperSlide
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
            label: label,
            modules: [Navigation, Pagination, Scrollbar, A11y, Autoplay],
            autoplay: {
                delay: 2500,
                disableOnInteraction: true
            }
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
        },
        clickSearch() {
            console.log('search');
            document.getElementById('search-global-home').click();
        }
    }
};
export default Home;
</script>
