<template>
    <div class="content-day">
        <el-row :gutter="20">
               <el-col :span="2"><div class="grid-content bg-purple"></div></el-col>
               <el-col :span="6">
                  <!-- mytest 777 -->
                  <!-- <div class="train-popup" v-show="show">
      <div class="train-close-popup "><i class="el-icon-circle-close" @click='closePop'></i></div> -->
             <div class="train-pop-course" id="willesPlay" v-loading.body="loading1" element-loading-text="拼命加载中">
          <div class="playContent" @click="start">
            <video :src="srcMP4" id="playVideo" @canplaythrough="canPlay"
                   @loadedmetadata="initControl" @timeupdate="timeUpdate" @ended="endPlay">
              <source src="" type="video/mp4"/>
            </video>
             
            <div class="playTip"></div>
            <div class="playStart" style="width:0;height:0;position:absolute;top:50%;left:50%;margin-left:-8px;margin-top:-19px;border-top:20px solid transparent;border-left:28px solid white;border-bottom:20px solid transparent;"></div>
          </div>
          <div class="playControll">
            <div class="playPause playIcon" @click='start'></div>
            <div class="timebar">
              <span class="currentTime">0:00:00</span>
              <div class="progress">
                <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuemin="0"
                     aria-valuemax="100" style="width: 0%"></div>
              </div>
              <span class="duration">0:00:00</span>
            </div>
            <div class="otherControl">
              <span class="volume" @click="volume"></span>
              <span class="fullScreen" @click="fullscreen"></span>
              <div class="volumeBar" @click="volumeControl">
                <div class="volumewrap">
                  <div class="progress">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuemin="0"
                         aria-valuemax="100" style="width: 8px;height: 40%;"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
             <!-- </div> -->
          <!-- -->
          
        </div>
            <!-- <div class="videoplay">
                        <div class="block-content" @click="openCour()">
                          <div style="display: none;padding:10px" class="train-back-intro">视频</div>
                          <img src='../../css/images/video.jpg'>
            </div> 
                  </div>-->
                   <div class="grid-content bg-purple">
                   
                   <el-card class="box-card">
                      <div slot="header" class="clearfix">
                        <span><span class="fd"><i class="el-icon-date"></i>今日签到</span></span>
                        <el-button class="card-btn" style="float: right; padding: 3px 0" type="text"  @click="bloginfo(blog.Id)">查看</el-button>
                      </div>
                      <div class="day-classtag text item">
                       <el-button type="info" class="write-in" @click="daypunch"><i class="el-icon-edit"></i>签到</el-button>
                      </div>      
                      <div class="my-day text item">
                          <span><span class="fd">我的签到(30天)</span></span>
                          <el-progress class="my-pro" :text-inside="true" :stroke-width="18" :percentage="rankScore" color="rgba(142, 113, 199, 0.7)"></el-progress>
                      </div> 

                    </el-card>

                    <el-card class="box-card dayorder">
                      <div slot="header" class="clearfix">
                        <span><span class="fd"><i class="el-icon-tickets"></i> 排名</span></span>
                        <el-button class="card-btn" style="float: right; padding: 3px 0" type="text"  @click="bloginfo(blog.Id)">查看</el-button>
                      </div>
                      <div class="day-rank text item">
                       <div class="rankitem"                       
                          v-for=" (item,index) in rankData" :key="index">
                        <div class="rank-item">
                           <span><span :class="'fd'+index"> TOP{{index+1}}:</span> {{item.username }}</span>
                           <!-- <span style="margin-left: 10px" class="new-title">{{"TOP"+ item.username }}</span> --> 

                           <span v-if="index === 0"><el-progress  :percentage="item.rankScore" color="#F56C6C"></el-progress></span>
                           <span v-else-if="index < 2 && index > 0"><el-progress  :percentage="item.rankScore" color="#E6A23C"></el-progress></span>
                           <span v-else> <el-progress  :percentage="item.rankScore"  color="#909399"></el-progress></span>
                        </div>
                       </div>
                      </div>                        
                    </el-card>
                   </div></el-col>
        <el-col :span="1"><div class="grid-content bg-purple"></div></el-col>
        <el-col :span="13"><div class="grid-content bg-purple">
             <div class="myday-table">
                 <span class="aynewlist">   签到表</span>

                    <el-table
                  :data="punchData"
                  style="width: 100%">
                  <el-table-column
                    label="日期"
                    width="142">
                    <template slot-scope="scope">
                      <i class="el-icon-time"></i>
                      <span class="ec-publishtime" style="margin-left: 10px;">{{ scope.row.dayTime }}</span>
                    </template>
                  </el-table-column>                
                  <el-table-column
                    label="起始时间"
                    width="200">
                    <template slot-scope="scope">
                      <el-popover trigger="hover" placement="top">
                        <p>{{ scope.row.dayTime }}</p>
                       <div slot="reference" class="name-wrapper">
                      <span style="margin-left: 10px" class="new-title">{{ scope.row.firstTime }}</span>
                       </div>
                      </el-popover>
                    </template>
                  </el-table-column>                  
                     <el-table-column
                    label="结束时间"
                    width="200">
                    <template slot-scope="scope">
                      <span style="margin-left: 10px">{{ scope.row.lastTime }}</span>
                    </template>
                  </el-table-column>
                  </el-table-column>                  
                     <el-table-column
                    label="当天时间"
                    width="100">
                    <template slot-scope="scope">
                      <span style="margin-left: 10px">{{ scope.row.seconds }}</span>
                    </template>
                  </el-table-column>
                   </el-table-column>                  
                     <el-table-column
                    label="地址"
                    width="100">
                    <template slot-scope="scope">
                      <span style="margin-left: 10px">{{ scope.row.remoteIp }}</span>
                    </template>
                  </el-table-column>
              </el-table>

             </div>
             <div class="day-news">
              <span class="aynewlist">   今日要闻</span>

                 <el-table
                  :data="tableData"
                  style="width: 100%">
                  <el-table-column
                    label="发布时间"
                    width="192">
                    <template slot-scope="scope">
                      <i class="el-icon-time"></i>
                      <span class="ec-publishtime" style="margin-left: 10px;">{{ scope.row.publishTime }}</span>
                    </template>
                  </el-table-column>
                  <el-table-column
                    label="标题"
                    width="360">
                    <template slot-scope="scope">
                      <el-popover trigger="hover" placement="top">
                        <p>标题: {{ scope.row.title }}</p>
                       <div slot="reference" class="name-wrapper">
                      <span style="margin-left: 10px" class="new-title">{{ scope.row.title }}</span>
                       </div>
                      </el-popover>
                    </template>
                  </el-table-column>
                  <el-table-column
                    label="作者"
                    width="180">
                    <template slot-scope="scope">
                      <el-popover trigger="hover" placement="top">
                        <p>姓名: {{ scope.row.author }}</p>
                        <p>住址: {{ scope.row.address }}</p>
                        <div slot="reference" class="name-wrapper">
                          <el-tag size="medium">{{ scope.row.author }}</el-tag>
                        </div>
                      </el-popover>
                    </template>
                  </el-table-column>
                     <el-table-column
                    label="评论数"
                    width="100">
                    <template slot-scope="scope">
                      <span style="margin-left: 10px">{{ scope.row.num }}</span>
                    </template>
                  </el-table-column>
                  <el-table-column label="操作">
                    <template slot-scope="scope">
                      <el-button
                        size="mini"
                        @click="handleEdit(scope.$index, scope.row)">查看</el-button>
                      <el-button
                        size="mini"
                        type="danger"
                        @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                    </template>
                  </el-table-column>
              </el-table>
              <el-pagination
                class="news-pagination"
                :current-page="pageNow"
                :page-size="pageSize"
                :pager-count="pageCount"
                layout="total, sizes,prev, pager, next,jumper"
                :total="total"
                @size-change="pageSizeChange"
                @current-change="pageCurrentChange1">
              </el-pagination>
             </div>
            </div>
            </el-col>
        <el-col :span="2"><div class="grid-content bg-purple"></div></el-col>
        </el-row>
        <div class="main">
        <!-- <div @click="openMask" style="font-size:200px">打开弹窗</div> -->
        <dialog-bar  v-model="sendVal" type="danger" v-bind:title="title" v-bind:content="content" v-on:cancel="clickCancel()" @danger="clickDanger()" @confirm="clickConfirm()" dangerText="Delete"></dialog-bar>
    </div>
    </div>
</template>

<script>
import {willPlay} from '../js/willesPlay.js'
import dialogBar from '../common/dialog'
import '../../css/willesPlay.css'
import base from "../../bootstrap/js/base.js";
export default {
    data() {
      return {
                  videoSrc:'http://localhost:8100/zpSpider/getStream/',
            videoImg:'http://static.fdc.com.cn/avatar/usercenter/5996999fa093c04d4b4dbaf1_162.jpg',
          title : "标题",
       content : "提示内容",
         sendVal: false,
        tableData: [],
        srcMP4:"http://localhost:8100/zpSpider/getStream/",
          show: false,
            loading1: false,
        pageCount:0,
        pageSize:10,
        pageNow:1,
        total:0,
        type: '基金',
        rankScore:0,
        rankData:[],
        punchData:[],
      }
    },
    mounted(){
      this.getNews();
      this.getRankScore();
      this.getRankData();
      this.getPunchData();
    },
      components:{
     'dialog-bar': dialogBar,
  },
    methods: {
      handleEdit(index, row) {
        console.log(index, row);
      },
      closePop: function () {
        this.show = false;

        if (this.stype == '0') {
          $('video').pause();
          this.loading1 = false;
          $('.playPause').addClass('playIcon');
          $('.playTip').removeClass('iconPause').addClass('iconPlay').fadeIn();
          $('.playStart').removeClass('iconPause').addClass('iconPlay').fadeIn();
        }
      },
      handleDelete(index, row) {
        console.log(index, row);
      },   
      pageCurrentChange1(val) {
          this.pageNow = val;
          // this.loadingTrAce = true;
          this.getNews();
      },
      pageSizeChange(val) {
          this.pageSize = val;
          // this.loadingTrAce = true;
          this.getNews();
      },
      getRankScore(){
      var vm = this;
      this.$http
        .post(
          base.baseURL + "day/getRankScore/",
          {
            token: sessionStorage.getItem("token")
          },
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          if (res.data.code == 200) {
            console.log(res.data);
            vm.rankScore = res.data.data.rankScore;
          } else if (res.data.code == 501 || res.data.code == 500) {
            // alert("login failed")
            vm.sendVal = true;
            // flag = true;
            vm.title = "错误";
            vm.content = "<h2>"+res.data.msg+"<h2>";
          }
        })
        .catch(response => {
          console.log(response);
        });
      },
      getRankData(){
      var vm = this;
      this.$http
        .post(
          base.baseURL + "day/getRank/",
          {
            token: sessionStorage.getItem("token")
          },
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          if (res.data.code == 200) {
            vm.rankData = res.data.data;
             console.log( vm.rankData);
          } else if (res.data.code == 501 || res.data.code == 500) {
            // alert("login failed")
            vm.sendVal = true;
            // flag = true;
            vm.title = "错误";
            vm.content = "<h2>"+res.data.msg+"<h2>";
          }
        })
        .catch(response => {
          console.log(response);
        });
      },
      getPunchData(){
      var vm = this;
      this.$http
        .post(
          base.baseURL + "day/getUserPunch/",
          {
            token: sessionStorage.getItem("token")
          },
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          if (res.data.code == 200) {
            vm.punchData = res.data.data;
             console.log( vm.rankData);
          } else if (res.data.code == 501 || res.data.code == 500) {
            // alert("login failed")
            vm.sendVal = true;
            // flag = true;
            vm.title = "错误";
            vm.content = "<h2>"+res.data.msg+"<h2>";
          }
        })
        .catch(response => {
          console.log(response);
        });
      },
      volume: function (e) {
        e = e || window.event;
        willPlay.volume(e);
      },
      volumeControl: function (e) {
        e = e || window.event;
        willPlay.volumeControl(e);
      },
      fullscreen: function () {
        willPlay.fullScreen();
      },
      getNews: function(){
        console.log("get news");
        var vm = this;
      this.$http
        .post(
          base.baseURL + "zpSpider/getNewsById/",
          {
            pageNow:this.pageNow,
            pageSize:this.pageSize,
            token: sessionStorage.getItem("token")
          },
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          if (res.data.code == 200) {
            console.log(res.data.data.data);
            vm.pageCount = res.data.data.pageCount;
            vm.total = res.data.data.total;
            vm.tableData=res.data.data.data;
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
      daypunch: function(){
      var vm = this;
      this.$http
        .post(
          base.baseURL + "day/punch/",
          {
            token: sessionStorage.getItem("token")
          },
          { "Content-Type": "application/json", Accept: "application/json" }
        )
        .then(function(res) {
          if (res.data.code == 200) {
            console.log(res.data);
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
        this.getRankData();
        this.getRankScore();
        this.getPunchData();
      },
      initControl: function () {
        willPlay.initControl();
      },
       playVideo(){
            var vdo = document.getElementById("videoPlay");
            vdo.play();
        },
      timeUpdate: function () {
        //监控播放进度
        var playVideo = $('video');
        var playPause = $('.playPause'); //播放和暂停
        var currentTime = $('.timebar .currentTime'); //当前时间
        var progress = $('.timebar .progress-bar'); //进度条
        currentTime.text(willPlay.formatSeconds(playVideo[0].currentTime));
        progress.css('width', 100 * playVideo[0].currentTime / playVideo[0].duration + '%');
        var a = willPlay.formatSeconds(playVideo[0].currentTime);   //format(hh:mm:ss)
        var b = playVideo[0].currentTime;
        // if (this.qus.length != 0) {
        //   for (var i in this.qus) {
        //     var time = this.qus[i].playProgress.substr(11, 8);  //hh:mm:ss
        //     var seconds = this.toSeconds(time);
        //     if (seconds) {
        //       if (parseInt(b) == seconds && this.c == i && !playVideo[0].paused) {   //使用setTimeout会跳过，不推荐
        //         playVideo[0].pause();
        //         playPause.toggleClass('playIcon');
        //         $('.playTip').removeClass('iconPause').addClass('iconPlay').fadeIn();
        //         $('.playStart').removeClass('iconPause').addClass('iconPlay').fadeIn();

        //         this.c++;
        //         this.alertPop = true;
        //       }
        //     }

        //   }
        // }

      },
      canPlay: function () {
        this.loading1 = false;
      },
        start: function () {
        willPlay.playControl();
      },
       endPlay: function () {

        if (this.resourseNum == 2) {
          this.stype = '1';
        } else {
          $('.playTip').removeClass('iconPause').addClass('iconPlay').fadeIn();
          $('.playStart').removeClass('iconPause').addClass('iconPlay').fadeIn();
          $('.playPause').toggleClass('playIcon');
          $('video')[0].pause();
          this.toTest();
        }
      },   
      //  openCour: function (cour) {
       openCour: function (cour) {
         this.type = '0';
          this.srcMP4 =  "http://localhost:8100/zpSpider/getStream/";
          // this.srcMP4 =  base.baseURL+ "/zpSpider/getStream/";
          //  this.$http.get(base.baseURL+ "/zpSpider/getStream/").then(function (res) {
            

          // }.bind(this)).catch(function (err) {

          // })
        //   this.stype = '0';
        //   this.$http.post(this.geturl(userTrainReocrdUrl, 'train_courseQue'), {
        //     token: tokenval,
        //     courseId: cour.trainCourseId
        //   }, {emulateJSON: false}).then(function (res) {
        //     var data = res.data.data.context;
        //     this.qus = JSON.parse(data).question;

        //   }.bind(this)).catch(function (err) {
        //     console.log(err);
        //   });
        //   this.$http.get(this.geturl(userTrainReocrdUrl, 'train_courseResource'), {
        //     params: {
        //       token: tokenval,
        //       videoId: cour.videoId
        //     }
        //   }, {emulateJSON: false}).then(function (res) {
        //     this.srcMP4 = res.data.data.url;

        //   }.bind(this)).catch(function (err) {

        //   })        
        //   this.resourseNum = 1;
        }
    }
}
</script>




<style>
.new-title{
  max-width: 110px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  }
.bg-purple {
    background: #fff;
}
.ec-publishtime{
 
  }
</style>

 <style scoped>
 .rank-item{
   margin-top:10px;
     font-weight:bold;
 }
 .content-day{
   margin-top:20px;
 }
 .news-pagination{
   margin-top:20px;
 }
   .name-wrapper{
        /* padding: 6px;
        height: 40px; */
        word-break: keep-all;
        /*不换行*/
        white-space: nowrap;
        /*不换行*/
        overflow: hidden;
        /*内容超出宽度时隐藏超出部分的内容*/
        text-overflow: ellipsis;
        /*当对象内文本一出事显示省略标记（...）;需与overflow:hidden;一起使用*/
        /*border: 1px solid blue;*/
    }
.el-row {
    margin-bottom: 20px;
    
  }
  i{
    margin-right:5px;
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    /* background: #99a9bf; */
  }
  .bg-purple {
    background: #fff;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
  .fd,.aynewlist{
    font-weight:bold;
       color:  #909399;
  }
  .day-classtag{
      text-align:center
  }
  .write-in{
      margin:auto;
  }
  .dayorder{
      margin-top:20px;
  }
  .my-day{
      margin-top:20px;
  }
  .my-pro{
      margin-top:10px;
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
  .aynewlist{
    font-size:23px;
    margin-left:10px;
    margin-bottom:5px;
    margin-top:10px;
  }
  ::selection{
color:  #F56C6C;
  }
  .day-news{
    margin-top:20px;
  }
  .train-popup {
    position: fixed;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
  }
</style>