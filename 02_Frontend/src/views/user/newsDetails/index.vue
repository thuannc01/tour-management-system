<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import NewsDetailsStore from '@/views/user/newsDetails/store';
import label from './label';

import template from './template.html';
import './style.scss';

var NewsDetails = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('NewsDetailsStore')) {
            store.registerModule('NewsDetailsStore', NewsDetailsStore);
        }
    },
    created() {},
    mounted() {
        this.dataDetail();
    },
    watch: {},
    data() {
        return {
            label: label
        };
    },
    computed: {
        // app
        // module
        ...mapState('NewsDetailsStore', ['data'])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('NewsDetailsStore', ['getNewsDetail']),
        ...mapMutations('NewsDetailsStore', []),
        //
        dataDetail() {
            const vm = this;
            const condition = {
                id: this.$route.params.newsId
            };
            vm.getNewsDetail(condition);
        },
        formatDateString(dateString) {
            const date = new Date(dateString);

            const day = date.getDate();
            const month = date.getMonth() + 1;
            const year = date.getFullYear();

            const formattedDate = `${day}/${month}/${year}`;

            return formattedDate;
        }
    }
};
export default NewsDetails;
</script>
