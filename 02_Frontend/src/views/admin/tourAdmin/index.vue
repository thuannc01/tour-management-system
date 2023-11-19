<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import TourAdminStore from '@/views/admin/tourAdmin/store';
import VueMultiselect from 'vue-multiselect';
import Uploader from 'vue-media-upload';
import CKEditorCustom from './CKEditorCustom.vue';

var TourAdmin = {
    components: { VueMultiselect, Uploader, CKEditorCustom },
    template: template,
    beforeCreate() {
        if (!store.hasModule('TourAdminStore')) {
            store.registerModule('TourAdminStore', TourAdminStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Quản lý tour du lịch');
        this.setPagePathAdmin1('Cập nhật tour du lịch');
        this.setRoutePagePathAdmin1('/admin/tour');
        document.getElementById('sidebar-item-tour').classList.add('active');
    },
    beforeRouteLeave(to, from, next) {
        document.getElementById('sidebar-item-tour').classList.remove('active');

        next();
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
    },
    watch: {},
    data() {
        return {
            rows: 10,
            perPage: 3,
            currentPage: 1,
            selected: { name: 'Javascript', code: 'js' },
            options: [
                { name: 'Vue.js', code: 'vu' },
                { name: 'Javascript', code: 'js' },
                { name: 'Open Source', code: 'os' }
            ]
        };
    },
    computed: {
        ...mapState('app', ['']),
        ...mapState('TourAdminStore', [
            'tourData',
            'btnUpdateTour',
            'dataList',
            'tourDateData'
        ])
    },
    methods: {
        ...mapActions('app', ['']),
        ...mapMutations('app', [
            'showHeaderError',
            'setPageNameAdmin',
            'setPagePathAdmin1',
            'setRoutePagePathAdmin1',
            'setPagePathAdmin2',
            'setRoutePagePathAdmin2',
            'setPagePathAdmin3',
            'setRoutePagePathAdmin3'
        ]),
        ...mapMutations('TourAdminStore', ['setBtnUpdateTour']),
        ...mapActions('TourAdminStore', [
            'getAllCategories',
            'getAllSegment',
            'getAllTypesTransportation',
            'getAllLocation',
            'getAllFoodSpots',
            'getAllHotelSpots'
        ]),
        switchMode(id) {
            const vm = this;
            const divListTour = document.getElementById('list-tour');
            const divUpdateTour = document.getElementById('update-tour');
            const divProcessing = document.getElementById(
                'processing-update-tour'
            );
            if (id == 1) {
                vm.removeDisplayNone(divListTour);
                vm.addDisplayNone(divUpdateTour);
                divProcessing.classList.add('blur-background');
                const statusBtn = {
                    backDisable: true,
                    nextDisable: true,
                    btnList: true,
                    btnUpdate: false
                };
                vm.setBtnUpdateTour(statusBtn);
                this.setPageNameAdmin('Liệt kê tất cả tour du lịch');
            } else if (id == 2) {
                vm.addDisplayNone(divListTour);
                vm.removeDisplayNone(divUpdateTour);
                divProcessing.classList.remove('blur-background');
                const statusBtn = {
                    backDisable: false,
                    nextDisable: false,
                    btnList: false,
                    btnUpdate: true
                };
                this.setPageNameAdmin('Thêm mới tour du lịch');
                vm.setBtnUpdateTour(statusBtn);
                //
                this.getAllCategories();
                this.getAllSegment();
                this.getAllTypesTransportation();
                this.getAllLocation();
                this.getAllFoodSpots();
                this.getAllHotelSpots();
            }
        },
        addDisplayNone(elem) {
            elem.classList.add('d-none');
        },
        removeDisplayNone(elem) {
            elem.classList.remove('d-none');
        },
        updateTourStep(id) {
            const divStep1 = document.getElementById('update-tour-tab-1');
            const divStep2 = document.getElementById('update-tour-tab-2');
            const divBtnNext = document.getElementById('btn-next-update');
            if (id == 1) {
                //
                document
                    .getElementById('step-tour-admin-2')
                    .classList.add('step-tour-admin-disable');
                document
                    .getElementById('step-tour-admin-2')
                    .classList.remove('step-tour-admin');
                //
                divBtnNext.innerHTML = 'Tiếp theo';
                divBtnNext.classList.add('bg-btn-primary-custom');
                divBtnNext.classList.remove('btn-success');
                //
                this.removeDisplayNone(divStep1);
                this.addDisplayNone(divStep2);
            } else if (id == 2) {
                document
                    .getElementById('step-tour-admin-2')
                    .classList.remove('step-tour-admin-disable');
                document
                    .getElementById('step-tour-admin-2')
                    .classList.add('step-tour-admin');
                //
                divBtnNext.innerHTML = 'Lưu thay đổi';
                divBtnNext.classList.remove('bg-btn-primary-custom');
                divBtnNext.classList.add('btn-success');
                //
                this.addDisplayNone(divStep1);
                this.removeDisplayNone(divStep2);
            }
        },
        changeMedia(media) {
            this.media = media;
        }
    }
};

export default TourAdmin;
</script>
<style src="vue-multiselect/dist/vue-multiselect.css"></style>
