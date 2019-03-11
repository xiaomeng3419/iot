# coding: utf-8
from .settings import EXCLUDE_URL
from django.shortcuts import HttpResponseRedirect
import re
from django.http import HttpResponse
from  django.utils.deprecation import MiddlewareMixin
import json
exclued_path = [re.compile(item) for item in EXCLUDE_URL]
from django.core.cache import cache

class PubAuthMiddleWare(MiddlewareMixin):
    def process_request(self, request):
        print("---------------- filter start ---------------------")
        # print("---------------- filter start ---------------------")
        # print("---token" + str(request.body))
        # print("blogtoken:"+request.session["zhangpanuser"])
        url_path = request.path
        print(str(url_path))
        if str(url_path).strip() == '/':
            return

        for each in exclued_path:
            if re.match(each, url_path):
                print("-----------------------2  ")
                print(url_path)
                print(each)
                return
        # if request.user.is_authenticated:
        # print("_++++++++++++++++"+str(request.body, encoding = "utf-8"))
        if str(request.body).strip() != '':
            return
        ob = json.loads(str(request.body, encoding = "utf-8"))
        # print(type(ob))
        dic =list(ob.keys())
        # print(dic)
        islogin = False
        # print("web get token:"+ob["token"])
        try:
            print(ob["token"])
            print("-----------------------  ")
            print(request.session[str(ob["token"])])
            print("-----------------------  ")
            ca = request.session[str(ob["token"])]
        except Exception as err:
            ret = {"code": 401, "msg": "please login! "}
            return HttpResponse(json.dumps(ret), content_type="application/json",status=401)
        if ca is None:
            ret = {"code": 401, "msg": "please login! "}
            return HttpResponse(json.dumps(ret), content_type="application/json",status=401)
        # for var in dic:
        #     print("--------"+str(var))
        #     if str(var).endswith("user"):
        #         print(request.session["zhangpanuser"])
        #         print(ob[str(var)])
        #         if request.session[str(var)] == ob[str(var)] :
        #             islogin = True
        #             break
        #         else:
        #             islogin = False
        #             break
        #
        # if not islogin :
        #     ret = {"code": 500, "update": "auth failed! "}
        #     return HttpResponse(json.dumps(ret), content_type="application/json")
        # print("blogtoken:" + request.session["zhangpanuser"])
        # request.session["zhangpanuser"] = request.session["zhangpanuser"]
