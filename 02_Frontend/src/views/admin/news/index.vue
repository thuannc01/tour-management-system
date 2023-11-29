<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import NewsStore from '@/views/admin/news/store';
import CKEditorCustom from './CKEditorCustom.vue';
import { MSG_TYPE } from '@/utils/messages';

var News = {
    template: template,
    components: {
        CKEditorCustom
    },
    beforeCreate() {
        if (!store.hasModule('NewsStore')) {
            store.registerModule('NewsStore', NewsStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Tin tức & cẩm nang');
        this.setPagePathAdmin1('Cập nhật tin tức & cẩm nang du lịch');
        this.setRoutePagePathAdmin1('/admin/news');
        document.getElementById('sidebar-item-news').classList.add('active');
        //
        const authorData = {
            author_id: this.userData.id,
            authorName: this.userData.full_name
        };
        this.setAuthor(authorData);
        this.doSearchNews();
    },
    beforeRouteLeave(to, from, next) {
        document.getElementById('sidebar-item-news').classList.remove('active');

        next();
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
    },
    watch: {
        'conditions.page_number'() {
            this.doSearchNews();
        }
    },
    data() {
        return {
            showEditor: true,
            isDisableSaveBtn: true
        };
    },
    computed: {
        ...mapState('app', ['userData']),
        ...mapState('NewsStore', [
            'conditions',
            'dataTable',
            'data',
            'totalRows',
            'authorName'
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
        ...mapActions('NewsStore', ['saveNews', 'searchNews', 'deleteNews']),
        ...mapMutations('NewsStore', ['setAuthor']),
        handleButtonClick() {
            alert('Button clicked!');
        },
        switchMode(mode) {
            const divModeList = document.getElementById('mode-list');
            const divModeUpdate = document.getElementById('mode-update');
            if (mode == 1) {
                divModeList.classList.remove('d-none');
                divModeUpdate.classList.add('d-none');
                this.setPageNameAdmin('Tin tức & cẩm nang');
                this.isDisableSaveBtn = true;
            } else if (mode == 2) {
                divModeList.classList.add('d-none');
                divModeUpdate.classList.remove('d-none');
                this.setPageNameAdmin('Thêm mới tin tức & cẩm nang');
                this.isDisableSaveBtn = false;
            }
        },
        doSaveNews() {
            const vm = this;
            if (vm.data.title.trim() == '') {
                this.showHeaderError(['Tiêu đề bài viết không được để trống']);
                return;
            } else if (vm.data.type.trim() == '') {
                this.showHeaderError(['Phải chọn loại bài đăng']);
                return;
            } else if (vm.data.status.trim() == '') {
                this.showHeaderError(['Phải chọn trạng thái bài đăng']);
                return;
            } else if (vm.data.body.trim() == '') {
                this.showHeaderError(['Nội dung bài đăng không được để trống']);
                return;
            }
            const dataSave = {
                author_id: vm.data.author_id,
                title: vm.data.title,
                body: vm.data.body,
                status: vm.data.status,
                type: vm.data.type
            };
            vm.saveNews(dataSave);
            setTimeout(function () {
                vm.showModalMessage({
                    title: 'Lưu thành công',
                    type: MSG_TYPE.SUCCESS,
                    content: `Dữ liệu tin tức & cẩm nang du lịch đã được lưu thành công!`,
                    okText: 'Đồng ý'
                });
            }, 400);
        },
        doSearchNews() {
            const vm = this;
            const conditions = {
                title: vm.conditions.title,
                type: vm.conditions.type,
                sort: vm.conditions.sort,
                page_size: vm.conditions.page_size,
                page_number: vm.conditions.page_number
            };
            this.searchNews(conditions);
        },
        doDelete(title, id) {
            const vm = this;
            vm.showModalMessage({
                title: 'Xác nhận xoá',
                type: MSG_TYPE.CONFIRM,
                content: `Bạn có chắc chắn muốn xoá tin tức ${title} không?`,
                cancelText: 'Huỷ',
                okText: 'Đồng ý',
                callback: (ok) => {
                    if (ok) {
                        vm.deleteNews(id);
                    }
                }
            });
        }
    }
};

export default News;
</script>
