<template>
<div class="login">
<v-header></v-header>
<div class="col-sm-6 col-sm-offset-3 form-box">
    <div class="form-top">
      <div class="form-top-left">
          <h3>Login to our site</h3>
          <p>Enter your username and password to log on:</p>
          <!-- <img onclick="this.setAttribute('src','http://localhost:8100/login/create_code_img/?random='+Math.random())" src="http://localhost:8100/login/create_code_img/create_code_img/?random='+Math.random())" title="点击重新获取" /> -->
          </div>
        <div class="form-top-right">
          <i class="fa fa-key"></i>
          </div>
    </div>
    <div id="checkcode">
      <!-- <img onclick="this.setAttribute('src','http://localhost:8100/login/create_code_img/?random='+Math.random())" :src="codeUri" title="点击重新获取" /> -->
    </div>
    <div class="form-bottom">
      <form  @submit.prevent="submit" class="login-form">
        <!-- {% csrf_token %} -->
        <div class="form-group">
          <label class="sr-only" for="form-username" >Username</label>
          <input v-model="loginText.username" type="text" name="form-username" placeholder="Username..." class="form-username form-control" id="form-username" value="admin">
          </div>
        <div class="form-group">
          <label class="sr-only" for="form-password">Password</label>
          <input v-model="loginText.password" type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
          </div>
            <div class="form-group">
          <label class="sr-only" for="form-password">Password</label>
          <input v-model="code" type="text" name="form-code" placeholder="checkcode" class="form-password form-control checkcode" id="form-password">
            <img @click="exchangeCode" class="imagecode" :src="codeUri" title="点击重新获取" />
          </div>
          <button type="submit" class="btn btn-warning login-warn" >Sign in!</button>
        </form>
      </div>
  </div>
<button type="submit" class="btn btn-secondary">
  Debug
</button>
<button type="button" class="btn btn-primary" @click="openMask('提示','<h1>内容测试</h1>')">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>

<div id="datezp" >
   <div class="block">
    <span class="demonstration">起始日期时刻为 12:00:00</span>
    <el-date-picker
      v-model="value6"
      type="datetimerange"
      format="yyyy-MM-dd" 
      value-format="yyyy-MM-dd"
      start-placeholder="开始日期"
      end-placeholder="结束日期"
      :default-time="['12:00:00']">
    </el-date-picker>
    <button type="button" class="btn btn-dark" @click="getDatelist">Dark</button>
  </div>


</div>
<div class="main">
        <!-- <div @click="openMask" style="font-size:200px">打开弹窗</div> -->
        <dialog-bar  v-model="sendVal" type="danger" v-bind:title="title" v-bind:content="content" v-on:cancel="clickCancel()" @danger="clickDanger()" @confirm="clickConfirm()" dangerText="Delete"></dialog-bar>
    </div>
  </div>
</template>
 
<script>
import {mapState} from 'vuex'
import dialogBar from '../common/dialog'
import Global from "../common/Global"
import base from "../../bootstrap/js/base.js"
import header from '../common/headnar'
import * as types from '../../store/types.js'
var url = Global.rootUrl
var baseURL = '/api';
var serverUrl = "http://localhost:8100/"
// alert(base.baseURL);  
export default {
  name: "login",
  data (){
     return{
       //用户名密码
       codeUri: serverUrl+"login/create_code_img/",
      //  codeUri: exchangeCode,
       title : "标题",
       content : "提示内容",
        value6: '',
       imageCode:"",
       code:"",
       sendVal: false,
        loginText: {
        username: "",
        password: ""
      }
     }
  },
    mounted(){
            // var vm = this;
            // this.$store.commit(types.LOGIN,'Login');
            this.exchangeCode();
            this.getheight();
            //  vm.getheight();
            // $(window).resize(function () {          //当浏览器大小变化时
            // vm.getheight();
            // })
        },
  components:{
     'v-header': header,
     'dialog-bar': dialogBar,
  },
  methods:{
    submit: function (){
      var vm =this;
      if(this.loginText.username&&this.loginText.password){      
        this.$http.post(baseURL+"login/login", {
                       password: this.loginText.password,
                       name: this.loginText.username,
                      })
          .then(function(res) {                  
            if (res.data.code == 200) {
              sessionStorage.setItem("username",vm.loginText.username);
              sessionStorage.setItem("token",res.data.data.token);    
              vm.$store.commit(types.LOGIN, res.data.data.token)
              console.log(sessionStorage.getItem("token"))
              console.log(res.data.data.token)
              // this.$store.commit.(types.LOGIN,this.token)  
              vm.$router.push({
                  path: '/home', 
              });
            }else if(res.data.code == 501 || res.data.code == 500){
                // alert("login failed")
                vm.sendVal=true;
            // flag = true;
           vm.title="错误";          
           vm.content = "<h2>用户名或者密码不对！<h2>";            
            }
          }
          ).catch(response => {
            console.log(response);
        });
      }else {
            this.sendVal = true;
            this.title="错误";
            this.content = "用户名或者密码不能为空！";

      }
    },
     getDate (datestr) {
        var temp = datestr.split("-");
        if (temp[1] === '01') {
            temp[0] = parseInt(temp[0],10) - 1;
            temp[1] = '12';
        } else {
            temp[1] = parseInt(temp[1],10) - 1;
        }
        //new Date()的月份入参实际都是当前值-1
        var date = new Date(temp[0], temp[1], temp[2]);
        return date;
    },
    getDiffDate (start, end) {
        var startTime = this.getDate(start);
        var endTime = this.getDate(end);
        var dateArr = [];
        while ((endTime.getTime() - startTime.getTime()) > 0) {
            var year = startTime.getFullYear();
            var month = startTime.getMonth().toString().length === 1 &&  startTime.getMonth() <9? "0" + (parseInt(startTime.getMonth().toString(),10) + 1) : (startTime.getMonth() + 1);
            var day = startTime.getDate().toString().length === 1 ? "0" + startTime.getDate() : startTime.getDate();
            dateArr.push(year + "" + month + "" + day);
            startTime.setDate(startTime.getDate() + 1);
        }
        console.log(dateArr)
        return dateArr;
    },
    getDatelist(){
        alert("计算时间间隔"+this.value6)
        console.log(this.value6[0])
        console.log(this.value6[1])
        this.getDiffDate(this.value6[0],this.value6[1])
    },
   
   
    getheight(){
                var height = window.innerHeight - 70;
                height = parseInt(height)
                    $(".login").css("height",height);                   
                    // this.tableheight = height;
                },
     exchangeCode: function() {
                this.codeUri = this.chgUrl(serverUrl+"login/create_code_img/");                           
            },
            //获取验证码
            chgUrl: function(url) {
                var timestamp = (new Date()).valueOf();
                // url = url.substring(0, 23);
                if ((url.indexOf("&") >= 0)) {
                    url = url + "×tamp=" + timestamp;
                } else {
                    url = url + "?timestamp=" + timestamp;
                }
                this.imageCode = timestamp;
                return url;
            },
    openMask(title,content){
      // alert("2344");
            this.sendVal = true;
            this.title=title;
            this.content = content;
        },       
        clickCancel(){
            console.log('点击了取消');
        },
        clickDanger(){
            console.log('这里是danger回调')
        },
        clickConfirm(){
            console.log('点击了confirm');
        }

}
};

</script>


<style scoped>
@import "../../css/baseweb.css";
</style>
<style scoped>
#datezp{
   background: #000000;
}
.checkcode{
  width: 60%;
}
.imagecode{
     width: 19%;
    /* float: left; */
    position: absolute;
    bottom: 21%;
    left: 70%;
}
.form-top-right {
    float: left;
    width: 25%;
    padding-top: 5px;
    font-size: 66px;
    color: #ddd;
    line-height: 100px;
    text-align: right;
}
.login {
  /* height: 800px;
  height: 100%; */
  background: #4e4e4e;
}
::selection {
background:var(--Colors6);
color:#2C3E70;
}
.login .col-sm-6 {
  margin-top: 100px;
  height: auto;
}
.login-div {
  width: 200px;
  height: 300px;
}
.form-top-right {
    float: left;
    width: 25%;
    padding-top: 5px;
    font-size: 66px;
    color: #ddd;
    line-height: 100px;
    text-align: right;
}

</style>
<style scoped>
.content {
  padding: 0px;
  margin-top: 0px;
  background: #505050;
  width: 100%;
  height: 70px;
  position: relative;
}
.login-warn{
  width:100%;
}
#login_title {
  float: left;
  position: absolute;
  top: 7px;
  left: 60px;
  bottom: 0;
  right: 0;
}
#iot_login_title {
  /* font: 60m sans-serif; */
  font-size: 40px;
  text-align: left;
  float: left;
  margin: 0px;
  padding: 0px;
}
#login_but,
#register_but {
  text-align: right;
  margin-right: 0px;
  /* color:#EF434C; */
  color: var(--Colors1);
  position: absolute;
  padding-top: 25px;
  font-size: 20px;
}
#login_but {
  margin-left: 29%;
}
#register_but {
  margin-left: 33%;
}
.form-top {
  overflow: hidden;
  padding: 0 25px 15px 25px;
  background: #fff;
  -moz-border-radius: 4px 4px 0 0;
  -webkit-border-radius: 4px 4px 0 0;
  border-radius: 4px 4px 0 0;
  text-align: left;
}
.col-lg-1,
.col-lg-10,
.col-lg-11,
.col-lg-12,
.col-lg-2,
.col-lg-3,
.col-lg-4,
.col-lg-5,
.col-lg-6,
.col-lg-7,
.col-lg-8,
.col-lg-9,
.col-md-1,
.col-md-10,
.col-md-11,
.col-md-12,
.col-md-2,
.col-md-3,
.col-md-4,
.col-md-5,
.col-md-6,
.col-md-7,
.col-md-8,
.col-md-9,
.col-sm-1,
.col-sm-10,
.col-sm-11,
.col-sm-12,
.col-sm-2,
.col-sm-3,
.col-sm-4,
.col-sm-5,
.col-sm-6,
.col-sm-7,
.col-sm-8,
.col-sm-9,
.col-xs-1,
.col-xs-10,
.col-xs-11,
.col-xs-12,
.col-xs-2,
.col-xs-3,
.col-xs-4,
.col-xs-5,
.col-xs-6,
.col-xs-7,
.col-xs-8,
.col-xs-9 {
  position: relative;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}
.form-bottom {
  padding: 25px 25px 30px 25px;
  background: #eee;
  -moz-border-radius: 0 0 4px 4px;
  -webkit-border-radius: 0 0 4px 4px;
  border-radius: 0 0 4px 4px;
  text-align: left;
}
input[type="text"], input[type="password"], textarea, textarea.form-control {
    height: 50px;
    margin: 0;
    padding: 0 20px;
    vertical-align: middle;
    background: #f8f8f8;
    border: 3px solid #ddd;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 50px;
    color: #888;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    -o-transition: all .3s;
    -moz-transition: all .3s;
    -webkit-transition: all .3s;
    -ms-transition: all .3s;
    transition: all .3s;
}
img{
 
}
</style>
