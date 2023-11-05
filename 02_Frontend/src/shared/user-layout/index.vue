<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import template from './template.html';
import store from '@/store';
import UserLayoutStore from '@/shared/user-layout/store';

import HeaderError from '@/components/headerError';
import Loading from '@/components/loading';

export default {
    name: 'MainLayout',
    template: template,
    components: {
        HeaderError,
        Loading
    },
    beforeCreate() {
        if (!store.hasModule('UserLayoutStore')) {
            store.registerModule('UserLayoutStore', UserLayoutStore);
        }
    },
    mounted() {
        this.stickyTop();
        window.addEventListener('resize', this.stickyTop);
        window.addEventListener('scroll', this.stickyTop);
    },
    unmounted() {
        window.removeEventListener('resize', this.stickyTop);
        window.removeEventListener('scroll', this.stickyTop);
    },
    watch: {
        // userData: {
        //     handler(newValue) {
        //         if (newValue && newValue.id) {
        //             this.user_id = newValue.id;
        //         }
        //     },
        //     deep: true
        // }
    },
    computed: {
        // app
        ...mapState('app', ['isLogout', 'userData']),
        // module
        ...mapState('UserLayoutStore', ['data', 'priceOptions'])
    },
    data() {
        return {};
    },
    methods: {
        // app
        ...mapMutations('app', ['setLogout']),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', ['']),
        stickyTop() {
            const scrollY = window.scrollY;
            const divHeaderTopbar = document.getElementById('header-topbar');
            const divHeaderNavbar = document.getElementById('header-navbar');
            const textHeaderNav = document.querySelectorAll('.nav-link');
            const btnSearchGlobal = document.querySelector(
                'button.border-0.btn.btn-primary'
            );
            const divLogo = document.getElementById('logo-img');
            if (scrollY !== 0) {
                divHeaderTopbar.classList.add('d-none');
                divHeaderNavbar.classList.add('bg-white');
                textHeaderNav.forEach(function (element) {
                    element.classList.remove('text-white');
                });
                btnSearchGlobal.classList.remove('bg-transparent');
                btnSearchGlobal.classList.add('bg-header-search-global');
                divLogo.setAttribute(
                    'style',
                    'filter: invert(17%) sepia(15%) saturate(6227%) hue-rotate(192deg) brightness(96%) contrast(97%)'
                );
            } else {
                divHeaderTopbar.classList.remove('d-none');
                divHeaderNavbar.classList.remove('bg-white');
                textHeaderNav.forEach(function (element) {
                    element.classList.add('text-white');
                });
                btnSearchGlobal.classList.add('bg-transparent');
                btnSearchGlobal.classList.remove('bg-header-search-global');
                divLogo.setAttribute(
                    'style',
                    'filter: brightness(0) invert(1);'
                );
            }
        },
        navTour() {
            this.$router.push({ path: `/tour` });
        },
        navNews() {
            this.$router.push({ path: `/news` });
        },
        navProfile() {
            this.$router.push({ path: `/profile` });
        },
        logout: function () {
            this.setLogout(true);
            this.$router.push('/login');
        },
        login: function () {
            this.$router.push('/login');
        }
    }
};
</script>

<style lang="scss">
@import '@/assets/scss/user/user-layout.scss';
</style>
