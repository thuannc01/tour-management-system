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
    mounted() {
        this.getToursHome();
        this.getNewsHome();
        //
        this.gettingNotification();
    },
    unmounted() {},
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
        ...mapState('app', ['userData']),
        // module
        ...mapState('HomeStore', [
            'newsHomeList',
            'hotToursList',
            'newToursList',
            'notificationData'
        ])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('HomeStore', [
            'getToursHome',
            'getNewsHome',
            'getNotification'
        ]),
        ...mapMutations('HomeStore', []),
        //
        onSwiper(swiper) {
            console.log(swiper);
        },
        onSlideChange() {
            // console.log('slide change');
        },
        clickSearch() {
            document.getElementById('search-global-home').click();
        },
        getFirst200Characters(str) {
            let text = str ?? '';
            return this.removeHtmlTags(text.slice(0, 130) + ' ...')
                .replace(/&nbsp;/g, '')
                .replace(/<a\b[^>]*>(.*?)<\/a>/g, '');
        },
        removeHtmlTags(input) {
            return input.replace(/<[^>]*>/g, '');
        },
        seeDetailTour(tourId) {
            this.$router.push({ path: `/tour-detail/${tourId}` });
        },
        gettingNotification() {
            const vm = this;
            const conditions = {
                id: vm.userData.id
            };
            vm.getNotification(conditions);
        }
    }
};
export default Home;
</script>
