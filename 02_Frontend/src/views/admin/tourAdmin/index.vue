<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import TourAdminStore from '@/views/admin/tourAdmin/store';

var TourAdmin = {
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
            currentPage: 1
        };
    },
    computed: {
        ...mapState('DashboardStore', ['']),
        ...mapState('TourAdminStore', ['data', 'btnUpdateTour'])
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
            }
        },
        addDisplayNone(elem) {
            elem.classList.add('d-none');
        },
        removeDisplayNone(elem) {
            elem.classList.remove('d-none');
        }
    }
};

export default TourAdmin;
</script>
