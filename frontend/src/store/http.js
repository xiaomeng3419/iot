/**
 * Created by xiaomeng on 07/06/18.
 * http配置
 */

import axios from 'axios'
import store from './store'
import * as types from './types'
import router from '../router/index'
import Vue from 'vue'
// axios 配置
axios.defaults.timeout = 5000;
// axios.defaults.baseURL = 'https://api.github.com';
axios.defaults.baseURL = 'http://127.0.0.1:8100/';
axios.defaults.headers.post['Content-Type'] = 'application/json';
// http request 拦截器
Vue.prototype.elealert = function (str) {
    alert(str)
};
axios.interceptors.request.use(
    config => {
        if (store.state.token) {
            config.headers.Authorization = `token ${store.state.token}`;
        }
        return config;
    },
    err => {
        return Promise.reject(err);
    });
// http response 拦截器
axios.interceptors.response.use(
    response => {
        console.log(response)

        return response;
    },
    error => {
        if (error.response) {
            switch (error.response.status) {
                case 401:
                    Vue.prototype.elealert("请登录")
                    // 401 清除token信息并跳转到登录页面
                    store.commit(types.LOGOUT);
                    router.currentRoute.path !== 'login' &&
                        router.replace({
                            path: 'login',
                            query: { redirect: router.currentRoute.path },
                        })
            }
        }
        // console.log(JSON.stringify(error));//console : Error: Request failed with status code 402
        return Promise.reject(error.response.data)
    });

export default axios;
