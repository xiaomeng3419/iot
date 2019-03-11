<template>
    <div class="registercontent">
        <v-header></v-header>
        <div class="register">
        <div class="col-sm-6 col-sm-offset-3 form-box">
   <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
  <el-form-item label="用户名" prop="username">
    <el-input v-model="ruleForm.username"></el-input>
  </el-form-item>
   <el-form-item label="学号" prop="stuno">
    <el-input v-model="ruleForm.stuno"></el-input>
  </el-form-item>
   <el-form-item label="联系方式" prop="phone">
    <el-input v-model="ruleForm.phone"></el-input>
  </el-form-item>
    <el-form-item label="邮箱" prop="email">
    <el-input v-model="ruleForm.email"></el-input>
  </el-form-item>
  <el-form-item label="设置密码" prop="password">
    <el-input v-model="ruleForm.password" id="password" type="password"></el-input>
  </el-form-item>
  <el-form-item label="确认密码" prop="checkpw">
    <el-input v-model="ruleForm.checkpw" type="password"></el-input>
  </el-form-item>
  <el-form-item label="选择班级" prop="classfies" >
    <el-select v-model="ruleForm.departmentcode" placeholder="班级选择" clearable>
          <el-option 
            v-for="item in departmentOptions"
            :key="item.departmentcode"
            :label="item.departmentname"
            :value="item.departmentcode"
            >
          </el-option>
    </el-select>
  </el-form-item>  
    <el-form-item label="选择性别" prop="sex">
    <el-select v-model="ruleForm.sex" placeholder="请选择性别">
      <el-option label="男" value="male"></el-option>
      <el-option label="女" value="females"></el-option>
    </el-select>
  </el-form-item>  
  <el-form-item>
    <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
    <el-button @click="resetForm('ruleForm')">重置</el-button>
  </el-form-item>
</el-form>
</div>
        </div>
        <div class="main">
        <!-- <div @click="openMask" style="font-size:200px">打开弹窗</div> -->
        <dialog-bar  v-model="sendVal" type="danger" v-bind:title="title" v-bind:content="content" v-on:cancel="clickCancel()" @danger="clickDanger()" @confirm="clickConfirm()" dangerText="Delete"></dialog-bar>
    </div>
    </div>
</template>
<script>
import header from "../common/headnar";
import base from "../../bootstrap/js/base.js";
import dialogBar from '../common/dialog'
export default {
  name: "register",
  components: {
    "v-header": header,
    'dialog-bar': dialogBar,
  },
  data() {
    return {      
        departmentOptions: [],
       title : "标题",
       content : "提示内容",
       imageCode:"",
       sendVal: false,
      ruleForm: {
        classfies: null,
        username:'',
        password:'',
        checkpw:'',
        email:'',
        sex:'',
        stuno:'',
        departmentcode:'',
        phone:'',       
      },
      rules: {
        username: [
          { required: true, message: "必填项", trigger: "blur" },
          { min: 2, max: 5, message: "长度在 2 到 5 个字符", trigger: "blur" }
        ],
        stuno: [
          { required: true, message: "必填项", trigger: "blur" },
          { min: 12, max: 12, message: "长度在 12个字符", trigger: "blur" }
        ],
        email: [
          { required: true, message: "必填项", trigger: "blur" },
          { min: 6, max: 20, message: "长度在 6 到 20 个字符", trigger: "blur" }
        ],
        phone: [
          { required: true, message: "必填项", trigger: "blur" },
          { min: 11, max: 11, message: "长度在 11 个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "必填项", trigger: "blur" },
          { min: 3, max: 5, message: "长度在 3 到 5 个字符", trigger: "blur" }
        ],
        checkpw: [
          { required: true, message: "必填项", trigger: "blur" },
           {validator: (rule, value, callback) => {
               var myreg = /^\S{8,}$/;
               if (value != this.ruleForm.password) {
                  callback(new Error("两次密码不一致"));
               } else {
                  callback();
               }
               }, trigger: 'blur,change'},
        ],
        departmentcode: [
          { required: true, message: "请选择", trigger: "change" }
        ],
         sex: [
          { required: true, message: "请选择", trigger: "change" }
        ],
      }
    };
  },
  mounted(){
      this.getheight();
      this.getdepartments();
  },
  methods: {
     getheight(){
        var height = window.innerHeight - 70;
        height = parseInt(height)
        $(".registercontent").css("height",height);                   
     },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
        var vm =this;
        this.$http.post( base.baseURL+"login/register/", {
                       password: this.ruleForm.password,
                       name: this.ruleForm.username,
                       email: this.ruleForm.email,
                       phone: this.ruleForm.phone,
                       departmentcode: this.ruleForm.departmentcode,
                       stuno: this.ruleForm.stuno,
                       sex: this.ruleForm.sex,
                      })
          .then(function(res) {                  
            if (res.data.code == 200) {            
              vm.$router.push({
                  path: '/login/', 
              });
            }else if(res.data.code == 201){
             vm.sendVal=true;
             vm.title="错误";          
             vm.content = "<h2>用户名已经被注册！<h2>";        
            }else if(res.data.code == 501 || res.data.code == 500){
             vm.sendVal=true;
             vm.title="错误";          
             vm.content = "<h2>注册信息错误！<h2>";            
            }
          }
          ).catch(response => {
            console.log(response);
        });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    // 获取下拉选择框的列表
    getdepartments: function() {
      var vm = this;
      this.$http
        .post(
          base.baseURL + "login/getdepartments/",          
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          var flag = false;
          var a = 0;
          var oclassfies = [];
          if (res.data.code == 200) {
            var blogClassfies = res.data.data;
            for (var i = 0; i < blogClassfies.length; i++) {
              oclassfies.push({ id: "", departmentname: "", departmentcode:""});
              oclassfies[i].id = blogClassfies[i].id;
              oclassfies[i].departmentname = blogClassfies[i].departmentname;
              oclassfies[i].departmentcode = blogClassfies[i].departmentcode;
              console.log(oclassfies);
            }
            vm.departmentOptions = oclassfies;
          } else if (res.data.code == 501 || res.data.code == 500) {
            // alert("login failed")
            vm.sendVal = true;
            // flag = true;
            vm.title = "错误";
            vm.content = "<h2>用户名或者密码不对！<h2>";
          }
        })
        .catch(response => {
          console.log(response);
        });
    }
  }
};
</script>

<style scoped>
@import "../../css/baseweb.css";
</style>

<style scoped>

.register {
  /* height: 800px;
  height: 100%; */
  margin-top:20px;
  background: #4e4e4e;
}
::selection {
background:var(--Colors6);
color:rgb(112, 44, 61);
}
.register .col-sm-6 {
  margin-top: 100px;
  height: auto;
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
</style>
