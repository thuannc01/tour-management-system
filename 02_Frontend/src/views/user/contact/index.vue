<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import ContactStore from '@/views/user/contact/store';
import label from './label';

import template from './template.html';
import './style.scss';

var Contact = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('ContactStore')) {
            store.registerModule('ContactStore', ContactStore);
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
        ...mapState('ContactStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', [''])
    }
};
export default Contact;
</script>
