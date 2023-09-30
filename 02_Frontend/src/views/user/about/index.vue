<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import AboutStore from '@/views/user/about/store';
import label from './label';

import template from './template.html';
import './style.scss';

var About = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('AboutStore')) {
            store.registerModule('AboutStore', AboutStore);
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
        ...mapState('AboutStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', [''])
    }
};
export default About;
</script>
