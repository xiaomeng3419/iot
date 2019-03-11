from django.shortcuts import render
from django.shortcuts import redirect
from django.forms.models import model_to_dict
import json
from iot.utils.QuerySetToJson import queryset_to_json
from login.models import User,Department
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse,HttpResponseRedirect
from django.http import HttpResponse
from django.db import connection,transaction
#
# from rest_framework_swagger.views import get_swagger_view

# schema_view = get_swagger_view(title='Pastebin API')
#
import logging
import os
import logging.config
import yaml
print ("os.path.realpath(__file__)=%s" % os.path.realpath(__file__))
logging.config.dictConfig(yaml.load(open('E:/common/Python/lib/site-packages/django/bin/iot/logging.yaml', 'r')))
# logging.config.fileConfig("../logger.conf",disable_existing_loggers=False)
logger = logging.getLogger("all")
from login.RandomChar import ImageChar
from .utils import check_code
from .utils import uucode
@csrf_exempt
def some_view(request):
     print("fdsa")

def index(request):
    pass
    return render(request, 'login/index.html')

# @api_view(['GET','POST'])
def login(request):
    print("--------------login input ---------------------")
    print("--------------login input ---------------------")
    if request.method == "POST":
        print(request.body)
        name = json.loads(request.body).get("name")
        password = json.loads(request.body).get("password")
        print(str(password))
        print(str(name))
        # ret = {"code": 501, "update": "failed"}
        user = User.objects.filter(name__exact=name, password__exact=password)
        # user = User.objects.filter(name__exact="zhangpan", password__exact="12345678")
        if user:
            # logger.info("login success"+str(user))

            uuid = uucode.getUUid4()
            # 清除session的语法是： del request.session[key]
            # 清除session的语法是： del request.session[key]
            request.session[uuid]=user.values()[0]
            print("---token:key:"+str(name)+"user\n" +"value:"+str(request.session[uuid]))
            # print("---token:key:"+str(name)+"user\n" +"value:"+request.session[str(name)+"user"])
            # print(user)
            ret = {"code": 200, "update": "success","data":{"token": uuid}}
            return HttpResponse(json.dumps(ret), content_type="application/json")
            # return redirect('/#/home')
            # return str(ret)
        else:
            logger.error(user)
            print(user)
            print("login failed")
            ret = {"code": 501, "msg": "failed"}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    return redirect('/#/login')


def register(request):
    pass
    return render(request, 'localhost:8100/#/login')

def getDepartment(request):
    if request.method == "POST":
        departments = Department.objects.all()
        result = queryset_to_json(departments)
        ret = {"code": 200, "msg": "success", "data": result}
        return HttpResponse(json.dumps(ret), content_type="application/json")
    else:
        ret = {"code": 501, "msg": "failed"}
        return HttpResponse(json.dumps(ret), content_type="application/json")


def logout(request):
    pass
    return redirect("/index/")

def ods():
    username = "zhangpan"
    password = "12345678"
    future_question = User(name__exact=username, password__password=password)
    print(future_question)



def register(request):
    if request.method == "POST":
        try:
            rb = json.loads(request.body)
            name = rb.get("name")
            sql = "select count(id) as num from login_user WHERE login_user.name = %(name)s"
            value = {"name":name}
            pre = rsSqlExe(sql,value)
            if pre[0]['num'] > 0 :
                ret = {"code": 201, "msg": "用户名已注册"}
                return HttpResponse(json.dumps(ret), content_type="application/json")
            password = rb.get("password")
            stuno = rb.get("stuno")
            departmentcode = rb.get("departmentcode")
            phone = rb.get("phone")
            email = rb.get("email")
            sex = rb.get("sex")
            print(sex)
            regis = User.objects.create(name=name,stuno=stuno,password=password,email=email,departmentcode=departmentcode,phone=phone,sex=sex)
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

# def verify_code(request):
#     """get ruandom verify code"""
#     #下面这个得到随机数的方法，自己可以实现，记住这个验证码也要放到session中，这样才好与客户端请求验证码对比
#     randomChar = randomCharCode();
#     request.session['verifycode'] = randomChar.lower()
#     ic = ImageChar(fontColor=(100,211, 90))
#     ic.renderChar(randomChar);
#     imgStr = ic.getBaseB64ImageStr();
#     response = HttpResponse(imgStr,"image/jpeg")
#     return response

from io import BytesIO
def create_code_img(request):
    f = BytesIO()
    #直接在内存开辟一点空间存放临时生成的图片
    img, code = check_code.create_validate_code() #调用check_code生成照片和验证码
    request.session['check_code'] = code #将验证码存在服务器的session中，用于校验
    img.save(f,'PNG') #生成的图片放置于开辟的内存中
    return HttpResponse(f.getvalue())  #将内存的数据读取出来，并以HttpResponse返回



# def verify_code(request):
#     """get ruandom verify code"""
#     #下面这个得到随机数的方法，自己可以实现，记住这个验证码也要放到session中，这样才好与客户端请求验证码对比
#     # randomChar = randomCharCode();
#     randomChar = "ACdsd";
#     request.session['verifycode'] = randomChar.lower()
#     ic = ImageChar(fontColor=(100,211, 90))
#     ic.renderChar(randomChar);
#     imgStr = ic.getBaseB64ImageStr();
#     response = HttpResponse(imgStr,"image/jpeg")
#     return response
from login.utils import check_code
def verify_code(request):
    logger.info("timestamp : "+request.GET.get('timestamp'))
    img, strs = check_code.create_validate_code(size=(120, 30));
    print("-------------------------------------------------------")
    print(strs)
    print("-------------------------------------------------------")
    request.session['verifycode'] = strs.lower()
    print(request.session['verifycode'])
    jpeg_image_buffer = BytesIO()
    img.save(jpeg_image_buffer, format="png")
    response = HttpResponse(jpeg_image_buffer.getvalue())
    return response
#
# def verify_code(request):
#     #引入随机函数模块
#     import random
#     #定义变量，用于画面的背景色、宽、高
#     bgcolor = (random.randrange(20, 100), random.randrange(
#         20, 100), 255)
#     width = 100
#     height = 25
#     #创建画面对象
#     im = Image.new('RGB', (width, height), bgcolor)
#     #创建画笔对象
#     draw = ImageDraw.Draw(im)
#     #调用画笔的point()函数绘制噪点
#     for i in range(0, 100):
#         xy = (random.randrange(0, width), random.randrange(0, height))
#         fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
#         draw.point(xy, fill=fill)
#     #定义验证码的备选值
#     str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
#     #随机选取4个值作为验证码
#     rand_str = ''
#     for i in range(0, 4):
#         rand_str += str1[random.randrange(0, len(str1))]
#     #构造字体对象，ubuntu的字体路径为“/usr/share/fonts/truetype/freefont”
#     font = ImageFont.truetype('FreeMono.ttf', 23)
#     #构造字体颜色
#     fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
#     #绘制4个字
#     draw.text((5, 2), rand_str[0], font=font, fill=fontcolor)
#     draw.text((25, 2), rand_str[1], font=font, fill=fontcolor)
#     draw.text((50, 2), rand_str[2], font=font, fill=fontcolor)
#     draw.text((75, 2), rand_str[3], font=font, fill=fontcolor)
#     #释放画笔
#     del draw
#     #存入session，用于做进一步验证
#     request.session['verifycode'] = rand_str
#     """
#     python2的为
#     # 内存文件操作
#     import cStringIO
#     buf = cStringIO.StringIO()
#     """
#     # 内存文件操作-->此方法为python3的
#     import io
#     buf = io.BytesIO()
#     #将图片保存在内存中，文件类型为png
#     im.save(buf, 'png')
#     #将内存中的图片数据返回给客户端，MIME类型为图片png
#     return HttpResponse(buf.getvalue(), 'image/png')
from iot.utils import QuerySetToJson
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


from googletrans import Translator
def translate(request):
    if request.method == "POST":
        try:
            rb = json.loads(request.body)
            content = rb.get("content")

            translator = Translator(service_urls=['translate.google.cn'])
            source = str(content)
            text = translator.translate(source, src='en', dest='zh-cn').text

            print(text)
            ret = {"code": 200, "update": str(text)}
            return HttpResponse(json.dumps(ret), content_type="application/json")
        except Exception as err:
            print(err)
            ret = {"code": 501, "msg": "failed"}
            return HttpResponse(json.dumps(ret), content_type="application/json")
    else:
         ret = {"code": 501, "msg": "failed"}
         return HttpResponse(json.dumps(ret), content_type="application/json")