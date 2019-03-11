from django.conf.urls import url
from . import views
from django.contrib import admin
from apscheduler.scheduler import Scheduler

# from push.views import checkUserFiles
app_name = 'blog'  # 关键是这行
urlpatterns = [
    # url(r'^logout/', views.logout),
    url(r'^createBlog/', views.createBlog),
    url(r'^getClassfies/', views.getClassfies),
    url(r'^sqlexe/', views.useSqlRes),
    url(r'^getTopBlog/', views.getBlogsByUserID),
    url(r'^getBlogsByBlogID/',views.getBlogsByBlogID),
]