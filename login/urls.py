# from django.conf.urls import url
# from . import views
#
# app_name = 'polls'
#
# urlpatterns = [
#     # ex: /polls/
#     url(r'^$', views.index, name='index'),
#     # ex: /polls/5/
#     url(r'^(?P<question_id>[0-9]+)/', views.detail, name='detail'),
#     # ex: /polls/5/results/
#     url(r'^(?P<question_id>[0-9]+)/results/', views.results, name='results'),
#     # ex: /polls/5/vote/
#     url(r'^(?P<question_id>[0-9]+)/vote/', views.vote, name='vote'),
# ]
from django.conf.urls import url
from . import views
from django.contrib import admin

app_name = 'login'  # 关键是这行
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^index/', views.index),
    url(r'^login$', views.login),
    url(r'^register/', views.register),
    url(r'^logout/', views.logout),
    url(r'^register/', views.register),
    url(r'^getdepartments/', views.getDepartment),
    url(r'^create_code_img/', views.verify_code),
    url(r'^translate/', views.translate),
]