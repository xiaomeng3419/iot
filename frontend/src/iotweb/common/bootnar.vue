<template>
<!-- <div class="pre-footer"> -->
<footer id="footer" class="midnight-blue">
        <div class="container-fluid" style="font-size: smaller">
            <div class="row footer-1">
                <div class="col-md-2">
                    Copyright &copy; 2018.张攀的官方网站
                </div>
                <div class="col-md-3">
                    托管于<a target="_blank" href="https://www.aliyun.com/">阿里云</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a target="_blank" href="http://www.miitbeian.gov.cn/">京ICP备17055098号</a>
                </div>
                <div class="col-md-2">
                    <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010602120033">

                        <span><img style="display: inline;margin: 0 auto;" src="../../css/images/ghs.png" />京公网安备11010102002019号</span>
                    </a>
                </div>
                <div class="col-md-5">
                    <ul class="pull-right">
                        <li><a href="/blog/">返回首页</a></li>
                        <li><a href="/about/">关于博主</a></li>
                        <li><a href="#">常见问题</a></li>
                        <li><a href="/contact/" target="_blank">广告合作</a></li>
                        <li><a href="/contact/" target="_blank">联系方式</a></li>
                        <li><a href="#">使用许可</a></li>
                    </ul>
                </div>
            </div>

        </div>
  </footer>
  <!-- </div> -->
</template>
<style scoped>
@import "../../css/baseweb.css";
</style>
<style scoped>
 #footer {
      /* position:absolute;      */
    width:100%;     
    clear:both;     
    bottom:0;    
    /* margin-top:-92px;  */
    left:0;     
    display: block;
    border-top: 5px solid #3f75ca;
    padding-top: 15px;
    padding-bottom: 15px;
    color: #fff;
    bottom: 0;
  z-index: -1;
    position: relative;
      /* clear:both;   */
    width:100%;
    background: var(--Colors2);
} 

.footer-1 {
    height: 30px;
    /* margin: auto 15px; */
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ul{
    display: block;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}
.row {
    margin-right: -15px;
    margin-left: -15px;
}
.col-xs-1, .col-sm-1, .col-md-1,
.col-lg-1, .col-xs-2, .col-sm-2,
.col-md-2, .col-lg-2, .col-xs-3,
.col-sm-3, .col-md-3, .col-lg-3,
.col-xs-4, .col-sm-4, .col-md-4,
.col-lg-4, .col-xs-5, .col-sm-5,
.col-lg-5, .col-xs-6,
.col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7,
.col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9,
.col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10,
.col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12,
.col-sm-12, .col-md-12, .col-lg-12 {
    float: left;
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}
#footer ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
.pull-right li{
    float: right !important;
    max-resolution: left 10px;
}
ul li{
    margin-bottom:20px;
}
*, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

</style>
