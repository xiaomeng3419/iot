# vue 项目跨域问题解决

`` 最近想做的是做一个django的前后端分离的项目，前端框架选择了vue，由于前后端启动的端口不一样，会出现跨域问题，django跨域是挺容易解决的，vue跨域 ``

* 在项目的 `config/ `目录下的`index.js`文件的dev{}中添加

```js javaScript
   proxyTable: {
      '/api': {
        target: 'http://127.0.0.1:8100/',
        changeOrigin: true,
        pathRewrite: {
          '^/api': '/'
        }    
    }
    }
```
虽然前端端口还是你的前端运行的端口，其实已转发到了8100端口，可以看接口日志便可以看到已进入端口