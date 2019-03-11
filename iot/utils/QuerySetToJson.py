import datetime
from enum import Enum, unique
import requests
import decimal

def dictfetchallY(cursor):
    # "将游标返回的结果保存到一个字典对象中"
    res = []
    dd = []
    desc = cursor.description
    ds = []
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

def getRuquestRemoteAddress(request):
    ip = ""
    # TODO 注释的事python2的写法
    # if request.META.has_key('HTTP_X_FORWARDED_FOR'):
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        ip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']
    return ip


def dictfetchallX(cursor):
    # "将游标返回的结果保存到一个字典对象中"
    res = []
    dd = []
    desc = cursor.description
    ds = []
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
            elif isinstance(row[attr], decimal.Decimal):
                d[attr] = float(row[attr])
            elif isinstance(row[attr], str):
                d[attr] = str(row[attr])
            else:
                d[attr] = row[attr]
        dd.append(d)
    return dd

# 原始模型查询出来的结果转为json
def queryset_to_json(queryset):
    obj_arr = []
    for o in queryset:
        obj_arr.append(o.toDict())
    return obj_arr