<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import HomeStore from '@/views/user/home/store';
import label from './label';

import template from './template.html';
import './style.scss';

var Home = {
    template: template,
    components: {},
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
        ...mapActions('', [''])
    }
};
export default Home;
</script>
