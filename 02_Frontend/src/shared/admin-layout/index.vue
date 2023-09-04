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
        ...mapState('app', [
            'isLogout',
            'pageNameAdmin',
            'pagePathAdmin1',
            'routePagePathAdmins1',
            'pagePathAdmin2',
            'routePagePathAdmins2',
            'pagePathAdmin3',
            'routePagePathAdmins3'
        ])
    },
    data() {
        return {
            routePagePathAdmin1: this.routePagePathAdmins1,
            routePagePathAdmin2: this.routePagePathAdmins2,
            routePagePathAdmin3: this.routePagePathAdmins3
        };
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
