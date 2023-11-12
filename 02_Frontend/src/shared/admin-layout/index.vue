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
    watch: {
        userData() {
            this.getRoleNameInit();
        }
    },
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
        },
        addActiveClass(elem) {
            elem.classList.add('active');
        },
        removeActiveClass(elem) {
            elem.classList.remove('active');
        },
        removeActiveSidebar() {
            const divStatistical = document.getElementById(
                'sidebar-item-statistical'
            );
            const divUser = document.getElementById('sidebar-item-user');
            const divTour = document.getElementById('sidebar-item-tour');
            const divTourTime = document.getElementById(
                'sidebar-item-tour-time'
            );
            const divTourOrder = document.getElementById('sidebar-item-order');
            const divTransport = document.getElementById(
                'sidebar-item-transport'
            );
            const divFood = document.getElementById('sidebar-item-food');
            const divAccommodation = document.getElementById(
                'sidebar-item-accommodation'
            );
            const divRating = document.getElementById('sidebar-item-rating');
            const divService = document.getElementById('sidebar-item-service');
            const divNews = document.getElementById('sidebar-item-news');
            const divCategory = document.getElementById(
                'sidebar-item-category'
            );
            const divLocation = document.getElementById(
                'sidebar-item-location'
            );
            const divObject = document.getElementById('sidebar-item-object');
            //
            this.removeActiveClass(divStatistical);
            this.removeActiveClass(divUser);
            this.removeActiveClass(divTour);
            this.removeActiveClass(divTourTime);
            this.removeActiveClass(divTourOrder);
            this.removeActiveClass(divTransport);
            this.removeActiveClass(divFood);
            this.removeActiveClass(divAccommodation);
            this.removeActiveClass(divRating);
            this.removeActiveClass(divService);
            this.removeActiveClass(divNews);
            this.removeActiveClass(divCategory);
            this.removeActiveClass(divLocation);
            this.removeActiveClass(divObject);
        }
    }
};
</script>

<style lang="scss">
@import '@/assets/scss/admin/admin-layout.scss';
</style>
