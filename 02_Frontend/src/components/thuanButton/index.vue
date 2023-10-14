<script>
import template from './template.html';

var ThuanButton = {
    template: template,
    props: {
        idBtn: String,
        typeBtn: String,
        classBtn: String,
        label: String,
        handleClick: Function,
        isDisabled: Boolean
    },
    data() {
        return {};
    },
    mounted() {},
    computed: {},
    methods: {
        handleClickCustom(e) {
            if (this.handleClick) {
                this.handleClick(e);
            }
        }
    }
};
export default ThuanButton;
</script>
