<template>
<div>
    <nav class="navbar navbar-fixed-top" role="s" id="navbar" >
        <div class="navbar-inner">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>;                    
                      <span class="icon-bar white-icon-bar"></span>
                      <span class="icon-bar white-icon-bar"></span>
                      <span class="icon-bar white-icon-bar"></span>
                    
                </button>
                <a class="navbar-brand" href="/index.html">
                    <img id="jupyter-nav-logo" class="navbar-logo" src="/assets/nav_logo.svg" alt="Jupyter logo">
                </a>
            </div>
            <div class="blur"></div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                 <ul class="nav navbar-nav navbar-right">
                    <li v-for="item in items" class="menuItem" :key="item.index">
                    <router-link :to="item.url" class="tab"><i :class='item.icon'></i>{{item.label}}<div class="pointdiv"><i class="dot"></i></div></router-link>
                    </li>
                </ul>
                <!-- <ul class="nav navbar-nav navbar-right" id="nav-select" @select="handleSelect">
                               <li index="1">
                                   <a _href="/home" class="tab">首页</a>
                               </li>
                               <li index="2">
                                   <a _href="/about" class="tab">About Us</a>
                               </li>
                               <li index="3">
                                   <a _href="/community" class="tab">Community</a>
                               </li>
                               <li index="4">
                                   <a _href="/documentation" class="tab">数据库管理</a>
                               </li>
                               <li index="5">
                                 <a _href="https://nbviewer.jupyter.org" class="tab" target="_blank">NBViewer</a>
                               </li>
                               <li index="6">
                                   <a _href="/widgets" class="tab">用户</a>
                               </li>
                               <li index="7">
                                 <a _href="https://blog.jupyter.org" class="tab" target="_blank">Blog</a>
                               </li>
                </ul> -->
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
        <!-- <router-view></router-view> -->
    </div>
</nav>
</div>
</template>
<script>

export default {
  name: "navbar",
  data() {
    return {
      items: [
        {
          label: "首页",
          icon: "menuLeft-icon0",
          url: "/home"
        },
        {
          label: "我的资料",
          icon: "menuLeft-icon1",
          url: "/user"
        },
        {
          label: "资料获取",
          icon: "menuLeft-icon2",
          url: "/sliders"
        },
          {
          label: "翻译工具",
          icon: "menuLeft-icon2",
          url: "/translate"
        },
        {
          label: "博客",
          icon: "menuLeft-icon3",
          url: "/blogs"
        },
        {
          label: "个人记录",
          icon: "menuLeft-icon4",
          url: "/home/personalRecord"
        }
      ]
    }
  }
};
</script>
<style scoped>
.active {
  color: var(--Colors5);
}
.navbar-nav > li > .navbar-active {
  color: #e46e2e;
}
.nav > li > .tab {
  font-size: 16px;
  padding: 12px 16px 10px;
}
.nav > li > .tab:visited {
  background-color: #f8f8f8;
}
.navbar .tab {
  color: black;
}
.nav > li > .tab:hover {
  background-color: transparent;
  color: var(--Colors5);
  -webkit-transition: 0.2s;
}
.nav > li > .tab {
  text-decoration: none;
}
.navbar {
  position: relative;
  z-index: 0;
  margin-bottom: 0 !important;
}
::selection {
  color: #ffffff;
  background: #e67e22;
  text-shadow: none;
}
</style>
