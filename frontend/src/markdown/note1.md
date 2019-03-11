# python3.*安装Image、Image**解决



* 1、使用npm install Image 如果还是提示 ImportError: No module named Image 就说明安装可能没有成功，执行如下命令先行卸载：
` npm uninstall Image `

* 2、 到[下载地址](https://www.lfd.uci.edu/~gohlke/pythonlibs/#pil) 下载和自己电脑环境相符合的whl安装包，
我下载的是：`Pillow-3.4.2-cp36-cp36m-win_amd64.whl`
到安装目录：
`pip install Pillow-3.4.2-cp36-cp36m-win_amd64.whl`
安装即可用

``
PIL好像默认只支持到py2，但是官网提供了py3对应的包
``