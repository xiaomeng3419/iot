from django.shortcuts import render
from .slider1 import parseListLink
from .models import TNews
# Create your views here.
from django.http import HttpResponse
import json
from django.db import connection
from iot.utils import QuerySetToJson
import datetime
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# 视频文件流
from django.http import StreamingHttpResponse
from wsgiref.util import FileWrapper
import  re
import mimetypes

# 日志处理部分
# TODO 未处理的是我们如何在低等级的日志不包含高等级的日志？ 待处理 ，需要看logging模块
import logging
import os
import logging.config
import yaml
print ("os.path.realpath(__file__)=%s" % os.path.realpath(__file__))
logging.config.dictConfig(yaml.load(open('E:/common/Python/lib/site-packages/django/bin/iot/logging.yaml', 'r')))
logger = logging.getLogger("all")


listurl = "http://api.roll.news.sina.com.cn/zt_list?channel=news&cat_1=gnxw&cat_2==gdxw1||=gatxw||=zs-pl||=mtjj" \
           "&level==1||=2&show_ext=1&show_all=1&show_num=22&tag=1&format=json&page=1&callback=newsloadercallback&_=1530960997000"
listurls = "http://api.roll.news.sina.com.cn/zt_list?channel=news&cat_1=gnxw&cat_2==gdxw1||=gatxw||=zs-pl||=mtjj&level==1||=2" \
          "&show_ext=1&show_all=1&show_num=22&tag=1&format=json&page={}&callback=newsloadercallback&_=1530798907150"


# 初始数据导入
#  TODO  初始数据导入不走中间件直接过滤，但是还没有做对已经爬虫过的新闻做过滤处理，理论上是第一个如果已经数据库存在我们就break!
def convertToDb(request):
    try:
        newsData = parseListLink(listurl)
        for vo in newsData:
            newAdd = TNews.objects.create(news_id=vo['id'], title=vo['title'], article=vo['aritcle'],
                                          publish_time=vo['dt'],
                                          author=vo['editor'], url_http=vo['urlHttp'], comments_num=vo['comments'],
                                          resouces=vo['urlSource'])
        ret = {"code": 200, "update": "success"}
        return HttpResponse(json.dumps(ret), content_type="application/json")
    except Exception as err:
        print("*******************************2")
        print(err)
        ret = {"code": 501, "msg": "failed"}
        return HttpResponse(json.dumps(ret), content_type="application/json")


# 开始整合分页功能 ，获取新闻列表，分页信息由前端完成

def getNewsPg(request):
    try:
        logger.info("get news :")
        if request.method == "POST":
            pageNow = 0
            pageSize = 0
            value=None
            print(request.body)
            pageSize = json.loads(request.body).get("pageSize")
            pageNow = json.loads(request.body).get("pageNow")
            print(str(pageSize))
            print(str(pageNow))
            print(type(json.loads(request.body)))
            if "id" in json.loads(request.body):
                sql = "select a.news_id as ID , a.title,a.publish_time as publishTime,a.author  as  author,a.comments_num as num from zpspider_tnews a WHERE " \
                      " a.id =  %(id)s"
                value = {"id":json.loads(request.body).get("id")}
            else:
                sql = "select a.news_id as ID , a.title,a.publish_time as publishTime,a.author  as  author,a.comments_num as num from zpspider_tnews a"
            res = rsSqlExe(sql,value,pageNow=pageNow,pageSize=pageSize)
            ret = {"code": 200, "msg": "success","data":res}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    except Exception as err:
        print(err)
        logger.error(str(err))
        ret = {"code": 501, "msg": "failed"}
        return HttpResponse(json.dumps(ret), content_type="application/json")


def rsSqlExe(sql,value,pageSize=0,pageNow=0):
    try:
        res = [];
        cursor = connection.cursor()
        cursor.execute(sql,value)
        res = QuerySetToJson.dictfetchallY(cursor)
        res = Paginator(res, pageSize)
        num_pages = res.num_pages
        count = res.count
        if pageNow != 0 and pageSize != 0:
            try:
                res = res.page(pageNow)
            except PageNotAnInteger as err:
                # 如果请求的页数不是整数，返回第一页。
                res = res.page(1)
                pageNow = 1
            except EmptyPage as err:
                # 如果请求的页数不在合法的页数范围内，返回结果的最后一页。
                pageNow = res.num_pages
                res = res.page(res.num_pages)
        #     print("3")
        #     print(res)
        # logger.info(str(res.object_list))
        result = {"data":res.object_list,"pageSize":pageSize,"pageNow":pageNow,"pageCount":num_pages,"total":count}
        return result
    except Exception as  err :
        print(err)
        logger.error(err)
        return err



def file_iterator(file_name, chunk_size=8192, offset=0, length=None):
    with open(file_name, "rb") as f:
        f.seek(offset, os.SEEK_SET)
        remaining = length
        while True:
            bytes_length = chunk_size if remaining is None else min(remaining, chunk_size)
            data = f.read(bytes_length)
            if not data:
                break
            if remaining:
                remaining -= len(data)
            yield data

def stream_video(request):
    path = "E:/common/Python/lib/site-packages/django/bin/iot/zpSpider/1531904631.mp4"
    """将视频文件以流媒体的方式响应"""
    range_header = request.META.get('HTTP_RANGE', '').strip()
    range_re = re.compile(r'bytes\s*=\s*(\d+)\s*-\s*(\d*)', re.I)
    range_match = range_re.match(range_header)
    size = os.path.getsize(path)
    content_type, encoding = mimetypes.guess_type(path)
    content_type = content_type or 'application/octet-stream'
    if range_match:
        first_byte, last_byte = range_match.groups()
        first_byte = int(first_byte) if first_byte else 0
        last_byte = first_byte + 1024 * 1024 * 8       # 8M 每片,响应体最大体积
        if last_byte >= size:
            last_byte = size - 1
        length = last_byte - first_byte + 1
        resp = StreamingHttpResponse(file_iterator(path, offset=first_byte, length=length), status=206, content_type=content_type)
        resp['Content-Length'] = str(length)
        resp['Content-Range'] = 'bytes %s-%s/%s' % (first_byte, last_byte, size)
    else:
        # 不是以视频流方式的获取时，以生成器方式返回整个文件，节省内存
        resp = StreamingHttpResponse(FileWrapper(open(path, 'rb')), content_type=content_type)
        resp['Content-Length'] = str(size)
    resp['Accept-Ranges'] = 'bytes'
    return resp