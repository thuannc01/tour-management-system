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
    created() {
        this.doSearch();
    },
    mounted() {},
    watch: {
        'conditions.page_number'() {
            this.doSearch();
        },
        'conditions.page_size'() {
            this.doSearch();
        },
        'conditions.type'() {
            this.doSearch();
        },
        'conditions.sort'() {
            this.doSearch();
        }
    },
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
        ...mapState('NewsStore', [
            'data',
            'newsTypeList',
            'sortList',
            'pageSizeList',
            'conditions',
            'totalRows',
            'dataTable',
            'imgNews'
        ])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('NewsStore', ['searchNews']),
        ...mapMutations('NewsStore', []),
        seeDetails(newsID) {
            this.$router.push({ path: `/news-detail/${newsID}` });
        },
        doSearch() {
            const vm = this;
            const conditions = {
                title: vm.conditions.title,
                type: vm.conditions.type,
                sort: vm.conditions.sort,
                page_size: vm.conditions.page_size,
                page_number: vm.conditions.page_number
            };
            vm.searchNews(conditions);
        },
        formatDate(inputDate) {
            const dateObject = new Date(inputDate);

            const day = dateObject.getDate().toString().padStart(2, '0');
            const month = (dateObject.getMonth() + 1)
                .toString()
                .padStart(2, '0');
            const year = dateObject.getFullYear();

            const formattedDate = `${day}/${month}/${year}`;

            return formattedDate;
        },
        getFirst130Characters(str) {
            return this.removeHtmlTags(str.slice(0, 110) + ' ...')
                .replace(/&nbsp;/g, '')
                .replace(/<a\b[^>]*>(.*?)<\/a>/g, '');
        },
        removeHtmlTags(input) {
            return input.replace(/<[^>]*>/g, '');
        },
        getRandomItem() {
            const array = this.imgNews;
            const randomIndex = Math.floor(Math.random() * array.length);
            return array[randomIndex];
        }
    }
};
export default News;
</script>
