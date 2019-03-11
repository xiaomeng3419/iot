from django.conf.urls import url
from . import views
from django.contrib import admin
from apscheduler.scheduler import Scheduler

# from push.views import checkUserFiles
app_name = 'day'  # 关键是这行
urlpatterns = [
    # url(r'^logout/', views.logout),
    url(r'^punch/', views.dayPunch),
    url(r'^getRank/', views.getRank),
    url(r'^getRankScore/', views.getRankScore),
    url(r'^getUserPunch/', views.getUserPunch),
    url(r'^upload/', views.upload),
]