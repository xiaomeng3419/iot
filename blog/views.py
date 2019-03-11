from django.shortcuts import render
import json
from django.shortcuts import render
from django.shortcuts import redirect
from django.http import HttpResponse
from django.core import serializers
from .models import Blog,Blog_classfies
from django.forms.models import model_to_dict
# Create your views here.
from django.contrib.auth.decorators import login_required
from django.db import connection
from iot.utils import QuerySetToJson
import datetime

# @login_required(login_url='/#/login')
def createBlog(request):
    # print(request.session["zhangpanuser"])
    if request.method == "POST":
        # Blog.objects.raw()
        rb = json.loads(request.body)
        user = request.session[rb.get("token")]
        print(user)
        print(request.body)
        blog_name = rb.get("blogTitle")
        blog_content = rb.get("blogContent")
        blog_tag = rb.get("blogTag")
        email = user["email"]
        classfy = rb.get("classfies")
        user_id = user["id"]
        remoteIp = QuerySetToJson.getRuquestRemoteAddress(request)
        print("remote ip is :"+remoteIp)
        # blogTitle = json.loads(request.body).get("blogTitle")
        # blogTag = json.loads(request.body).get("blogTag")
        # blogContent = json.loads(request.body).get("blogContent")
        try:
            print("*******************************1")
            blogAdd = Blog.objects.create(blog_name=blog_name,blog_content=blog_content,classfy=classfy,email=email,blog_tag=blog_tag,user_id=user_id,remote_ip=remoteIp)
            ret = {"code": 200, "update": "success"}
            return HttpResponse(json.dumps(ret), content_type="application/json")
        except Exception as err:
            print("*******************************2")
            print(err)
            ret = {"code": 501, "msg": "failed"}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    else:
         print("*******************************3")
         ret = {"code": 501, "msg": "failed"}
         return HttpResponse(json.dumps(ret), content_type="application/json")


def getClassfies(request):
    if request.method == "POST":
        # Blog.objects.raw()
        rb = json.loads(request.body)
        classfies = Blog_classfies.objects.all()
        print("------------------------------------")
        result = serializers.serialize("json",classfies)

        # print(list(classfies))
        # afr = list(classfies)
        # print(json.dumps(afr))

        datas = queryset_to_json(classfies)

        print("---------------------------------1---")
        print(datas)
        ret = {"code": 200, "msg": "success","data":datas}
        return HttpResponse(json.dumps(ret), content_type="application/json")
    else:
        print("*******************************3")
        ret = {"code": 501, "msg": "failed"}
        return HttpResponse(json.dumps(ret), content_type="application/json")

def queryset_to_json(queryset):
    obj_arr = []
    for o in queryset:
        obj_arr.append(o.toDict())
    return obj_arr

def toJSON(self):
        fields = []
        for field in self._meta.fields:
            fields.append(field.name)

        d = {}
        for attr in fields:
            if isinstance(getattr(self, attr), datetime.datetime):
                d[attr] = getattr(self, attr).strftime('%Y-%m-%d %H:%M:%S')
            elif isinstance(getattr(self, attr), datetime.date):
                d[attr] = getattr(self, attr).strftime('%Y-%m-%d')
            else:
                d[attr] = getattr(self, attr)

        import json
        return json.dumps(d)

def useSqlRes(request):
    cursor = connection.cursor()
    cursor.execute("select class_name as className from blog_blog_classfies"
                   ""
                   "")
    print(QuerySetToJson.dictfetchallY(cursor))
    ret = {"code": 501, "msg": "failed"}
    return HttpResponse(json.dumps(ret), content_type="application/json")


def dictfetchall(cursor):
    # "将游标返回的结果保存到一个字典对象中"
    desc = cursor.description
    return [dict(zip([col[0] for col in desc], row)) for row in cursor.fetchall()]


def dictfetchallY(cursor):
    # "将游标返回的结果保存到一个字典对象中"
    res = []
    dd = []
    desc = cursor.description
    ds = []
    print(desc)
    print(desc)
    for row in cursor.fetchall():
        for col in desc:
           ds.append(col[0])
        res.append(dict(zip(ds,row)))

    for row in res:
        d = {}
        for attr in row:
            if isinstance(row[attr], datetime.datetime):
                d[attr] = row[attr].strftime('%Y-%m-%d %H:%M:%S')
            elif isinstance(row[attr], datetime.date):
                d[attr] = row[attr].strftime('%Y-%m-%d')
            else:
                d[attr] = row[attr]
        dd.append(d)
    return dd

def getBlogsByUserID(request):
    if request.method == "POST":
        print("---------------------------")
        rb = json.loads(request.body)
        page = 0
        pageSize = 5
        cursor = connection.cursor()
        user = request.session[rb.get("token")]
        cursor.execute("select a.id as Id,a.blog_name as blogName,a.createtime as createtime,b.class_name as className,a.remote_ip as remoteIp,access_num as accessNum from blog_blog a "
                       "LEFT JOIN blog_blog_classfies  b ON b.id=a.classfy "
                       "where  a.user_id = %s"
                       " ORDER BY id DESC limit 0,5",[user["id"]])
        res = QuerySetToJson.dictfetchallY(cursor)
        print(res)
        ret={"code":200,"msg":"sucess","data":res}
        return HttpResponse(json.dumps(ret), content_type="application/json")

def getBlogsByBlogID(request):
    if request.method == "POST":
       print("---------------------------")
       rb = json.loads(request.body)
       cursor = connection.cursor()
       user = request.session[rb.get("token")]
       blogId = rb.get("blogId")
       cursor.execute(
                "select a.id as Id,a.blog_name as blogName,a.createtime as createtime,a.blog_content as blogContent, b.class_name as className from blog_blog a "
                "LEFT JOIN blog_blog_classfies  b ON b.id=a.classfy "
                "where  a.id = %s", [blogId])
       res = QuerySetToJson.dictfetchallY(cursor)
       print(res)
       ret = {"code": 200, "msg": "sucess", "data": res}
       return HttpResponse(json.dumps(ret), content_type="application/json")


from apscheduler.scheduler import Scheduler
sched = Scheduler()

# 定时任务
# @sched.interval_schedule(seconds=5)
# def mytask():
#     # chekUserFiles()
#     print("11111111111111111111111111111111111111111111111")
#
# sched.start()
