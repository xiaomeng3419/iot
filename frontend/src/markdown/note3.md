# TypeError: 'CommandCursor' object is not subscriptable

我用的是pymongo 查询出来数据然后报这个错误
```python
timer_object_id_list = TimerServer._get_collection().aggregate(
                    [{'$sort':{'timer_time':-1}},
                     {'$match':{'timer_status':'0'}},{"$group":{"_id":"$timer_object_id"}}])['result']
```
查询了消息发现查询出来的数据类型是commandcursor 不能带有`['result']`
于是去掉
```python
timer_object_id_list = TimerServer._get_collection().aggregate(
                    [{'$sort':{'timer_time':-1}},
                     {'$match':{'timer_status':'0'}},{"$group":{"_id":"$timer_object_id"}}])
```

* 注意：后面的数组操作也要更换需要转换成list具体可以看pymongo的CommandCursor源码可以看看有哪些属性也可查询官网[点击此处](http://api.mongodb.com/python/current/)

转发请写明出处！谢谢！ 本文地址：https://www.cnblogs.com/ontoweb-zp/p/9166606.html