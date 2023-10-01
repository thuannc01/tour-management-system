<script>
import { mapState } from 'vuex';

import template from './template.html';

var ThuanTextarea = {
    template: template,
    computed: {
        ...mapState('app', [''])
    }
};
export default ThuanTextarea;
</script>
