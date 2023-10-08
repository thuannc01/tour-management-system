<script>
import { mapActions, mapMutations, mapState } from 'vuex';
import store from '@/store';
import ProfileStore from '@/views/user/profile/store';
import label from './label';

import template from './template.html';
import './style.scss';

var Profile = {
    template: template,
    components: {},
    beforeCreate() {
        if (!store.hasModule('ProfileStore')) {
            store.registerModule('ProfileStore', ProfileStore);
        }
    },
    created() {},
    mounted() {},
    watch: {},
    data() {
        return {
            label: label
        };
    },
    computed: {
        // app
        // module
        ...mapState('ProfileStore', [''])
    },
    methods: {
        // app
        ...mapActions('app', []),
        ...mapMutations('app', ['showHeaderError', 'showModalMessage']),
        // module
        ...mapActions('', ['']),
        handelNavSidebar(code) {
            const userInfo = document.getElementById('user-info');
            const waitForPay = document.getElementById('wait-for-pay');
            const waitConfirmation =
                document.getElementById('wait-confirmation');
            const ratingTour = document.getElementById('rating-tour');
            const allTour = document.getElementById('all-tour');
            //
            const navUserInfo = document.getElementById('nav-user-info');
            const navHistoryTour = document.getElementById('nav-history-tour');

            if (code == 1) {
                this.removeDisplayNone(userInfo);
                this.addDisplayNone(waitForPay);
                this.addDisplayNone(waitConfirmation);
                this.addDisplayNone(ratingTour);
                this.addDisplayNone(allTour);
                navUserInfo.classList.add('active');
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
                } else if (code == 3) {
                    this.addDisplayNone(userInfo);
                    this.addDisplayNone(waitForPay);
                    this.removeDisplayNone(waitConfirmation);
                    this.addDisplayNone(ratingTour);
                    this.addDisplayNone(allTour);
                } else if (code == 4) {
                    this.addDisplayNone(userInfo);
                    this.addDisplayNone(waitForPay);
                    this.addDisplayNone(waitConfirmation);
                    this.removeDisplayNone(ratingTour);
                    this.addDisplayNone(allTour);
                } else {
                    this.addDisplayNone(userInfo);
                    this.addDisplayNone(waitForPay);
                    this.addDisplayNone(waitConfirmation);
                    this.addDisplayNone(ratingTour);
                    this.removeDisplayNone(allTour);
                }
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
export default Profile;
</script>
