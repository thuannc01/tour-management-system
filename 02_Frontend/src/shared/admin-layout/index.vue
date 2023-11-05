<script>
import template from './template.html';
import HeaderError from '@/components/headerError';
import Loading from '@/components/loading';
import { mapState, mapMutations } from 'vuex';

export default {
    name: 'AdminLayout',
    template: template,
    components: {
        HeaderError,
        Loading
    },
    computed: {
        ...mapState('app', ['isLogout', 'initPathAdminLayout', 'userData'])
    },
    data() {
        return {};
    },
    methods: {
        ...mapMutations('app', ['setLogout']),
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
        }
    }
};
</script>

<style lang="scss">
@import '@/assets/scss/admin/admin-layout.scss';
</style>
