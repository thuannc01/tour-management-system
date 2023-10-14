<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import NewsDetailsStore from '@/views/user/newsDetails/store';
import label from './label';

import template from './template.html';
import './style.scss';

var NewsDetails = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('NewsDetailsStore')) {
            store.registerModule('NewsDetailsStore', NewsDetailsStore);
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
        ...mapState('NewsDetailsStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', [''])
    }
};
export default NewsDetails;
</script>
