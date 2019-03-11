<template>
    <div id="content">
        <!-- <elenavbar class="navbar-blog"></elenavbar> -->
        <nav class="main-navigation">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
      
                </div>
            </div>
        </div>
    </nav>
        <section class="content-wrap">
            <div  class="container">
              <div class="col-md-4 sidebar" >
                    <div v-for=" (blog,index) in topBlog" :key="index">
                    <el-card class="box-card">
                      <div slot="header" class="clearfix">
                        <span><span :class="'fd'+index"> TOP{{index+1}}:</span> {{blog.blogName}}</span>
                        <el-button class="card-btn" style="float: right; padding: 3px 0" type="text"  @click="bloginfo(blog.Id)">查看</el-button>
                      </div>
                      <div class="blog-classtag text item">
                        {{"分类："+blog.className}} <span class="read-nubmer">  {{"访问次数："+blog.accessNum}}</span>
                      </div>
                      <div class="blog-romoteip text item"> {{"主机地址："+blog.remoteIp}}</div>
                      <div class="blog-publishTime text item"> <i class="el-icon-time"></i> {{"发表时间："+blog.createtime}}</div>
                    </el-card>
                    </div>
              </div>



            <div class="col-md-8 main-content">
                <div class="group-input form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-6">
                        <input type="email" v-model="blogTitle" class="form-control" id="inputEmail3" placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group blog_tag">
                        <label for="inputEmail3" class="col-sm-2 control-label">分类</label>
                        <div class="col-sm-6">                           
                        <template>
                        <el-select v-model="classfies" placeholder="请选择分类" clearable >
                        <el-option
                            v-for="item in oclassfies"
                            :key="item.Id"
                            :label="item.class_name"
                            :value="item.Id"
                            >
                            
                        </el-option>
                        </el-select>
                    </template>
                        
                        </div>
                    </div>
                     <div class="form-group blog_tag">
                        <label for="inputEmail3" class="col-sm-2 control-label">标签</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" v-model="blogTag" id="inputEmail3" placeholder="多个标签可以用逗号隔开">
                        </div>
                    </div>
                    <div class="form-group editor">
                        <label for="editor" class="col-sm-2 control-label">内容</label>
                        <el-switch
                        style="margin_bottom:20px;"
                          v-model="editorFlag"
                          active-color="#13ce66"
                          inactive-color="#ff4949">
                        </el-switch>
                        <div class="col-sm-6">
                              <div id="editor">
                                    <mavon-editor  
                                    style="height: 100%" 
                                    v-model="blogContent"  
                                    :subfield="subfield"
                                    :code_style="code_style"
                                    :ishljs="true"
                                    :externalLink="externalLink"  ></mavon-editor>
                              </div>
                        <!-- <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> -->
                        </div>
                    </div>    
                                           
                </div>   

                                
                 <button  class="btn btn-success blog-submit" @click="bogSubmit">提交</button>        
            </div>     
           
            </div>
        </section>
        <div class="main">
        <!-- <div @click="openMask" style="font-size:200px">打开弹窗</div> -->
        <dialog-bar  v-model="sendVal" type="danger" v-bind:title="title" v-bind:content="content" v-on:cancel="clickCancel()" @danger="clickDanger()" @confirm="clickConfirm()" dangerText="Delete"></dialog-bar>
    </div>
    </div>
</template>
<script>
// 这是避免与mavon 中与highlight冲突优先使用highlight
import '../../css/common/highlight.css';
import { mavonEditor } from "mavon-editor";
import dialogBar from "../common/dialog";
import "mavon-editor/dist/css/index.css";
import elenavbar from "../common/ele-navbar";
import Vuex from "vuex";
var serverUrl = "http://localhost:8100/";
import base from "../../bootstrap/js/base.js";
import axios from "axios";
// alert(sessionStorage.getItem("token"))
export default {
  components: {
    elenavbar,
    mavonEditor,
    "dialog-bar": dialogBar
  },
  data() {
    return {
        subfield: true,
        code_style: 'solarized-dark',
        externalLink: {
            // markdown_css: function() {
            //     // 这是你的markdown css文件路径
            //     // return '/markdown/github-markdown.min.css';
            //     // return '../../css/common/highlight.css';
            // },
            // hljs_js: function() {
            //     // 这是你的hljs文件路径
            //     // return '/highlightjs/highlight.min.js';
            //     return '../../../static/js/highlightmin.js'
            // },
            hljs_css: function(css) {
                // 这是你的代码高亮配色文件路径
                // return '/highlightjs/styles/' + css + '.min.css';
                return '../../css/common/highlight.css';
            },
            // hljs_lang: function(lang) {
            //     // 这是你的代码高亮语言解析路径
            //     // return '/highlightjs/languages/' + lang + '.min.js';
            //     // return '../../../static/js/highlightmin.js'
            // },
            // katex_css: function() {
            //     // 这是你的katex配色方案路径路径
            //     // return '/katex/katex.min.css';
            //     // return '../../css/common/highlight.css';
            // },
            // katex_js: function() {
            //     // 这是你的katex.js路径
            //     // return '/katex/katex.min.js';
            //     // return  '../../../static/js/highlightmin.js'
            // },
        },
      classOptions: [],
      blogContent: "",
      blogTitle: "",
      blogTag: "",
      title: "标题",
      content: "提示内容",
      sendVal: false,
      classfies: null,
      oclassfies: [],
      topBlog:[],
      editorFlag: true,
    };
  },
  mounted() {
    this.getClassfies();
    this.getheight();
    this.getTopBlog();
  },
  
  methods: {
    bogSubmit: function() {
      var vm = this;
      if (this.blogContent && this.blogTitle && this.blogTag) {
        alert(this.classfies);
        this.$http
          .post(
            base.baseURL + "blog/createBlog/",
            {
              blogTitle: this.blogTitle,
              blogTag: this.blogTag,
              blogContent: this.blogContent,
              classfies: this.classfies,
              token: sessionStorage.getItem("token")
            },
            { "Content-Type": "application/json", Accept: "application/json" }
          )
          .then(function(res) {
            if (res.data.code == 200) {
              alert("login success");
              sessionStorage.setItem("username", vm.loginText.username);
              vm.$router.push({
                path: "/home"
              });
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
      } else {
        if (!this.blogTitle) {
          this.sendVal = true;
          this.title = "错误";
          this.content = "标题不能为空！";
        } else if (!this.blogTag) {
          this.sendVal = true;
          this.title = "错误";
          this.content = "标签不能为空！";
        } else if (!this.blogContent) {
          this.sendVal = true;
          this.title = "错误";
          this.content = "内容不能为空！";
        }
      }
      // alert(this.content);
    },
    bloginfo(index){
      this.$router.push({
        path:'/bloginfo',
        name:'bloginfo',
        // params:{
        //   id: index
        // }
        query:{
          id: index
        }
      })
    },
    getheight() {
      var height = window.innerHeight - 168;
      height = parseInt(height);
      $(".content-wrap").css("min-height", height);
      // this.tableheight = height;
    },
    submit: function() {
      var vm = this;
      // flag = false;
      // title="";
      // content="";
      if (this.loginText.username && this.loginText.password) {
        this.$http
          .post("api", {
            password: this.loginText.password,
            name: this.loginText.username
          })
          .then(function(res) {
            if (res.data.code == 200) {
              sessionStorage.setItem("username", vm.loginText.username);
              vm.$router.push({
                path: "/home"
              });
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
        // this.sendVal=flag;
        // this.title= title;
        // this.content = content;
      } else {
        this.sendVal = true;
        this.title = "错误";
        this.content = "用户名或者密码不能为空！";
      }
    },
    getTopBlog: function() {
      var vm = this;
      this.$http
        .post(
          base.baseURL + "blog/getTopBlog/",
          {
            token: sessionStorage.getItem("token")
          },
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          if (res.data.code == 200) {
            console.log(res.data.data);
            vm.topBlog = res.data.data;
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
    },
    // 获取下拉选择框的列表
    getClassfies: function() {
      var vm = this;
      this.$http
        .post(
          base.baseURL + "blog/getClassfies/",
          {
            token: sessionStorage.getItem("token")
          },
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          var flag = false;
          var a = 0;
          var oclassfies = [];
          if (res.data.code == 200) {
            var blogClassfies = res.data.data;
            for (var i = 0; i < blogClassfies.length; i++) {
              oclassfies.push({ id: "", class_name: "" });
              oclassfies[i].Id = blogClassfies[i].id;
              oclassfies[i].class_name = blogClassfies[i].class_name;
              console.log(oclassfies);
            }
            vm.oclassfies = oclassfies;
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
  $(".fa-mavon-arrows-alt").click(function (e) {
          $('.sidebar').css('display','true'); 
        });
</script>


<style>
.mavon-editor  {
  position: absolute;
  z-index: 10;
}
.sidebar .card-btn{
    color: var(--Colors8);
  }
  .sidebar .box-card{
    position: relative;
    width: 100%;
    margin-bottom: 5px;
  }
  .fd0{
    color:  #F56C6C;
  }
  .fd1{
    color: #E6A23C;
  }
  .fd2{
    color: #67C23A;
  }
  .fd3{
    color: #909399;
  }
  .fd1,.fd2,.fd3,.fd4,.fd0{
    font-weight:bold;
  }
  .clearfix  span{
    font-weight:bold;
  }
</style>

<style scoped>
@import "../../css/common/home.css";
#editor{
  margin-top:20px;
}
.read-nubmer{
  margin-left:20px;
}
.el-icon-rank {
  width: 16px;
  height: 16px;
  float: left;
  background: url(/static/imgs/date.png) 0% 0% / 100% no-repeat;
  margin: 10px 0px 10px 10px;
}
.blog-submit {
  float: left;
  margin-left: 120px;
}
.content-wrap,
.content-wrap {
  min-height: 100%;
}
.navbar-blog {
  margin-bottom: 0;
}
.main-navigation {
  z-index: 0;
}
#editor {
  /* margin: auto; */
  width: 100%;
  /* height: 580px; */
  /* margin-top: 5rem; */
  position: relative;
  margin-bottom: 0px;
  z-index: 0;
}

.main-content {
  background: var(--Colors7);
}
.blog_more {
  z-index: 0;
  /* clear: both;    */
  position: relative;
}
section {
  /* position: absolute; */
  position: relative;
  /* top: 57px; */
  z-index: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  padding-bottom: 33px;
}
body,
html {
  margin: 0px;
  height: 100%;
}
.col-sm-6 {
  width: 80%;
  padding: 0;
}
/* .blog_tag{
    z-index: 0;
    position: relative;
} */
.content {
  min-height: 100%;
}
.content-iot {
  background: var(--Colors7);
}

#footer {
  position: absolute !important;
}
.blog-classtag{
  color:var(--Colors10);
}
.blog-publishTime{
  color: var(--Colors11);
}
</style>
<style>
.text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
  }
  .sidebar el-button{
    color: var(--Colors8);
  }
</style>


