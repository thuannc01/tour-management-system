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
        ...mapState('TourDetailsStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', [''])
    }
};
export default TourDetails;
</script>
