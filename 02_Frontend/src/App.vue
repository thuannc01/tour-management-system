<template>
    <component :is="layout" />
</template>

<script>
import MainLayout from '@/shared/user-layout';
import EmptyLayout from '@/shared/empty-layout';
import AdminLayout from '@/shared/admin-layout';
import { mapActions } from 'vuex';

export default {
    name: 'App',
    components: { MainLayout, EmptyLayout, AdminLayout },
    data() {
        return {
            layout: null
        };
    },
    mounted() {
        this.getUserInfoAction();
    },
    watch: {
        $route(to) {
            if (to.meta.layout !== undefined) {
                this.layout = to.meta.layout;
            } else if (to.meta.layout == 'AdminLayout') {
                this.layout = 'AdminLayout';
            } else {
                this.layout = 'MainLayout'; // default
            }
        }
    },
    methods: {
        ...mapActions('app', ['getUserInfoAction'])
    }
};
</script>

<style lang="scss">
@import 'bootstrap/scss/bootstrap.scss';
@import 'bootstrap-vue-next/dist/bootstrap-vue-next.css';
@import '@/assets/scss/common/common.scss';
@import '@/assets/scss/common/basscss.min.scss';
</style>
