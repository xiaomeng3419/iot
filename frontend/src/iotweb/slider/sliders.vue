<template>
<div class="container">
   <div class="col-md-4">
     <el-card class="box-card">
                      <div slot="header" class="clearfix">
                        <span><span class="'fd'+index"> TOP1:</span> xxx</span>
                        <el-button class="card-btn" style="float: right; padding: 3px 0" type="text"  >查看</el-button>
                      </div>
                      <div class="blog-classtag text item">
                        {{"分类："}} <span class="read-nubmer">  {{"访问次数："}}</span>
                      </div>
                      <div class="blog-romoteip text item"> {{"主机地址："}}</div>
                      <div class="blog-publishTime text item"> <i class="el-icon-time"></i> {{"发表时间："}}</div>
                    </el-card>
   </div>
  <div class="excel_pub col-md-8">
     <el-tabs v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>

    <el-tab-pane label="配置管理" name="second">
      <div class="pubexc">
          <!-- <el-form id="formid" name="myform" method='post' type="file" enctype="multipart/form-data" :action='fileurl' class="demo-ruleForm">
            <el-form-item label="公告" prop="name" style="width:100%">
                <el-input v-model="execontent"></el-input>
              </el-form-item>

            <div class="popup-group" >
            <div class="col-20"><label>文件上传</label></div>
            <div >
              <el-input type="text" :value="file" class="file" placeholder="选择文件" readonly></el-input>
              <span class="file file-btn">选择文件</span>
              <input type="file" name="file" id="file" @change="getFileName">           
            </div>
   </div>
   <el-button class="btn-submit" @click="subFile">
          提交
   </el-button>
     </el-form> -->
<br>
     <el-form  ref="ruleForm" label-width="100px" class="demo-ruleForm" id="formid" name="myform" method='post' type="file" enctype="multipart/form-data" :action='fileurl'>
  <el-form-item label="公告内容" prop="name">
    <el-input name="execontent" v-model="execontent"></el-input>
  </el-form-item>

  <el-form-item label="文件上传" prop="region">
      <div class="popup-group" >
                  <!-- <div class="lable-file"><label>文件上传</label></div> -->
                  <div >
                    <el-input type="text" :value="file" class="file" placeholder="选择文件" readonly></el-input>
                    <span class="file file-btn">选择文件</span>
                    <input type="file" name="file" id="file" @change="getFileName">           
                  </div>
        </div> 
  </el-form-item>        
  <el-form-item label="截止时间" required>
    <el-col :span="11">
      <el-form-item prop="date1">
        <el-date-picker type="date" placeholder="选择日期" v-model="date1" name="date1" style="width: 100%;"></el-date-picker>
      </el-form-item>
    </el-col>
    <el-col class="line" :span="2">-</el-col>
    <el-col :span="11">
      <el-form-item prop="date2">
        <el-time-picker type="fixed-time" placeholder="选择时间" v-model="date2" name="date2" style="width: 100%;"></el-time-picker>
      </el-form-item>
    </el-col>
  </el-form-item>

  <el-form-item label="是否推送" prop="delivery">
    <el-switch v-model="ispush" name="push" off-value="1" on-value="2"></el-switch>
  </el-form-item>  
  <el-form-item>
    <el-button type="primary" @click="subFile">立即创建</el-button>
    <el-button @click="resetForm('ruleForm')">重置</el-button>
  </el-form-item>
</el-form>
      </div>


    </el-tab-pane>
    <el-tab-pane label="配置任务管理" name="third">配置任务管理</el-tab-pane>
    <el-tab-pane label="审核务补偿" name="fourth">审核务补偿</el-tab-pane>
  </el-tabs>
  </div>
 <div class="slider-content">
      <div id="editor">
    <!-- <input id="upload" type="file" @change="importfxx(this)"  accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" /> -->
   
    <!-- <el-upload
      class="upload-demo"
      action="http://localhost:8100/day/upload/"
      :on-preview="handlePreview"
      :on-remove="handleRemove"
      :before-remove="beforeRemove"
      multiple
      :limit="3"
      :on-exceed="handleExceed"
      :file-list="fileList">
      <el-button size="small" type="primary">点击上传</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
    </el-upload> -->
  </div>
 </div>
 </div>
</template>
<script>
import { mavonEditor } from "mavon-editor";
import "mavon-editor/dist/css/index.css";
import $ from "jquery";
import "../../../static/jquery.form.js";
import base from "../../bootstrap/js/base.js";
export default {
  data() {
    return {
      execontent:'',
      fileList: [],
      file: "",
      fileurl: "",
      date1: '',
      date2: '',
      ispush:true,
      activeName: "second",
      ruleForm: {
          name: '',
          region: '',
          date1: '',
          date2: '',
          delivery: false,
          type: [],
        },
        rules: {
          name: [
            { required: true, message: '请输入活动名称', trigger: 'blur' },
            { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
          ],      
          date1: [
            { type: 'date', required: true, message: '请选择日期', trigger: 'change' }
          ],
          date2: [
            { type: 'date', required: true, message: '请选择时间', trigger: 'change' }
          ],         
        },
    };
  },
  name: "editor",
  components: {
    mavonEditor
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    },
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePreview(file) {
      console.log(file);
    },
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 3 个文件，本次选择了 ${
          files.length
        } 个文件，共选择了 ${files.length + fileList.length} 个文件`
      );
    },
    beforeRemove(file, fileList) {
      return this.$confirm(`确定移除 ${file.name}？`);
    },
    subFile: function() {
      // base.baseURL + "blog/getClassfies/",
      this.fileurl = base.baseURL + "day/upload/"+ "?token=" + sessionStorage.getItem("token");
      //提交
      // if (this.validateValue1() == 0) {
      // this.loading1 = true;
      $("#formid").ajaxSubmit(
        function(message) {
          if (message.code == 200) {
            this.$message({
              showClose: true,
              message: "上传成功",
              type: "success"
            });
            this.search();
            this.close();
            this.loading1 = false;
          } else {
            this.$message({
              showClose: true,
              message: message.msg,
              type: "warning"
            });
            this.loading1 = false;
          }
        }.bind(this)
      );
      // }
      // return false;
    },
    resetForm(formName) {
        // this.$refs[formName].resetFields();
        this.execontent='',
        this.data1='',
        this.data2=''
      },
    getFileName: function() {
      //获取上传文件名称
      var o = document.getElementById("file");
      var fileSize = 0;
      var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
      if (isIE && !o.files) {
        var filePath = o.value;
        var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
        var file = fileSystem.GetFile(filePath);
        fileSize = file.Size;
      } else {
        fileSize = o.files[0].size;
      }
      fileSize = Math.round(fileSize / 1024 / 1024 * 100) / 100; //单位为KB
      if (fileSize >= 300) {
        this.$message({
          showClose: true,
          message: "文件最大尺寸为300MB，请选择合适尺寸文件",
          type: "warning"
        });
        return false;
      }
      this.file =
        o.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi, "$1") +
        "." +
        o.value.replace(/.+\./, "");
    },

    importfxx(obj) {
      let _this = this;
      let inputDOM = this.$refs.inputer;
      // 通过DOM取文件数据
      this.file = event.currentTarget.files[0];
      var rABS = false; //是否将文件读取为二进制字符串
      var f = this.file;
      var reader = new FileReader();
      //if (!FileReader.prototype.readAsBinaryString) {
      FileReader.prototype.readAsBinaryString = function(f) {
        var binary = "";
        var rABS = false; //是否将文件读取为二进制字符串
        var pt = this;
        var wb; //读取完成的数据
        var outdata;
        var reader = new FileReader();
        reader.onload = function(e) {
          var bytes = new Uint8Array(reader.result);
          var length = bytes.byteLength;
          for (var i = 0; i < length; i++) {
            binary += String.fromCharCode(bytes[i]);
          }
          var XLSX = require("xlsx");
          if (rABS) {
            wb = XLSX.read(btoa(fixdata(binary)), {
              //手动转化
              type: "base64"
            });
          } else {
            wb = XLSX.read(binary, {
              type: "binary"
            });
          }
          outdata = XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]]); //outdata就是你想要的东西
          console.log(outdata);
        };
        reader.readAsArrayBuffer(f);
      };
      if (rABS) {
        reader.readAsArrayBuffer(f);
      } else {
        reader.readAsBinaryString(f);
      }
    }
  }
};
</script>
<style>
.container {
  margin: 20px 0;
}
.el-input__inner {
  /* width: 235px; */
  height: 37px;
}
.el-upload__input {
  display: none !important;
}
.slider-content {
  width: 100px;
}
#editor {
  margin: auto;
  width: 100%;
  /* height: 580px; */
  /* margin-top: 5rem; */
  position: position;
  margin-bottom: 100px;
  z-index: 0;
}
</style>
<style scoped>
.popup-group .urlFile {
  position: relative;
}
.popup-group input[name="file"] {
  padding: 5px 8px;
  width: 100%;
  border: 1px solid#e6e6e6;
  outline: none;
  
  font-size: 14px;
}
.col-80 {
  float: left;
  width: 200px;
}
.popup-group .file {
  position: absolute;
}
.popup-group input[name="file"] {
  width: 100%; 
  opacity: 0;
}
input {
  box-shadow: none;
}
.popup-group .file-btn {
  width: 36%;
  height: 40px;
  margin-left: 64%;
  line-height: 36px;
  font-size: 14px;
  text-align: center;
  border: 1px solid #e6e6e6;
  color: #4990ee;
  background: #e8f1fc;
}
input[type="file" i] {
  align-items: baseline;
  color: inherit;
  text-align: start;
}
</style>
