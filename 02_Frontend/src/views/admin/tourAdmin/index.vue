<script>
import { mapActions, mapMutations, mapState } from 'vuex';

import template from './template.html';

import './style.scss';
import store from '@/store';
import TourAdminStore from '@/views/admin/tourAdmin/store';
import VueMultiselect from 'vue-multiselect';
import CKEditorCustom from './CKEditorCustom.vue';
import axios from 'axios';

var TourAdmin = {
    components: {
        VueMultiselect,
        CKEditorCustom
    },
    template: template,
    beforeCreate() {
        if (!store.hasModule('TourAdminStore')) {
            store.registerModule('TourAdminStore', TourAdminStore);
        }
    },
    created() {},
    mounted() {
        this.initScreen();
        this.setInitImagesTourList();
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
    watch: {
        //
    },
    data() {
        return {
            showEditor: true,
            rows: 20,
            perPage: 5,
            currentPage: 1,
            component: {},
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
            'tourDateData',
            'tourDateDataTemp'
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
            'setRoutePagePathAdmin3',
            'showHeaderError',
            'showModalMessage',
            'hideHeaderError'
        ]),
        ...mapMutations('TourAdminStore', [
            'setBtnUpdateTour',
            'setImagesTourList',
            'setInitImagesTourList',
            'deleteImagesTourList',
            'initScreen',
            'setTourDateDataTemp',
            'initTourDateData'
        ]),
        ...mapActions('TourAdminStore', [
            'getAllCategories',
            'getAllSegment',
            'getAllTypesTransportation',
            'getAllLocation',
            'getAllFoodSpots',
            'getAllHotelSpots',
            'getAllAdditionalService'
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
                vm.setInitImagesTourList();
                //
                vm.getAllCategories();
                vm.getAllSegment();
                vm.getAllTypesTransportation();
                vm.getAllLocation();
                vm.getAllFoodSpots();
                vm.getAllHotelSpots();
                vm.getAllAdditionalService();
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
                // check data
                if (this.checkData()) {
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
                return;
            }
        },
        checkData() {
            const vm = this;
            let result = true;
            if (vm.tourData.title.trim() == '') {
                this.showHeaderError(['Tên tour du lịch không được để trống!']);
                result = false;
            } else if (vm.tourData.category_id.length == 0) {
                this.showHeaderError(['Vui lòng chọn ít nhất một loại tour.']);
                result = false;
            } else if (vm.tourData.tourist_segment_id.length == 0) {
                this.showHeaderError(['Vui lòng chọn ít nhất một đối tượng!']);
                result = false;
            } else if (
                vm.tourData.number_of_day == '' ||
                isNaN(vm.tourData.number_of_day)
            ) {
                this.showHeaderError([
                    'Vui lòng nhập thời gian tour diễn ra trong bao nhiêu ngày và nhập đúng định dạng số nguyên'
                ]);
                result = false;
            } else if (
                vm.tourData.adult_ticket_price == '' ||
                isNaN(vm.tourData.adult_ticket_price)
            ) {
                this.showHeaderError([
                    'Vui lòng nhập giá vé người lớn hoặc giá trị nhập vào không đúng định dạng'
                ]);
                result = false;
            } else if (
                vm.tourData.child_ticket_price == '' ||
                isNaN(vm.tourData.adult_ticket_price)
            ) {
                this.showHeaderError([
                    'Vui lòng nhập giá vé trẻ em hoặc giá trị nhập vào không đúng định dạng'
                ]);
                result = false;
            } else if (
                vm.tourData.infant_ticket_price == '' ||
                isNaN(vm.tourData.adult_ticket_price)
            ) {
                this.showHeaderError([
                    'Vui lòng nhập giá vé em bé hoặc giá trị nhập vào không đúng định dạng'
                ]);
                result = false;
            }
            if (result) {
                this.hideHeaderError();
                // set btn
                const statusBtn = {
                    backDisable: false,
                    nextDisable: true,
                    btnList: true,
                    btnUpdate: false
                };
                vm.setBtnUpdateTour(statusBtn);
            }
            return result;
        },
        addTourImg(event) {
            const vm = this;
            vm.uploadImg(event);
        },
        async uploadImg(event) {
            const files = event.target.files;
            if (!files) {
                return;
            }
            // call api
            const CLOUD_NAME = 'dih79o7tn';
            const PRESET_NAME = 'thuan_tourist';
            const FOLDER_NAME = 'thuan_tourist';
            const urls = [];
            const api = `https://api.cloudinary.com/v1_1/${CLOUD_NAME}/image/upload`;
            for (const file of files) {
                const formData = new FormData(); // key: value
                formData.append('upload_preset', PRESET_NAME);
                formData.append('folder', FOLDER_NAME);
                formData.append('file', file);
                store.commit('app/showLoading');
                const response = await axios
                    .post(api, formData, {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    })
                    .catch((error) =>
                        console.error('Error uploading image:', error)
                    );
                let dataSet = {
                    original_filename: response.data.original_filename,
                    public_id: response.data.public_id,
                    secure_url: response.data.secure_url
                };
                urls.push(dataSet);
            }
            store.commit('app/hideLoading');
            this.setImagesTourList(urls);
            return urls;
        },
        deleteTourImg(public_id) {
            this.deleteImagesTourList(public_id);
        },
        formatMoneyInput(event) {
            const inputValue = event.target.value;

            let numericValue = parseFloat(inputValue.replace(/[^0-9.-]/g, ''));
            if (!isNaN(numericValue)) {
                event.target.value = numericValue.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });
            }
        },
        getListIDString(arr) {
            let str = '';
            for (let i = 0; i < arr.length; i++) {
                if (arr[i].id != '' && arr[i].id != undefined) {
                    str += String(arr[i].id) + '###';
                }
            }
            return str;
        },
        changeDayTour(day, number_of_day) {
            const vm = this;
            //
            const lastDataDay = vm.tourDateDataTemp[
                vm.tourDateDataTemp.length - 1
            ]
                ? vm.tourDateDataTemp[vm.tourDateDataTemp.length - 1].day
                : 1;
            if (day != lastDataDay + 1) {
                this.showHeaderError(['Vui lòng nhập chọn ngày tiếp theo!']);
                return;
            }
            if (vm.tourDateData.title.trim() == '') {
                this.showHeaderError([
                    'Vui lòng nhập tiêu đề ngày du lịch này'
                ]);
                return;
            } else if (vm.tourDateData.hotel_spot_id.length == 0) {
                this.showHeaderError([
                    'Vui lòng chọn ít nhất một địa điểm lưu trú'
                ]);
                return;
            } else if (vm.tourDateData.food_spot_id.length == 0) {
                this.showHeaderError([
                    'Vui lòng chọn ít nhất một địa điểm ăn uống'
                ]);
                return;
            } else if (vm.tourDateData.body.trim() == '') {
                this.showHeaderError([
                    'Vui lòng nhập nội dung ngày du lịch này '
                ]);
                return;
            } else {
                this.hideHeaderError();
                document
                    .getElementById(`item-date-tour-${day}`)
                    .classList.remove('item-not-active');
                document
                    .getElementById(`item-date-tour-${day}`)
                    .classList.add('item-active');
            }
            vm.setTourDateDataTemp({
                day: day,
                title: vm.tourDateData.title,
                food_spot_id: vm.getListIDString(vm.tourDateData.food_spot_id),
                hotel_spot_id: vm.getListIDString(
                    vm.tourDateData.hotel_spot_id
                ),
                body: vm.tourDateData.body
            });
            //
            console.log('vm.tourDateDataTemp: ', vm.tourDateDataTemp);
            vm.initTourDateData();
            if (vm.tourDateDataTemp.length + 1 == number_of_day) {
                const statusBtn = {
                    backDisable: false,
                    nextDisable: false,
                    btnList: true,
                    btnUpdate: false
                };
                vm.setBtnUpdateTour(statusBtn);
            }
        }
    }
};

export default TourAdmin;
</script>
<style src="vue-multiselect/dist/vue-multiselect.css"></style>
