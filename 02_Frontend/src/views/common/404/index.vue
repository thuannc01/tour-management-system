<script>
/**
 * Import template
 */
import template from './template.html';
import { mapActions } from 'vuex';

/**
 * Define content of 404 page
 */
var PageNotFound = {
    template: template,
    created() {},
    data() {
        return {
            screenId: '400'
        };
    },
    methods: {
        ...mapActions('app', []),
        goHome() {
            this.$router.push('/login');
        }
    }
};
export default PageNotFound;
</script>
