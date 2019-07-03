import Vue from 'vue/dist/vue.esm'

// Axios
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)

// Websocket
import ActionCableVue from 'actioncable-vue';
Vue.use(ActionCableVue, {
  debug: true,
  debugLevel: 'error',
  connectionUrl: 'http://127.0.0.1:3000/websocket'
});

// Moment
import moment from 'moment'
moment.defaultFormat = 'YYYY-MM-DD HH:mm'
Vue.prototype.$moment = moment

// lib
import errorHandle from '../packs/lib/errorHandle'
Vue.prototype.$errorHandle = errorHandle

// Quasar
import { Quasar } from 'quasar'
import quasarConf from './quasar'
Vue.use(Quasar, quasarConf)

Vue.config.productionTip = false
// import router from './router'

// App
import App from '../App.vue'

/* eslint-disable no-new */
new Vue({
  components: { App },
  // router,
  template: '<App/>',
}).$mount('#app')
