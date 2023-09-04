import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import vClickOutside from 'click-outside-vue3';
import BootstrapVueNext from 'bootstrap-vue-next';
import VueCookies from 'vue3-cookies';
import 'bootstrap-icons/font/bootstrap-icons.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';

const app = createApp(App);
app.use(vClickOutside);
app.use(BootstrapVueNext);
app.use(VueCookies, {
    expireTimes: '30d',
    path: '/'
});
app.use(store);
app.use(router);

app.mount('#app');
