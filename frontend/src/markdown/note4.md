# AttributeError: 'WSGIRequest' object has no attribute 'session'

最近做了一个django中间件，过滤未经过登陆的请求url，用redis做的缓存，但是发现WSGIRequest没有属性解决方法：
解决方法是在MIDWARE{}中把自定义的中间件放在最底下。