<script>
import template from './template.html';
import HeaderError from '@/components/headerError';
import Loading from '@/components/loading';
import { mapState, mapMutations, mapActions } from 'vuex';
import store from '@/store';
import AdminLayoutStore from '@/shared/admin-layout/store';
import Modal from '@/shared/modal';

export default {
    name: 'AdminLayout',
    template: template,
    components: {
        HeaderError,
        Loading,
        Modal
    },
    beforeCreate() {
        if (!store.hasModule('AdminLayoutStore')) {
            store.registerModule('AdminLayoutStore', AdminLayoutStore);
        }
    },
    created() {},
    mounted() {
        this.getRoleNameInit();
        if (this.userData.role_id == 1) {
            this.logout();
        }
    },
    unmounted() {},
    watch: {},
    computed: {
        ...mapState('app', ['isLogout', 'initPathAdminLayout', 'userData']),
        ...mapState('AdminLayoutStore', ['data'])
    },
    data() {
        return {};
    },
    methods: {
        ...mapMutations('app', [
            'setLogout',
            'showHeaderError',
            'showModalMessage'
        ]),
        ...mapActions('AdminLayoutStore', ['getRoleName']),
        logout: function () {
            this.setLogout(true);
            this.$router.push('/login');
        },
        decodeUrl(url) {
            try {
                return decodeURIComponent(url);
            } catch (error) {
                console.error('Error decoding URL:', error);
                return url; // Return the original URL in case of an error
            }
        },
        getRoleNameInit() {
            const vm = this;
            const conditions = {
                id: vm.userData.role_id
            };
            vm.getRoleName(conditions);
        }
    }
};
</script>

<style lang="scss">
@import '@/assets/scss/admin/admin-layout.scss';
</style>
