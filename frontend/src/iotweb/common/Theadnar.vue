<template>
  <div class="content" >
    <div id="iot_login_title">
      <span id="login_title"><span class="text-shadow">ontoweb</span>易翻</span>
    </div>
    <span></span>

  </div>
</template>
<style scoped>
 @import '../../css/baseweb.css';
</style>

<style scoped>
.text-shadow{
    text-shadow:#FF0000 0 0 10px;
    color:white;
    font-size:40px
}
  .content{
    z-index: 0 !important;
      padding: 0px;
      margin-top: 0px;
      background: var(--Colors2);
      width: 100%;
      height: 70px;
      position:relative;
  }
   #login_title{
     float: left;
     width: auto;
     position: absolute;
     top: 7px; left: 60px; bottom: 0; right: 0;
   }
  #iot_login_title{
      /* font: 60m sans-serif; */
      font-size:40px;
      text-align: left;
      color:#5BC0DE;
      float: left;
      margin:0px;
      padding:0px;
      }
  #login_but,#register_but{
    text-align:right;
    margin-right:0px;
    /* color:#EF434C; */
    color: var(--Colors1);
    position: absolute;
    padding-top:25px;
    font-size:20px;
    }
    #login_but{
       margin-left:29%;
     }
    #register_but{
      margin-left:33%;
      }
</style>
