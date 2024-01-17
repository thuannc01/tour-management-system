<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import PeriodStore from '@/views/admin/period/store';
import { format } from 'date-fns-tz';
import moment from 'moment';
import { MSG_TYPE } from '@/utils/messages';

var Period = {
    template: template,
    beforeCreate() {
        if (!store.hasModule('PeriodStore')) {
            store.registerModule('PeriodStore', PeriodStore);
        }
    },
    created() {},
    mounted() {
        this.setPageNameAdmin('Thời gian mở bán tour');
        this.setPagePathAdmin1('Cập nhật thời gian mở bán tour du lịch');
        this.setRoutePagePathAdmin1('/admin/period');
        document
            .getElementById('sidebar-item-tour-time')
            .classList.add('active');
        //
        this.getCurrentDateTime();
        setInterval(() => {
            this.getCurrentDateTime();
        }, 1000);
        // init data
        this.getDataInit();
        this.doSearch();
    },
    beforeRouteLeave(to, from, next) {
        document
            .getElementById('sidebar-item-tour-time')
            .classList.remove('active');

        next();
    },
    unmounted() {
        this.setPageNameAdmin('');
        this.setPagePathAdmin1('');
        this.setRoutePagePathAdmin1('');
    },
    watch: {
        'data.departure_time'() {
            let numberOfDay_ = this.numberOfDay;
            let departure_time_ = this.data.departure_time;
            let newDate = moment(departure_time_).add(numberOfDay_, 'days');
            this.setArrivalTime(newDate.format('YYYY-MM-DD'));
        },
        'conditions.page_number'() {
            this.doSearch();
        },
        'conditions.page_size': 'reloadComponent',
        'conditions.total_rows': 'reloadComponent'
    },
    data() {
        return {
            currentDateTime: '',
            reloadKey: 0
        };
    },
    computed: {
        ...mapState('app', []),
        ...mapState('PeriodStore', [
            'data',
            'selectOptions',
            'numberOfDay',
            'conditions',
            'dataTable',
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
            'showHeaderError',
            'showModalMessage',
            'hideHeaderError'
        ]),
        ...mapMutations('PeriodStore', [
            'setArrivalTime',
            'setNumberOfDay',
            'setTotalRows'
        ]),
        ...mapActions('PeriodStore', [
            'getDataInit',
            'savePeriod',
            'searchPeriod',
            'deletePeriod',
            'getPeriodByID',
            'updatePeriod'
        ]),
        handleButtonClick() {
            alert('Button clicked!');
        },
        getCurrentDateTime() {
            const now = new Date();
            const vietnameseDateTime = format(now, 'dd/MM/yyyy HH:mm:ss', {
                timeZone: 'Asia/Ho_Chi_Minh'
            });
            this.currentDateTime = vietnameseDateTime;
        },
        onSave() {
            const vm = this;
            if (vm.data.departure_time.trim() == '') {
                this.showHeaderError(['Vui lòng nhập thời gian khởi hành']);
                return;
            } else if (vm.data.arrival_time.trim() == '') {
                this.showHeaderError(['Vui lòng nhập thời gian kết thúc']);
                return;
            } else if (
                vm.data.maximum_quantity == 0 ||
                vm.data.maximum_quantity == ''
            ) {
                this.showHeaderError(['Vui lòng nhập số lượng người giới hạn']);
                return;
            }
            const conditions = {
                tour_id: vm.data.tour_id ?? '',
                departure_time: vm.data.departure_time ?? '',
                arrival_time: vm.data.arrival_time ?? '',
                maximum_quantity: vm.data.maximum_quantity ?? '',
                tourist_guide_id: vm.data.tourist_guide_id ?? ''
            };
            //
            let dataTable = [];
            dataTable = vm.dataTable;
            let indexOfObject = dataTable.findIndex((object) => {
                return (
                    object.departure_time == vm.data.departure_time &&
                    object.tour_id === vm.data.tour_id
                );
            });
            if (indexOfObject != -1) {
                this.showHeaderError([
                    'Dữ liệu thời gian mở bán với Tour này đã tồn tại thời gian bắt đầu này rồi ^^'
                ]);
                return;
            }
            //
            console.log(dataTable);
            vm.savePeriod(conditions);
            const btnCloseModal = document.getElementById('btn-close-modal');
            btnCloseModal.click();
            setTimeout(function () {
                vm.showModalMessage({
                    title: 'Lưu thành công',
                    type: MSG_TYPE.SUCCESS,
                    content: `Dữ liệu thời gian mở bán tour du lịch của bạn đã được lưu thành công!`,
                    okText: 'Đồng ý'
                });
            }, 400);
        },
        addDays(originalDate, numberOfDays) {
            return moment(originalDate, 'DD-MM-YYYY')
                .add(numberOfDays, 'dd')
                .format('DD-MM-YYYY');
        },
        doSetNumberOfDay(id) {
            this.setNumberOfDay(id);
        },
        doSearch() {
            const vm = this;
            const conditions = {
                title: vm.conditions.title,
                page_size: vm.conditions.page_size,
                page_number: vm.conditions.page_number
            };
            console.log('conditions: ', conditions);
            vm.searchPeriod(conditions);
        },
        doDelete(title, periodID) {
            const vm = this;
            vm.showModalMessage({
                title: 'Xác nhận xoá',
                type: MSG_TYPE.CONFIRM,
                content: `Bạn có chắc chắn muốn xoá thời gian mở bán tour ${title} không?`,
                cancelText: 'Huỷ',
                okText: 'Đồng ý',
                callback: (ok) => {
                    if (ok) {
                        vm.deletePeriod(periodID);
                    }
                }
            });
        },
        reloadComponent() {
            this.reloadKey += 1;
        },
        getPeriod(id) {
            const vm = this;
            vm.getPeriodByID(id);
        },
        onUpdate() {
            const vm = this;
            vm.updatePeriod(vm.data);
        }
    }
};

export default Period;
</script>
