<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import ProfileStore from '@/views/user/profile/store';
import label from './label';

import template from './template.html';
import './style.scss';

var Profile = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('ProfileStore')) {
            store.registerModule('ProfileStore', ProfileStore);
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
        ...mapState('ProfileStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', [''])
    }
};
export default Profile;
</script>
