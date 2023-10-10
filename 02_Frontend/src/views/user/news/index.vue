<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import NewsStore from '@/views/user/news/store';
import label from './label';

import template from './template.html';
import './style.scss';

var News = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('NewsStore')) {
            store.registerModule('NewsStore', NewsStore);
        }
    },
    created() {},
    mounted() {},
    watch: {},
    data() {
        return {
            label: label,
            rows: 10,
            perPage: 3,
            currentPage: 1
        };
    },
    computed: {
        // app
        // module
        ...mapState('NewsStore', ['data', 'newsTypeList', 'sortList'])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', [''])
    }
};
export default News;
</script>
