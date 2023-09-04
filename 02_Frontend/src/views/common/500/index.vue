<script>
/**
 * Import template
 */
import template from './template.html';
import { mapActions } from 'vuex';

/**
 * Define content of 404 page
 */
var ServerError = {
    template: template,
    created() {},
    data() {
        return {
            screenId: '500'
        };
    },
    methods: {
        ...mapActions('app', []),
        goHome: function () {
            this.$router.push('/login');
        }
    }
};
export default ServerError;
</script>
