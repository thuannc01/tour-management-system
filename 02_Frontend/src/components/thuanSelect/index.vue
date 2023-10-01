<script>
import { mapState } from 'vuex';

import template from './template.html';

var ThuanSelect = {
    template: template,
    computed: {
        ...mapState('app', [''])
    }
};
export default ThuanSelect;
</script>
