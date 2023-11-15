import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import vClickOutside from 'click-outside-vue3';
import BootstrapVueNext from 'bootstrap-vue-next';
import VueCookies from 'vue3-cookies';
import 'bootstrap-icons/font/bootstrap-icons.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';
//
import StarRating from 'vue-star-rating';
//
import ThuanInput from '@/components/thuanInput';
import ThuanTextarea from '@/components/thuanTextarea';
import ThuanSelect from '@/components/thuanSelect';
import ThuanButton from '@/components/thuanButton';
import ThuanDatePicker from '@/components/thuanDatePicker';
import ThuanBarChart from '@/components/thuanBarChart';
import ThuanPieChart from '@/components/thuanPieChart';

const app = createApp(App);
app.use(vClickOutside);
app.use(BootstrapVueNext);
app.use(VueCookies, {
    expireTimes: '30d',
    path: '/'
});
app.use(store);
app.use(router);

// rating component
app.component('StarRating', StarRating);
// mapping components
app.component('ThuanInput', ThuanInput);
app.component('ThuanTextarea', ThuanTextarea);
app.component('ThuanSelect', ThuanSelect);
app.component('ThuanButton', ThuanButton);
app.component('ThuanDatePicker', ThuanDatePicker);
app.component('ThuanBarChart', ThuanBarChart);
app.component('ThuanPieChart', ThuanPieChart);

app.mount('#app');
