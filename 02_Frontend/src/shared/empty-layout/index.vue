<script>
import template from './template.html';

import HeaderError from '@/components/headerError';
import Loading from '@/components/loading';
import Modal from '@/shared/modal';

export default {
    name: 'EmptyLayout',
    template: template,
    components: {
        HeaderError,
        Loading,
        Modal
    }
};
</script>

<style lang="scss">
@import '@/assets/scss/auth/login.scss';
</style>
