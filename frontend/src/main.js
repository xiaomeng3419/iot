// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import axios from 'axios'
import base from './bootstrap/js/base'
import store from './store/store'
import global_ from './bootstrap/js/base'
import elenav from './iotweb/js/elementNavbar'

import 'element-ui/lib/theme-chalk/index.css';
import './css/common/nav.css'

import hljs from '../static/js/highlightmin'

// var validator = require("vue-validator");
// Vue.use(validator);
Vue.use(elenav)
Vue.use(base)
Vue.use(global_)
Vue.config.productionTip = false
Vue.prototype.$http = axios
Vue.use(ElementUI);
Vue.prototype.GLOBAL = global_;
axios.defaults.baseURL = global_.BASE_URL;
/* eslint-disable no-new */

Vue.directive('highlight', function(el) {
    let blocks = el.querySelectorAll('pre code');
    blocks.forEach((block) => {
        hljs.highlightBlock(block)
    })
});
new Vue({
    el: '#app',
    router,
    // base,
    store,
    components: { App },
    template: '<App/>'
})