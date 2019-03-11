<template>
    <div class="contentT">
        <v-header></v-header>
        <div class="contentTv">
              <div class="leftdiv">
            <div class="precontent">
         <h1>初始文本</h1>
            <el-input
            type="textarea"
            class="comments"
            :rows="9"
            placeholder="请输入内容"
            v-model="precontent">
            </el-input>



        </div>
        <div class="resultcontent">
         <h1>格式化后</h1>
         <el-input
            type="textarea"
            :rows="12"
            class="comments"
            placeholder="请输入内容"           
            v-model="recontent">
            </el-input>
        </div>
        </div>
        <div class="rightdiv"> 
         <div class="resultcontent">
         <h1>翻译后</h1>
         <el-input
            type="textarea"
            :rows="23"
            class="comments"
            id="txt"
            placeholder="请输入内容"
            style="height:expression((this.scrollHeight>150)?'150px':(this.scrollHeight+5)+'px');overflow:auto;"
            v-model="translateResult">
            </el-input>
        </div>
            <el-switch
            v-model="value2"
            active-color="#13ce66"
            active-text="初始翻译"
            inactive-text="转换后翻"
            inactive-color="#ff4949">
            </el-switch>
            <el-button type="info" :disabled="disRequire"  @click="getResult">开始翻译</el-button>
            <el-button type="danger" @click="copyText">复制结果</el-button>
        </div>
        </div>
            
    </div>
 
</template>
<script>
var baseURL = '/api';
import dialogBar from '../common/dialog'
import header from '../common/Theadnar'
export default {
    data(){
       return {
        precontent:"",
        recontent:"",
        translateResult:"",
        disRequire:false,
        value2:true,
       }
    },
      components:{
     'v-header': header,
     'dialog-bar': dialogBar,
  },
  mounted(){
  this.getheight();
  },
    methods:{
        getResult:function(){
            this.disRequire = true;
            var vm = this;
            var content = ""
           
            if(this.precontent){      
            if(vm.value2){
                    vm.recontent=this.precontent.replace(/[\r\n]/g," ");
                    content = vm.recontent
            }else{
                // vm.recontent=this.precontent;
                 content = vm.recontent
            }
            // this.$http.post(baseURL+"login/translate/", {
            this.$http.post("login/translate/", {
                       content: vm.recontent
                      })
          .then(function(res) {                  
            if (res.data.code == 200) {
              console.log(res.data.update)
            vm.translateResult = res.data.update
            }else if(res.data.code == 501 || res.data.code == 500){
                // alert("login failed")
                vm.sendVal=true;
            // flag = true;
           vm.title="错误";          
           vm.content = "<h2>翻译有误！<h2>";            
            }
          }
          ).catch(response => {
            console.log(response);
        });
      }else {
            this.sendVal = true;
            this.title="错误";
            this.content = "翻译内容不能为空！";

      }
        this.disRequire = false;
    },
    getheight() {
      var height = window.innerHeight - 142;
      height = parseInt(height);
      $(".contentTv").css("min-height", height);
      // this.tableheight = height;
    },
    copyText:function(){
      var text = document.getElementById("txt").innerText;
      var input = document.getElementById("txt");
      input.value = this.translateResult; // 修改文本框的内容
      input.select(); // 选中文本
      document.execCommand("copy"); // 执行浏览器复制命令
    }
    }
    
}
</script>
<style>
.comments {
     text-indent:2em;
}
textarea {
    text-indent: 2em;
    overflow: auto;
}
</style>

<style scoped>

.comments {
 width:100%;
 overflow:auto;
 word-break:break-all;
 text-indent:25px;
}
.leftdiv{
    width: 50%;
    padding-left: 10px;
    padding-right: 10px;
    float: left;
}
.rightdiv{
    width:50%;
    padding-left: 10px;
    padding-right: 10px;
    float: left;
}
::selection {
background:#999;
color:#EF434C;
}
.resultcontent,.precontent{
    margin: 10px;
}
</style>
