from django.conf.urls import url
from . import views
from django.contrib import admin
from apscheduler.scheduler import Scheduler

# from push.views import checkUserFiles
app_name = 'zpSpider'  # 关键是这行
urlpatterns = [
    # url(r'^logout/', views.logout),
    url(r'^sliderNews/', views.convertToDb),
    url(r'^getNewsById/', views.getNewsPg),
    url(r'^getStream/', views.stream_video),
]