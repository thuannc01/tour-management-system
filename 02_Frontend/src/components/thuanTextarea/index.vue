<script>
import template from './template.html';

var ThuanTextarea = {
    template: template,
    props: {
        id: String,
        inputClass: String,
        placeholder: String,
        isRequired: Boolean,
        isDisabled: Boolean,
        isReadonly: Boolean,
        customStyle: String,
        onChange: Function,
        onFocus: Function,
        onBlur: Function,
        onClick: Function,
        label: String,
        modelValue: String,
        maxLength: Number
    },
    emits: ['update:modelValue'],
    data() {
        return {};
    },
    mounted() {},
    computed: {
        Value: {
            get() {
                return this.modelValue;
            },
            set() {}
        }
    },
    methods: {
        focusInput() {
            const val = this.$refs.input.value;
            let value = val;
            this.$emit('update:modelValue', value);
        },
        blurInput() {
            const val = this.$refs.input.value;
            let value = val;
            this.$emit('update:modelValue', value);
        },
        inputKeydown() {
            const val = this.$refs.input.value;
            let value = val;
            this.$emit('update:modelValue', value);
        },
        inputKeyup() {
            const val = this.$refs.input.value;
            let value = val;
            this.$emit('update:modelValue', value);
        },
        updateInput() {
            const val = this.$refs.input.value;
            let value = val;
            this.$emit('update:modelValue', value);
        }
    }
};
export default ThuanTextarea;
</script>
