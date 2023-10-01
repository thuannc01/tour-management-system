<script>
import template from './template.html';

var ThuanButton = {
    template: template,
    props: {
        idBtn: String,
        typeBtn: String,
        classBtn: String,
        name: String,
        handleClick: Function
    },
    data() {
        return {};
    },
    mounted() {},
    computed: {},
    methods: {
        handleClickCustom() {
            this.$emit('click');
        }
    }
};
export default ThuanButton;
</script>
