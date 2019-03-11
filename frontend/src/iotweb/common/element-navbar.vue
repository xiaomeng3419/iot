<template>
  <div class="top-head">

    <el-menu 
      :default-active="url" 
      class="el-menu-demo" 
      mode="horizontal" 
      :router="routermode"
      @select="handleSelect"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b"
      >
    <el-menu-item index="3122"> <a  href="/index.html">
                    <img id="jupyter-nav-logo" class="navbar-logo" src="/assets/nav_logo.svg" alt="Jupyter logo">
                </a></el-menu-item>
  <li class="navli" style="display: inline-block;" v-for="item in menu" :key="item.name">
  <el-submenu v-if="item.chd"  
      :default-active="url" 
      class="el-menu-resource" 
      mode="horizontal" 
      :router="routermode"
      @select="handleSelect"
      :index="''+item.urlcode"
  >
     <template slot="title" :index="item.urlcode"> {{item.name}}</template>
    <el-menu-item  v-for="itemc in item.chd" :key="itemc.name" :index="itemc.url">{{itemc.name}}</el-menu-item>
</el-submenu>
      <el-menu-item v-else   :index="item.url">{{item.name}}</el-menu-item>
      </li>
</el-menu>
    <div class="content-iot">
      <div>
        <router-view></router-view>
      </div>
       
    </div>
  </div>
</template>

<script>
export default {
  name: "element-navbar",
  data() {
    return {
      routermode:true,
      activeName: "home",
      url: "/home",
      menu: [
          {
          name: "首页",
          activeName: "home",
          urlcode:2,
          url: "/home"
        },
        {
          name: "资源",
          activeName: "sliders",
          urlcode:2,
          url: "/sliders"
        },
        {
          name: "安检记录",
          activeName: "newinfo",
          url: "/newinfo",
          urlcode:1,
          chd:[
            {
                 name: "newinfo",
                activeName: "newinfo",
                url: "/newinfo",
                urlcode:4,
            },  {
                 name: "newlist",
                activeName: "newlist",
                url: "/newlist",
                urlcode:5,
            }
          ]
        },        
        {
          name: "报表",
          activeName: "dayVue",
          urlcode:3,
          url: "/dayVue"
        },
        {
          name: "我的随笔",
          activeName: "bloglist",
          url: "/bloglist",
          urlcode:3,
          chd:[
            {
                 name: "bloglist",
                activeName: "bloglist",
                url: "/bloglist",
                urlcode:4,
            },  {
                 name: "blogs",
                activeName: "blogs",
                url: "/blogs",
                urlcode:5,
            }
          ]
        },
      ]
    };
  },
  methods: {
    handleSelect(key, keyPath) {
        console.log(key, keyPath);
      }
  }
};
</script>

<style>
.el-submenu__title i {
    position: relative ;
    color: #909399;
    color: rgb(255, 255, 255);
    margin-left: 21px;
    margin-bottom: 50px;
    border-bottom-color: transparent;
    background-color: transparent;
} 
</style>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.ele-navbar-pre {
  background-color: #545c64 !important;
  width: 100%;
}
::selection{
    background: #e67e22;
  text-shadow: none;
}


.el-submenu.is-active .el-submenu__title {
    border-bottom-color: rgb(84, 92, 100) !important; 
}
.el-menu--horizontal>.el-menu-item {
    float: left;
    height: 51px;
    line-height: 51px;

}
</style>
