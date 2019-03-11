import Vue from 'vue'
import VueRouter from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import login from '@/iotweb/login/login'
import main from '@/iotweb/common/navbar'
import '../bootstrap/js/bootstrap.min.js'
import '../bootstrap/css/bootstrap.min.css'
import home from '../iotweb/login/home.vue'
import user from '../iotweb/user/user.vue'
import sliders from '../iotweb/slider/sliders.vue'
import blogs from '../iotweb/blog/createblog.vue'
import bloglist from '../iotweb/blog/blogs.vue'
import navbar from "../iotweb/common/navbar"
import * as types from '../store/types'
import store from '../store/store'
import elenavbar from '../iotweb/common/ele-navbar.vue'
import elementnavbar from '../iotweb/common/element-navbar.vue'
import newlist from '../iotweb/news/newslist.vue'
import newinfo from '../iotweb/news/newinfo.vue'
import orient from '../iotweb/common/orent.vue'
import translate from '../iotweb/common/translate.vue'
import bloginfo from '../iotweb/blog/blogInfo.vue'
import dayVue from '../iotweb/day/day.vue'
import register from '../iotweb/login/register.vue'
Vue.use(VueRouter)

const routes = [{
        path: '/',
        name: 'HelloWorld',
        component: HelloWorld
    },
    {
        path: '/login',
        name: 'login',
        component: login
    },
    {
        path: '/register',
        name: 'register',
        component: register
    },
    {
        path: '/home',
        name: 'home',
        meta: {
            requireAuth: true,
        },
        component: home
    },
    {
        path: '/user',
        name: 'user',
        component: user
    },
    {
        path: '/translate',
        name: 'translate',
        component: translate
    },
    {
        path: '/elementnavbar',
        name: 'elementnavbar',
        component: elementnavbar,
        redirect: '/newinfo',
        children: [{
                path: '/newinfo',
                name: 'newinfo',
                component: orient,
                redirect: '/newinfo',
                children: [{
                    path: '/newinfo',
                    name: 'newinfo',
                    component: newinfo,
                }, {
                    path: '/newlist',
                    name: 'newlist',
                    component: newlist,
                }]
            }, {
                path: '/bloglist',
                name: 'bloglist',
                component: orient,
                redirect: '/bloglist',
                children: [{
                    path: '/bloglist',
                    name: 'bloglist',
                    component: bloglist,
                }, {
                    meta: {
                        requireAuth: true,
                    },
                    path: '/blogs',
                    name: 'blogs',
                    component: blogs,
                }]
            },
            {
                path: '/dayVue',
                name: 'dayVue',
                component: dayVue
            },
            {
                path: '/sliders',
                name: 'sliders',
                component: sliders
            },
        ]
    },
    {
        path: '/bloginfo',
        name: 'bloginfo',
        component: bloginfo
    }
];
const router = new VueRouter({
    routes
});

// 页面刷新时，重新赋值token
if (sessionStorage.getItem('token')) {
    store.commit(types.LOGIN, sessionStorage.getItem('token'))
}


router.beforeEach((to, from, next) => {
    if (to.matched.some(r => r.meta.requireAuth)) {
        if (store.state.token) {
            next();
        } else {
            next({
                path: '/login',
                query: { redirect: to.fullPath }
            })
        }
    } else {
        next();
    }
})
export default router;