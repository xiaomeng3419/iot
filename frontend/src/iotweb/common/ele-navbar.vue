<template>
<div class="ele-navbar">
<div class="ele-navbar-pre">   
<el-menu :default-active="$route.path"
  class="el-menu-demo"
  mode="horizontal"
  @select="handleSelect"
  background-color="#545c64"
  text-color="#fff"
  active-text-color="#ffd04b"> 
  <el-menu-item index="/home" >消息中心</el-menu-item>
 <el-menu-item  v-for="item in menu" :key="item.name" :index="item.url" 
      :default-active="url" 
      class="el-menu-resource" 
      mode="horizontal" 
      :router="routermode"
      @select="handleSelect">
          <template slot="title" index="item.urlcode"> {{item.name}}</template>
             <el-menu-item  v-for="itemc in item.chaild" :key="itemc.name" :index="itemc.url">{{itemc.name}}</el-menu-item>
      </el-menu-item>
        </el-menu>
<div>
  <!-- <router-view></router-view> -->
</div>
</div>
</div>
</template>
<script>
export default {
  name:'ele-navbar',
  data() {
    return {
      activeIndex2: "1",
      routermode:true,
      activeName: "home",
      url: "/dhome",
      menu: [
        {
          name: "视频获取",
          activeName: "dhome",
          urlcode:1,
          url: "/main",
          chaild:[
               {
                    url:'/main',
                    name:'main',
                    activeName: 'main'
                },
               {
               name: "视频获取",
               activeName: "home",
               url: "/home",
               }
          ]
        },
        {
          name: "其他资源",
          activeName: "blogs",
          urlcode:2,
          url: "/blogs"
        },
        {
          name: "获取记录",
          activeName: "slider",
          urlcode:3,
          url: "/slider"
        }
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
<style scoped>
.ele-navbar-pre {
  background-color: #545c64 !important;
  width: 100%;
}
::selection{
    background: #e67e22;
  text-shadow: none;
}
</style>

