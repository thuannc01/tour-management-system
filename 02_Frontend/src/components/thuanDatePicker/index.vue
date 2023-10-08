<script>
import template from './template.html';
import moment from 'moment';

var ThuanDatePicker = {
    template: template,
    props: {
        id: String,
        inputClass: String,
        placeholder: String,
        isRequired: Boolean,
        isDisabled: Boolean,
        isReadonly: Boolean,
        style: String,
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
                return this.formatDateSystem(this.modelValue);
            },
            set() {}
        }
    },
    methods: {
        focusInput() {
            const val = this.$refs.input.value;
            let value = this.formatDate(val);
            this.$emit('update:modelValue', value);
        },
        blurInput() {
            const val = this.$refs.input.value;
            let value = this.formatDate(val);
            this.$emit('update:modelValue', value);
        },
        inputKeydown() {
            const val = this.$refs.input.value;
            let value = this.formatDate(val);
            this.$emit('update:modelValue', value);
        },
        inputKeyup() {
            const val = this.$refs.input.value;
            let value = this.formatDate(val);
            this.$emit('update:modelValue', value);
        },
        updateInput() {
            const val = this.$refs.input.value;
            let value = this.formatDate(val);
            this.$emit('update:modelValue', value);
        },
        formatDate(date) {
            const dateStr = date;
            const momentDate = moment(dateStr);
            const formattedDate = momentDate.format('DD/MM/YYYY');
            return formattedDate;
        },
        formatDateSystem(date) {
            const dateStr = date;
            const momentDate = moment(dateStr, 'DD/MM/YYYY');
            const formattedDate = momentDate.format('YYYY-MM-DD');
            return formattedDate;
        }
    }
};
export default ThuanDatePicker;
</script>
