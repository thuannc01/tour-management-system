<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import TourStore from '@/views/user/tour/store';
import label from './label';

import template from './template.html';
import './style.scss';

var Tour = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('TourStore')) {
            store.registerModule('TourStore', TourStore);
        }
    },
    created() {},
    mounted() {
        this.doSearch();
    },
    watch: {
        'conditions.page_number'() {
            this.doSearch();
        },
        'conditions.title'() {
            this.doSearch();
        },
        'conditions.departure_time'() {
            this.doSearch();
        },
        'conditions.arrival_time'() {
            this.doSearch();
        }
    },
    data() {
        return {
            label: label,
            rows: 10,
            perPage: 3,
            currentPage: 1
        };
    },
    computed: {
        // app
        // module
        ...mapState('app', []),
        ...mapState('TourStore', [
            'conditions',
            'priceOptions',
            'totalRows',
            'dataTable',
            'pageSizeList'
        ])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('TourStore', ['searchTour']),
        ...mapMutations('TourStore', []),
        seeDetails() {
            this.$router.push({ path: `/tour-detail` });
        },
        doSearch() {
            const vm = this;
            const conditions = {
                title: vm.conditions.title ?? '',
                departure_time: vm.conditions.departure_time ?? '',
                arrival_time: vm.conditions.arrival_time ?? '',
                adult_ticket_price: vm.conditions.adult_ticket_price ?? '',
                page_size: vm.conditions.page_size ?? '',
                page_number: vm.conditions.page_number ?? '',
                mode: 1
            };
            vm.searchTour(conditions);
        }
    }
};
export default Tour;
</script>
