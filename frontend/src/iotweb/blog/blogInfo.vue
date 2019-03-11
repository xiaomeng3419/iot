<template>
    <div class="singleBlog">
     <div class="article" v-html="compiledMarkdown" v-highlight></div>
    </div>
</template>
<script>
import base from "../../bootstrap/js/base.js";
import marked from '../../../node_modules/marked';

import '../../css/common/highlight.css'
// TODO: note8.md 博客内容
export default {
  data() {
    return {
      blogId:"",
      context: "",
    };
  },
  computed:{
      compiledMarkdown () {
        return marked(this.context || '')
      }
  },
  
   created(){  
       this.getParams();
       this.getBlogInfo();
       this.markdown();
    },  
  // TODO: 这行是加载必须的要的数据
  mounted(){


    this.getParams();
    this.getheight();
    // this.getBlogInfo();
  },
  methods: {
    markdown() {
    marked.setOptions({
        renderer: new marked.Renderer(),
        gfm: true,
        tables: true,
        breaks: false,
        pedantic: false,
        smartLists: true,
        sanitize: true,
        smartypants: false
    })
    },
     getheight() {
      var height = window.innerHeight - 83;
      height = parseInt(height);
      $(".singleBlog").css("height", height);
      // this.tableheight = height;
    },
    getParams(){
      // let routerParams = this.$route.params.id;
      let routerParams = this.$route.query.id;
      this.blogId = routerParams;
    },
      getBlogInfo: function(){
        var vm = this
        this.$http
          .post(base.baseURL + "blog/getBlogsByBlogID/", {
            blogId: this.blogId,
            token: sessionStorage.getItem("token"),
          },{ "Content-Type": "application/json", Accept: "application/json" })
          .then(function(res) {
            if (res.data.code == 200) {
              vm.context = res.data.data[0].blogContent
              // alert(vm.context)
            } else if (res.data.code == 501 || res.data.code == 500) {
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
      }
  }

};
</script>

<style scoped>
.singleBlog{
  overflow:auto;
  margin-top: 10px;
  position:  relative;
}
#footer{
  position: relative;
  bottom: 0;
}
</style>
