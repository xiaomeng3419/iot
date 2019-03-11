# from django.shortcuts import render
from django.shortcuts import render

# Create your views here.
from io import BytesIO
from reportlab.pdfgen import canvas
from django.http import HttpResponse

def index(request):
    # return HttpResponse("HELLOWORLD!")
    return render(request,"index.html")

def get_pdf(request):
    # 创建带有PDF头部定义的HttpResponse对象
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="somefilename.pdf"'

    # 创建一个PDF对象，并使用响应对象作为它要处理的‘文件’
    p = canvas.Canvas(response)

    # 通过PDF对象的drawString方法，写入一条信息。具体参考模块的官方文档说明。
    p.drawString(100, 100, "Hello world.")

    # 关闭PDF对象
    p.showPage()
    p.save()
    return response