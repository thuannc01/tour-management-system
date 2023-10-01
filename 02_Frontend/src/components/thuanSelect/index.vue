<script>
import template from './template.html';

var ThuanSelect = {
    template: template,
    props: {
        id: String,
        label: String,
        itemClass: String,
        labelClass: String,
        btnClass: String,
        value: String,
        modelValue: String,
        isRequired: Boolean,
        isDisabled: Boolean,
        isReadonly: Boolean,
        options: Array,
        onChangeEvent: Function,
        onFocus: Function,
        onBlur: Function
    },
    emits: ['update:modelValue'],
    computed: {
        vewValue() {
            const val = this.modelValue ? this.modelValue : this.value;
            return val;
        },
        listOptions() {
            return this.options;
        }
    },
    methods: {
        focusBtn(e) {
            if (this.onFocus) {
                this.onFocus(e);
            }
        },

        blurBtn(e) {
            if (this.onBlur) {
                this.onBlur(e);
            }
        },

        updateBtn(e) {
            const vewValue = this.$refs.select.value;
            this.$emit('update:modelValue', vewValue);
            if (this.onChange) {
                this.onChange(e, vewValue);
            }
        }
    }
};
export default ThuanSelect;
</script>
