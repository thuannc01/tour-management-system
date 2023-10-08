<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import TourDetailsStore from '@/views/user/tourDetails/store';
import label from './label';

import template from './template.html';
import './style.scss';

var TourDetails = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('TourDetailsStore')) {
            store.registerModule('TourDetailsStore', TourDetailsStore);
        }
    },
    created() {},
    mounted() {
        // this.setMarginInfoTour();
        // window.addEventListener('resize', this.setMarginInfoTour);
        // window.addEventListener('scroll', this.setMarginInfoTour);
    },
    unmounted() {
        // window.removeEventListener('resize', this.setMarginInfoTour);
        // window.removeEventListener('scroll', this.setMarginInfoTour);
    },
    watch: {},
    data() {
        return {
            label: label,
            rating: 3.5
        };
    },
    computed: {
        // app
        // module
        ...mapState('TourDetailsStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', ['']),
        setMarginInfoTour() {
            const scrollY = window.scrollY;
            const divInfoTour = document.getElementById('info-tour');
            const divHeader = document.getElementById('header-navbar');
            const divBreadcrumb = document.getElementById(
                'breadcrumb-tour-detail'
            );
            const heightDivBreadcrumb = divBreadcrumb.offsetHeight;
            const heightDivHeader = divHeader.offsetHeight;
            if (scrollY >= heightDivBreadcrumb) {
                divInfoTour.classList.add('info-tour-position');
                divInfoTour.style.top = `${heightDivHeader + 10}px`;
                divInfoTour.style.right = `${4}rem`;
                divInfoTour.style.width = `${30}%`;
            } else {
                divInfoTour.classList.remove('info-tour-position');
                divInfoTour.style.top = '';
                divInfoTour.style.right = '';
            }
        }
    }
};
export default TourDetails;
</script>
