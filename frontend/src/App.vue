<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <!-- <div id="test">
      测试
    </div>    -->
    <router-view></router-view>
   <v-footer></v-footer>
  </div>
</template>

<script>
import axios from '../src/store/http.js'
import * as types from './store/types.js'
import {mapState} from 'vuex'
import $ from 'jquery'
import header from './iotweb/common/ele-navbar'
// import header from './iotweb/common/headnar'
import footer from './iotweb/common/bootnar'
import base from "./bootstrap/js/base.js"
import elementnavbar from "./iotweb/common/element-navbar"
export default {
  name: 'App',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  mounted: function () {
    var test = $('#test').text()
    console.log(test)
  },
  components: {
    'v-header': header,
    'v-footer': footer
  }
}
$(function(){
  $("#test").click(function(){
    alert(1)
  })
})
</script>

<style>
/* @import "./css/common/nav.css"; */
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
  margin-top: 0px;
}

</style>
