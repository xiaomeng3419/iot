# 安装yum： rpm >= 0:4.11.3-22 被 yum-3.4.3-154.el7.centos.noarch
*最近在centos7上安装了`python3`导致`yum`不能用，被其他人卸载掉后重新安装*
```shell
#下载yum安装包
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-3.2.27-14.el6.centos.noarch.rpm
wget http://mirrors.163.com/centos/7/os/x86_64/Packages/python-iniparse-0.4-9.el7.noarch.rpm
wget http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
wget http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-3.4.3-158.el7.centos.noarch.rpm
wget http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.31-45.el7.noarch.rpm

#安装 
rpm -ivh  python-iniparse-0.4-9.el7.noarch.
rpm -ivh  yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
rpm -ivh  yum-3.4.3-158.el7.centos.noarch.rpm  #会出现问题1
wget http://mirrors.163.com/centos/7/os/x86_64/Packages/rpm-4.11.3-32.el7.x86_64.rpm
rpm -Uvh rpm-4.11.3-32.el7.x86_64.rpm --nodeps
rpm -ivh  yum-3.4.3-158.el7.centos.noarch.rpm yum-plugin-fastestmirror-1.1.31-45.el7.noarch.rpm 

```
```shell
```
```shell
错误：依赖检测失败：    
    rpm >= 0:4.11.3-22 被 yum-3.4.3-154.el7.centos.noarch 需要
    yum >= 3.0 被 yum-plugin-fastestmirror-1.1.31-45.el7.noarch 需要 
解决： 
wget http://mirrors.163.com/centos/7/os/x86_64/Packages/rpm-4.11.3-32.el7.x86_64.rpm
rpm -Uvh rpm-4.11.3-32.el7.x86_64.rpm --nodeps

```
成功！
注意：升级成了`python3`也可以用`python2`,
因为yum使用`python2`，因此替换为python3后可能无法正常工作，继续使用这个`python2.7`. 因此修改yum配置文件

 `sudo vim /usr/bin/yum`      

把文件头部的#!/usr/bin/python改成#!/usr/bin/python2.7保存退出即可.

`/usr/libexec/urlgrabber-ext-down`看看，发下他也使用了`/usr/bin/python`，于是跟前面一样，改为2.7，完成。
转载请说明出处，谢谢！本文地址：[]()