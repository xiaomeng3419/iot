from django.shortcuts import render

from  .forms import FileUploadForm
from .models import Punch,Excel_Type,Excel_Model
# Create your views here.
from django.http import HttpResponse
import json
import time
from django.db import connection,transaction
from iot.utils import QuerySetToJson
import datetime
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import logging
import os
import xlrd
import logging.config
import yaml
print ("os.path.realpath(__file__)=%s" % os.path.realpath(__file__))
logging.config.dictConfig(yaml.load(open('E:/common/Python/lib/site-packages/django/bin/iot/logging.yaml', 'r')))
logger = logging.getLogger("all")


def dayPunch(request):
    try:
        logger.info("get news :")
        if request.method == "POST":
            now_time = datetime.datetime.now()
            timestr = now_time.strftime('%Y-%m-%d')
            token = json.loads(request.body).get("token")
            user = request.session[token]
            user_id = user["id"]
            sql = "select count(a.id) as num from day_punch a WHERE a.user_id =  %(id)s AND  day_time =  %(dayTime)s "
            value = {"id":user_id,"dayTime":timestr}
            print(value)
            res = rsSqlExe(sql,value)
            if res[0]["num"] == 0:
                print("-----------------------0")
                remoteIp =  QuerySetToJson.getRuquestRemoteAddress(request)
                seconds = 0
                dayTime = timestr
                firstTime = now_time.strftime('%Y-%m-%d %H:%M:%S')
                lastTime = now_time.strftime('%Y-%m-%d %H:%M:%S')
                ins =  "insert into day_punch (user_id ,day_time,first_time,last_time,times,punch_host) " \
                       "VALUES (%(user_id)s ,%(dayTime)s ,%(firstTime)s ,%(lastTime)s,%(seconds)s,%(remoteIp)s)"
                value = {"user_id":user_id,"dayTime":dayTime,"firstTime":firstTime,"lastTime":lastTime,"seconds":seconds,"remoteIp":remoteIp}
                inres = rsSqlExe(ins,value)
            else:
                remoteIp = QuerySetToJson.getRuquestRemoteAddress(request)
                seconds = 0
                dayTime = timestr
                lastTime = now_time.strftime('%Y-%m-%d %H:%M:%S')
                ins = "select id as Id,first_time as firstTime,punch_host as remoteIp from day_punch WHERE day_time = %(dayTime)s AND user_id = %(user_id)s"
                value = {"user_id": user_id, "dayTime": dayTime}
                inres = rsSqlExe(ins, value)
                if inres[0]["remoteIp"] != remoteIp :
                    ret = {"code": 500, "msg": "错误，与你今天第一次签到的主机不对"}
                    return HttpResponse(json.dumps(ret), content_type="application/json")
                up = "update day_punch set last_time = %(lastTime)s,times = %(times)s where id =  %(Id)s "
                value = {"lastTime":lastTime,"times":convertToSeconds(inres[0]["firstTime"],lastTime ),"Id":inres[0]["Id"]}
                upres = rsSqlExe(up,value)
            ret = {"code": 200, "msg": "success"}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    except Exception as err:
        print(err)
        logger.error(str(err))
        ret = {"code": 501, "msg": "failed"}
        return HttpResponse(json.dumps(ret), content_type="application/json")



def rsSqlExe(sql,value=None):
    try:
        res = [];
        cursor = connection.cursor()
        cursor.execute(sql,value)
        print(cursor)
        print(type(cursor))
        res = QuerySetToJson.dictfetchallY(cursor)
        print(res)
        return res
    except Exception as  err :
        print(err)
        logger.error(err)
        return err

def rsSqlExeX(sql,value=None):
    try:
        res = [];
        cursor = connection.cursor()
        cursor.execute(sql,value)
        res = QuerySetToJson.dictfetchallX(cursor)
        print(res)
        return res
    except Exception as  err :
        print(err)
        logger.error(err)
        return err

def convertToSeconds(firstTime,lastTime):
    # timeArray = time.strptime(tss2, "%Y-%m-%d %H:%M:%S")
    seconds = int(time.mktime(time.strptime(lastTime, "%Y-%m-%d %H:%M:%S"))) - int(time.mktime(time.strptime(firstTime, "%Y-%m-%d %H:%M:%S")))
    print("miaoshu :"+str(seconds))
    return seconds




# 获取自己的签到列表
def getUserPunch(request):
    try:
        logger.info("get news :")
        if request.method == "POST":
            sql = "select a.day_time as dayTime,a.first_time as firstTime ,a.last_time as lastTime,a.punch_host as remoteIp,a.times as seconds FROM day_punch a " \
                  "where a.user_id = %(userId)s"
            value={"userId":getuserId(request)}
            res = rsSqlExe(sql,value)
            ret = {"code": 200, "msg": "success", "data": res}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    except Exception as  err:
        print(err)
        logger.error(err)
        ret = {"code": 500, "msg": "操作失败"}
        return HttpResponse(json.dumps(ret), content_type="application/json")


def getRank(request):
    try:
        logger.info("get news :")
        if request.method == "POST":
            sql ="select a.user_id as userId,b.name as username ,convert(sum(a.times)/55920*100,decimal(6,2)) as rankScore FROM day_punch a " \
            "LEFT JOIN login_user b ON a.user_id = b.id " \
            "GROUP BY a.user_id " \
            "ORDER BY sum(a.times) DESC"
            res = rsSqlExeX(sql)
            print(res)
            ret = {"code": 200, "msg": "success","data":res}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    except Exception as  err:
        print(err)
        logger.error(err)
        ret = {"code": 500, "msg": "操作失败"}
        return HttpResponse(json.dumps(ret), content_type="application/json")


def getRankScore(request):
    try:
        logger.info("get news :")
        if request.method == "POST":
            sql ="select a.user_id as userId,b.name as username ,convert(sum(a.times)/55920*100,decimal(6,2)) as rankScore FROM day_punch a " \
            "LEFT JOIN login_user b ON a.user_id = b.id " \
            " WHERE a.user_id =  %(userId)s " \
            "GROUP BY a.user_id " \
            "ORDER BY sum(a.times) DESC"
            value = {"userId":getuserId(request)}
            res = rsSqlExeX(sql,value)
            print(res)
            ret = {"code": 200, "msg": "success","data":res[0]}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    except Exception as  err:
        print(err)
        logger.error(err)
        ret = {"code": 500, "msg": "操作失败"}
        return HttpResponse(json.dumps(ret), content_type="application/json")

def getuserId(request):
    try:
        token = json.loads(request.body).get("token")
        user = request.session[token]
        user_id = user["id"]
        return user_id
    except Exception as  err:
        print(err)
        logger.error(err)
        raise (err)

# 上传excel
def upload(request):
    '''
    :param request:
    :return: 上传文件excel表格 ,并进行解析
    '''
    if request.method == "POST":
        print("post request")

        myform = FileUploadForm(request.POST, request.FILES)
        user = request.session[request.GET.get("token")]
        # f = request.FILES['file']
        # print(f)
        #
        # # 开始解析上传的excel表格
        # wb = xlrd.open_workbook(filename=None, file_contents=f.read())  # 关键点在于这里
        # table = wb.sheets()[0]
        # nrows = table.nrows  # 行数
        # ncole = table.ncols  # 列数e
        # print("row :%s, cole: %s" % (nrows, ncole))
        #
        # for i in range(1, nrows):
        #     rowValues = table.row_values(i)  # 一行的数据
        #     print(type(rowValues[10]))
        #     print(type(rowValues[10]))
        # 在这里可以添加筛选excel的机制
        # f2 = json.loads(request.body).get("execontent")
        with transaction.atomic():
            if myform.is_valid():
                # print(myform)
                f = request.FILES['file']
                last_time = myform.cleaned_data["date1"] + " " + myform.cleaned_data["date2"]
                # 开始解析上传的excel表格
                wb = xlrd.open_workbook(filename=None, file_contents=f.read())  # 关键点在于这里
                table = wb.sheets()[0]
                nrows = table.nrows  # 行数
                ncole = table.ncols  # 列数
                colfield = []
                headerVal = rowValues = table.row_values(0)
                for i in range(0, ncole):
                    colfield.append(headerVal[i])
                    print(str(headerVal[i]))
                print("row :%s, cole: %s" % (nrows, ncole))
                is_push_check = 1
                if myform.cleaned_data["push"]:
                    is_push_check = 2
                ins = "insert into day_excel_type (user_id ,excel_name,is_push_check,notice_content,field_name,last_time) " \
                      "VALUES (%(user_id)s ,%(excel_name)s ,%(is_push_check)s ,%(notice_content)s,%(field_name)s,%(last_time)s);"
                value = {"user_id": user['id'], "excel_name": request.FILES.get('file', None).name,
                         "is_push_check": is_push_check, "notice_content": myform.cleaned_data["execontent"],
                         "field_name": str(colfield), 'last_time': last_time}
                print(value)
                inres = rsSqlExe(ins, value, )
                sel = "select  LAST_INSERT_ID() as MO "
                s = rsSqlExe(sel)
                print('insert id ' + str(s))
                for i in range(1, nrows):
                    rowValues = table.row_values(i)  # 一行的数据
                    getSql(ncole, rowValues,s[0]['MO'])
    else:
        print("get request")
        myform = FileUploadForm()
    ret = {"code": 500, "msg": "操作失败"}
    return HttpResponse(json.dumps(ret), content_type="application/json")


def getSql(var,colvalue,typeId):
    print(var)
    print(str(colvalue))
    sql = None
    value=None
    if var == 2:
        sql = 'insert into day_excel_model ( excel_id,column_1,column_2) ' \
              'VALUES (%(excel_id)s,%(column_1)s ,%(column_2)s )'
        value = {'column_1':colvalue[0],'column_2':colvalue[1]}
    elif var == 3:
        sql = 'insert into day_excel_model ( excel_id,column_1,column_2,column_3) ' \
              'VALUES (%(excel_id)s,%(column_1)s ,%(column_2)s ,%(column_3)s)'
        value = {'column_1': colvalue[0], 'column_2': colvalue[1],'column_3':colvalue[2]}
    elif var == 4:
        sql = 'insert into day_excel_model ( excel_id,column_1,column_2,column_3,column_4) ' \
              'VALUES (%(excel_id)s,%(column_1)s ,%(column_2)s ,%(column_3)s.%(column_4)s)'
        value = {'column_1': colvalue[0], 'column_2': colvalue[1], 'column_3': colvalue[2],'column_4':colvalue[3]}
    elif var == 5:
        sql = 'insert into day_excel_model ( excel_id,column_1,column_2,column_3,column_4,column_5) ' \
              'VALUES (%(excel_id)s,%(column_1)s ,%(column_2)s ,%(column_3)s.%(column_4)s,%(column_5)s)'
        value = {'column_1': colvalue[0], 'column_2': colvalue[1], 'column_3': colvalue[2],'column_4':colvalue[3],'column_5':colvalue[4]}
    elif var == 6:
        sql = 'insert into day_excel_model ( excel_id,column_1,column_2,column_3,column_4,column_5,column_6) ' \
              'VALUES (%(excel_id)s,%(column_0)s ,%(column_1)s ,%(column_2)s,%(column_3)s,%(column_4)s,%(column_5)s)'
        value = {'column_0': colvalue[0], 'column_1': colvalue[1], 'column_2': colvalue[2],
                 'column_3':colvalue[3],'column_4':colvalue[4],'column_5':colvalue[5]}
    elif var == 7:
        sql = 'insert into day_excel_model ( excel_id,column_1,column_2,column_3,column_4,column_5,column_6，column_7) ' \
              'VALUES (%(excel_id)s,%(column_0)s ,%(column_1)s ,%(column_2)s,%(column_3)s,%(column_4)s,%(column_5)s，%(column_6)s)'
        value = {'column_0': colvalue[0], 'column_1': colvalue[1], 'column_2': colvalue[2],
                 'column_3':colvalue[3],'column_4':colvalue[4],'column_5':colvalue[5],'column_6':colvalue[6]}
    elif var == 8:
        sql = 'insert into day_excel_model (excel_id, column_1,column_2,column_3,column_4,column_5,column_6，column_7,column_8)  ' \
              'VALUES (%(excel_id)s,%(column_0)s ,%(column_1)s ,%(column_2)s,%(column_3)s,%(column_4)s,%(column_5)s，%(column_6)s,%(column_7)s)'
        value = {'column_0': colvalue[0], 'column_1': colvalue[1], 'column_2': colvalue[2],
                 'column_3':colvalue[3],'column_4':colvalue[4],'column_5':colvalue[5],'column_6':colvalue[6],'column_7':colvalue[7]}
    elif var == 9:
        sql = 'insert into day_excel_model ( excel_id,column_1,column_2,column_3,column_4,column_5,column_6，column_7,' \
              'column_8,column_9)  ' \
              'VALUES (%(excel_id)s,%(column_0)s ,%(column_1)s ,%(column_2)s,%(column_3)s,%(column_4)s,%(column_5)s，%(column_6)s,%(column_7)s,' \
              '%(column_8))'
        value = {'column_0': colvalue[0], 'column_1': colvalue[1], 'column_2': colvalue[2],
                 'column_3':colvalue[3],'column_4':colvalue[4],'column_5':colvalue[5],'column_6':colvalue[6],'column_7':colvalue[7],
                 'column_8':colvalue[8]}
    elif var == 10:
        sql = 'insert into day_excel_model (excel_id,column_1,column_2,column_3,column_4,column_5,column_6，column_7,' \
              'column_8,column_9)  ' \
              'VALUES (%(excel_id)s,%(column_0)s ,%(column_1)s ,%(column_2)s,%(column_3)s,%(column_4)s,%(column_5)s，%(column_6)s,%(column_7)s,' \
              '%(column_8),%(column_9))'
        value = {'column_0': colvalue[0], 'column_1': colvalue[1], 'column_2': colvalue[2],
                 'column_3':colvalue[3],'column_4':colvalue[4],'column_5':colvalue[5],'column_6':colvalue[6],'column_7':colvalue[7],
                 'column_8':colvalue[8],'column_9':colvalue[9]}
    # value['excel_id']=
    value['excel_id']=typeId
    inres = rsSqlExeX(sql, value)
    print(str(inres))
