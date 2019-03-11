import elementnavbar from '../common/element-navbar.vue'
import Vue from 'vue'
const elenav = {
    install:function(Vue){
        Vue.component("elenav",elementnavbar)
    }
}
export default elenav