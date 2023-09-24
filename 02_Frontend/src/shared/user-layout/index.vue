<script>
import template from './template.html';

import HeaderError from '@/components/headerError';
import Loading from '@/components/loading';

export default {
    name: 'MainLayout',
    template: template,
    components: {
        HeaderError,
        Loading
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
    watch: {},
    methods: {
        stickyTop() {
            const scrollY = window.scrollY;
            const divHeaderTopbar = document.getElementById('header-topbar');
            const divHeaderNavbar = document.getElementById('header-navbar');
            const textHeaderNav = document.querySelectorAll('.nav-link');
            const btnSearchGlobal = document.querySelector(
                'button.btn.btn-md.btn-secondary.border-0'
            );
            if (scrollY !== 0) {
                divHeaderTopbar.classList.add('d-none');
                divHeaderNavbar.classList.add('bg-white');
                textHeaderNav.forEach(function (element) {
                    element.classList.remove('text-white');
                });
                btnSearchGlobal.classList.remove('bg-transparent');
                btnSearchGlobal.classList.add('bg-header-search-global');
            } else {
                divHeaderTopbar.classList.remove('d-none');
                divHeaderNavbar.classList.remove('bg-white');
                textHeaderNav.forEach(function (element) {
                    element.classList.add('text-white');
                });
                btnSearchGlobal.classList.add('bg-transparent');
                btnSearchGlobal.classList.remove('bg-header-search-global');
            }
        }
    }
};
</script>

<style lang="scss">
@import '@/assets/scss/user/user-layout.scss';
</style>
