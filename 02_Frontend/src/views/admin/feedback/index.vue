<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import FeedbackStore from '@/views/admin/feedback/store';
import { MSG_TYPE } from '@/utils/messages';

var Feedback = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('FeedbackStore')) {
            store.registerModule('FeedbackStore', FeedbackStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Phản hồi & đánh giá');
        this.setPagePathAdmin1('Phản hồi & đánh giá tour du lịch');
        this.setRoutePagePathAdmin1('/admin/feedback');
        document.getElementById('sidebar-item-rating').classList.add('active');
        //
        this.doSearch();
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-rating')
            .classList.remove('active');

        next();
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
    },
    watch: {
        'conditions.status'() {
            this.doSearch();
        },
        'conditions.star_count'() {
            this.doSearch();
        },
        'conditions.page_number'() {
            this.doSearch();
        }
    },
    data() {
        return {};
    },
    computed: {
        ...mapState('app', ['userData']),
        ...mapState('FeedbackStore', [
            'data',
            'dataTable',
            'conditions',
            'totalRows'
        ])
    },
    methods: {
        ...mapActions('app', []),
        ...mapMutations('app', [
            'showHeaderError',
            'setPageNameAdmin',
            'setPagePathAdmin1',
            'setRoutePagePathAdmin1',
            'setPagePathAdmin2',
            'setRoutePagePathAdmin2',
            'setPagePathAdmin3',
            'setRoutePagePathAdmin3',
            'showModalMessage'
        ]),
        ...mapActions('FeedbackStore', ['searchRating', 'saveResponse']),
        ...mapMutations('FeedbackStore', ['setStatusRating', 'setData']),
        doSetStatusRating(status) {
            const vm = this;
            vm.setStatusRating(status);
        },
        doSearch() {
            const vm = this;
            const conditions = {
                status: vm.conditions.status ?? '',
                star_count: vm.conditions.star_count ?? 4,
                page_size: vm.conditions.page_size,
                page_number: vm.conditions.page_number
            };
            vm.searchRating(conditions);
        },
        formatStatus(str) {
            return (str ?? ' - ').split(' – ')[0];
        },
        responseRating(tour_id, title, id, status, message_response) {
            const vm = this;
            const data = {
                tour_id: tour_id,
                id: id,
                status: status,
                responder: vm.userData.id,
                message_response: message_response,
                tour_name: title,
                responder_name: vm.userData.full_name
            };
            vm.setData(data);
        },
        onSaveResponse() {
            const vm = this;
            const dataSave = {
                tour_id: vm.data.tour_id,
                id: vm.data.id,
                status: vm.data.status,
                responder: vm.data.responder ?? 1,
                message_response: vm.data.message_response ?? ''
            };
            vm.saveResponse(dataSave);
            setTimeout(function () {
                vm.showModalMessage({
                    title: 'Lưu thành công',
                    type: MSG_TYPE.SUCCESS,
                    content: `Dữ liệu phản hồi đánh giá của bạn đã được cập nhật!`,
                    okText: 'Đồng ý',
                    callback: (ok) => {
                        if (ok) {
                            vm.doSearch();
                            document.getElementById('btn-close-modal').click();
                        }
                    }
                });
            }, 400);
        }
    }
};

export default Feedback;
</script>
