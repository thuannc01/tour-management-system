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
        this.widthTourInfo = document.getElementById('info-tour').offsetWidth;
        this.marginRight = this.getMarginRightTourDetail();
        this.paddingLeft = this.getPaddingLeftTourInfo();
        this.setPositionInfoTour();
        window.addEventListener('resize', this.setPositionInfoTour);
        window.addEventListener('scroll', this.setPositionInfoTour);
        //
        this.getDataDetail();
    },
    unmounted() {
        window.removeEventListener('resize', this.setPositionInfoTour);
        window.removeEventListener('scroll', this.setPositionInfoTour);
    },
    watch: {},
    data() {
        return {
            label: label,
            widthTourInfo: 0,
            marginRight: 0,
            paddingLeft: 0,
            rating: 3.5
        };
    },
    computed: {
        // app
        // module
        ...mapState('TourDetailsStore', [
            'tourData',
            'periodData',
            'ratingData',
            'countRatingData',
            'imgTourData',
            'scheduleData',
            'starCountData'
        ])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapMutations('TourDetailsStore', []),
        ...mapActions('TourDetailsStore', ['getTourDetail']),
        setPositionInfoTour() {
            const widthTourInfo_ = this.widthTourInfo;
            const marginRight_ = parseFloat(this.marginRight);
            const paddingLeft_ = parseFloat(this.paddingLeft);
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
                divInfoTour.style.right = `${marginRight_ + paddingLeft_}px`;
                divInfoTour.style.width = `${widthTourInfo_}px`;
                divInfoTour.style.bottom = `${200}px`;
            } else {
                divInfoTour.classList.remove('info-tour-position');
                divInfoTour.style.top = '';
                divInfoTour.style.left = '';
            }
            //
            const footer = document.getElementById('footer');
            const footerRect = footer.getBoundingClientRect();
            const windowHeight = window.innerHeight;
            if (footerRect.top <= windowHeight) {
                divInfoTour.classList.remove('info-tour-position');
            }
        },
        getMarginRightTourDetail() {
            var element = document.getElementById('detail-tour');
            var style = window.getComputedStyle(element);
            var marginRight = style
                .getPropertyValue('margin-right')
                .replace(/[^\d.]/g, '');
            return marginRight;
        },
        getPaddingLeftTourInfo() {
            var element = document.getElementById('info-tour');
            var style = window.getComputedStyle(element);
            var paddingLeft = style
                .getPropertyValue('padding-left')
                .replace(/[^\d.]/g, '');
            return paddingLeft;
        },
        bookATour() {
            this.$router.push({ path: `/book-a-tour` });
        },
        getDataDetail() {
            // get data detail by tour id
            const condition = {
                id: this.$route.params.tourId
            };
            this.getTourDetail(condition);
        }
    }
};
export default TourDetails;
</script>
