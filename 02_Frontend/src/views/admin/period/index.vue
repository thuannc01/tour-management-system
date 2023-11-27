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
        }
    },
    data() {
        return {
            currentDateTime: ''
        };
    },
    computed: {
        ...mapState('app', []),
        ...mapState('PeriodStore', ['data', 'selectOptions', 'numberOfDay'])
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
        ...mapMutations('PeriodStore', ['setArrivalTime', 'setNumberOfDay']),
        ...mapActions('PeriodStore', ['getDataInit', 'savePeriod']),
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
        }
    }
};

export default Period;
</script>
