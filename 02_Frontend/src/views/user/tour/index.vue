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
        ...mapState('TourStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', [''])
    }
};
export default Tour;
</script>
