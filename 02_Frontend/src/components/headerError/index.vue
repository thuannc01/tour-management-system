<script>
import { mapState, mapMutations } from 'vuex';

import template from './template.html';

var HeaderError = {
    template: template,
    data() {
        return {
            havePopup: false
        };
    },
    methods: {
        ...mapMutations('app', ['hideHeaderError'])
    },
    watch: {
        isShowHeaderError(newVal) {
            if (newVal) {
                const collection =
                    document.getElementsByClassName('modal show');
                if (collection.length > 0) {
                    this.havePopup = true;
                } else {
                    this.havePopup = false;
                }
            } else {
                this.havePopup = false;
            }
        }
    },
    computed: {
        ...mapState('app', ['isShowHeaderError', 'headerErrors', 'isMobile'])
    }
};
export default HeaderError;
</script>
