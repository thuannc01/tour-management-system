<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import ProfileStore from '@/views/user/profile/store';
import label from './label';
import axios from 'axios';

import template from './template.html';
import './style.scss';
import { MSG_TYPE } from '@/utils/messages';

var Profile = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('ProfileStore')) {
            store.registerModule('ProfileStore', ProfileStore);
        }
    },
    created() {},
    mounted() {
        this.setUserData();
        this.getAllLocation();
        //
        this.gettingOrderByStatus('Chờ thanh toán');
    },
    watch: {},
    data() {
        return {
            label: label,
            money: '3.123.654 đ',
            rating: 3.5
        };
    },
    computed: {
        // app
        ...mapState('app', ['userData']),
        // module
        ...mapState('ProfileStore', [
            'userDataUpdate',
            'genderList',
            'locationList',
            'dataTable',
            'ratingData',
            'refundData'
        ])
    },
    methods: {
        // app
        ...mapActions('app', ['getUserInfoAction']),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('ProfileStore', [
            'getAllLocation',
            'updateInfoUser',
            'getOrderByStatus',
            'review',
            'updateRefund'
        ]),
        ...mapMutations('ProfileStore', [
            'setUserDataUpdate',
            'setAvatarImg',
            'setRatingData',
            'setRefundData'
        ]),
        //
        handelNavSidebar(code) {
            const userInfo = document.getElementById('user-info');
            const waitForPay = document.getElementById('wait-for-pay');
            const waitConfirmation =
                document.getElementById('wait-confirmation');
            const waitVehicle = document.getElementById('wait-vehicle');
            const ratingTour = document.getElementById('rating-tour');
            const allTour = document.getElementById('all-tour');
            const cancelTour = document.getElementById('cancel-tour');
            //
            const navUserInfo = document.getElementById('nav-user-info');
            const navHistoryTour = document.getElementById('nav-history-tour');
            const navCancelTour = document.getElementById('nav-cancel-tour');

            if (code == 1) {
                this.removeDisplayNone(userInfo);
                this.addDisplayNone(waitForPay);
                this.addDisplayNone(waitConfirmation);
                this.addDisplayNone(ratingTour);
                this.addDisplayNone(allTour);
                this.addDisplayNone(cancelTour);
                this.addDisplayNone(waitVehicle);
                navCancelTour.classList.remove('active');
                navUserInfo.classList.add('active');
                navHistoryTour.classList.remove('active');
                // init
                this.setUserData();
                this.getAllLocation();
            } else {
                if (code == 6) {
                    this.addDisplayNone(userInfo);
                    this.addDisplayNone(waitForPay);
                    this.addDisplayNone(waitConfirmation);
                    this.addDisplayNone(ratingTour);
                    this.addDisplayNone(allTour);
                    this.removeDisplayNone(cancelTour);
                    this.addDisplayNone(waitVehicle);
                    navCancelTour.classList.add('active');
                    navUserInfo.classList.remove('active');
                    navHistoryTour.classList.remove('active');
                } else {
                    navUserInfo.classList.remove('active');
                    navHistoryTour.classList.add('active');
                    if (code == 2) {
                        this.addDisplayNone(userInfo);
                        this.removeDisplayNone(waitForPay);
                        this.addDisplayNone(waitConfirmation);
                        this.addDisplayNone(ratingTour);
                        this.addDisplayNone(allTour);
                        this.addDisplayNone(cancelTour);
                        this.addDisplayNone(waitVehicle);
                        navCancelTour.classList.remove('active');
                        //
                        this.gettingOrderByStatus('Chờ thanh toán');
                    } else if (code == 3) {
                        this.addDisplayNone(userInfo);
                        this.addDisplayNone(waitForPay);
                        this.removeDisplayNone(waitConfirmation);
                        this.addDisplayNone(ratingTour);
                        this.addDisplayNone(allTour);
                        this.addDisplayNone(cancelTour);
                        this.addDisplayNone(waitVehicle);
                        navCancelTour.classList.remove('active');
                        //
                        this.gettingOrderByStatus('Chờ xác nhận');
                    } else if (code == 4) {
                        this.addDisplayNone(userInfo);
                        this.addDisplayNone(waitForPay);
                        this.addDisplayNone(waitConfirmation);
                        this.removeDisplayNone(ratingTour);
                        this.addDisplayNone(allTour);
                        this.addDisplayNone(cancelTour);
                        this.addDisplayNone(waitVehicle);
                        navCancelTour.classList.remove('active');
                        //
                        this.gettingOrderByStatus('Hoàn thành');
                    } else if (code == 7) {
                        this.addDisplayNone(userInfo);
                        this.addDisplayNone(waitForPay);
                        this.addDisplayNone(waitConfirmation);
                        this.addDisplayNone(ratingTour);
                        this.addDisplayNone(allTour);
                        this.addDisplayNone(cancelTour);
                        this.removeDisplayNone(waitVehicle);
                        navCancelTour.classList.remove('active');
                        //
                        this.gettingOrderByStatus('Chờ đặt phương tiện');
                    } else {
                        this.addDisplayNone(userInfo);
                        this.addDisplayNone(waitForPay);
                        this.addDisplayNone(waitConfirmation);
                        this.addDisplayNone(ratingTour);
                        this.removeDisplayNone(allTour);
                        this.addDisplayNone(cancelTour);
                        this.addDisplayNone(waitVehicle);
                        navCancelTour.classList.remove('active');
                    }
                }
            }
        },
        addDisplayNone(elem) {
            elem.classList.add('d-none');
        },
        removeDisplayNone(elem) {
            elem.classList.remove('d-none');
        },
        setUserData() {
            const vm = this;
            vm.setUserDataUpdate(vm.userData);
        },
        addAvatar() {
            const divAvatar = document.getElementById('avt-user-image');
            divAvatar.click();
            // divAvatar.addEventListener('click', this.uploadImg.bind(this));
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
            this.setAvatarImg(urls[0].secure_url);
            return urls;
        },
        onUpdateInfoUser() {
            const vm = this;
            const dataUpdate = {
                id: vm.userDataUpdate.id ?? '',
                full_name: vm.userDataUpdate.full_name ?? '',
                email: vm.userDataUpdate.email ?? '',
                phone_number: vm.userDataUpdate.phone_number ?? '',
                province_id: vm.userDataUpdate.province_id ?? '',
                address: vm.userDataUpdate.address ?? '',
                gender: vm.userDataUpdate.gender ?? '',
                avatar_path: vm.userDataUpdate.avatar_path
            };
            vm.updateInfoUser(dataUpdate);
            //
            setTimeout(function () {
                vm.showModalMessage({
                    title: 'Lưu thành công',
                    type: MSG_TYPE.SUCCESS,
                    content: `Thông tin về người dùng này đã được cập nhật thành công!`,
                    okText: 'Đồng ý'
                });
            }, 300);
        },
        gettingOrderByStatus(status) {
            const conditions = {
                status: status,
                user_id: this.userData.id
            };
            this.getOrderByStatus(conditions);
        },
        convertDateTime(inputDateTime) {
            var dateTime = new Date(inputDateTime);

            var day = dateTime.getDate();
            var month = dateTime.getMonth() + 1;
            var year = dateTime.getFullYear();

            var formattedDate = `${day}/${month}/${year}`;

            return formattedDate;
        },
        formatCurrency(number) {
            let numStr = number.toString();

            let result = [];

            for (let i = numStr.length - 1, j = 0; i >= 0; i--, j++) {
                if (j > 0 && j % 3 === 0) {
                    result.unshift('.');
                }
                result.unshift(numStr[i]);
            }
            return result.join('');
        },
        showModalRating(title, id) {
            console.log(title, id);
            const dataSet = {
                title: title,
                tour_id: id,
                reviewerName: this.userData.full_name,
                reviewer: this.userData.id
            };
            this.setRatingData(dataSet);
        },
        saveRating() {
            const vm = this;
            const conditions = {
                tour_id: vm.ratingData.tour_id,
                reviewer: vm.ratingData.reviewer,
                star_count: vm.ratingData.star_count,
                message: vm.ratingData.message,
                status: vm.ratingData.status
            };
            vm.review(conditions);
        },
        cancelOrderTour(reservationId, title, payment_amount) {
            const vm = this;
            const data = {
                reservationID: reservationId,
                title: title,
                paymentAmount: `${vm.formatNumber(payment_amount)} đ`,
                cancellationReason: 'Lý do ...',
                refundAmount: 0,
                refundMethod: ''
            };
            vm.setRefundData(data);
        },
        formatNumber(number) {
            let numStr = number.toString();

            let result = [];

            for (let i = numStr.length - 1, j = 0; i >= 0; i--, j++) {
                if (j > 0 && j % 3 === 0) {
                    result.unshift('.');
                }
                result.unshift(numStr[i]);
            }
            return result.join('');
        },
        saveRefund() {
            const vm = this;
            const conditions = {
                reservationID: vm.refundData.reservationID,
                cancellationReason: vm.refundData.cancellationReason ?? '',
                refundAmount: vm.refundData.refundAmount ?? 0,
                refundMethod: vm.refundData.refundMethod ?? ''
            };
            vm.updateRefund(conditions);
        }
    }
};
export default Profile;
</script>
