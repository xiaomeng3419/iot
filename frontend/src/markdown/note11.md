windows运行django-crontab报错No module named \fcntl\
老眼2018-03-07 17:07:46分 享
问题现象

windows系统运行django-crontab报错

import fcntl
ImportError: No module named 'fcntl'

但是在mac系统或者linux系统中运行正常

问题原因

windows的python的Lib目录中没有fcntl.py模块文件

解决方法

需要手动在python的Lib目录中添加fcntl.py，该文件内容如下

```python
def fcntl(fd, op, arg=0):
    return 0
def ioctl(fd, op, arg=0, mutable_flag=True):
    if mutable_flag:
        return 0
    else:
        return ""
def flock(fd, op):
    return
def lockf(fd, operation, length=0, start=0, whence=0):
    return

```