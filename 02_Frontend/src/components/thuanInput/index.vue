<script>
import { mapState } from 'vuex';

import template from './template.html';

var ThuanInput = {
    template: template,
    props: {
        id: String,
        label: String,
        style: String,
        itemClass: String,
        labelClass: String,
        placeholder: String,
        value: String,
        isRequired: Boolean,
        isDisabled: Boolean,
        isReadonly: Boolean,
        type: String,
        maxLength: Number,
        onChange: Function,
        onFocus: Function,
        onBlur: Function
    },
    data() {
        return {};
    },
    computed: {
        ...mapState('app', [''])
    }
};
export default ThuanInput;
</script>
