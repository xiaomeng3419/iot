"""iot URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from .swagger_views import SwaggerSchemaView
from django.contrib import admin
from django.urls import path
from django.conf.urls import include, url
from cmdb import views
from django.views.generic.base import TemplateView


from login.models import User
from login import views as UserViewSet
from rest_framework import routers, serializers, viewsets

# Serializers定义了API的表现.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'is_staff')

# ViewSets 定义了 视图（view） 的行为.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

# Routers 提供了一种简单途径，自动地配置了URL。
router = routers.DefaultRouter()
router.register(r'users', UserViewSet)

# from polls import views as view_polls
# from django.conf.urls import url
urlpatterns = [
    path('admin/', admin.site.urls),
    path(r'', TemplateView.as_view(template_name="index.html")),
    # path('login', TemplateView.as_view(template_name="login/login.html")),
    path('index/',views.index),
    path('pdf/',views.get_pdf),
    path('login/',include("login.urls")),
    path('blog/',include("blog.urls")),
    path('day/',include("day.urls")),
    # url(r'^polls/', include('polls.url')),
    path('polls/',include('polls.urls')),
    path('zpSpider/',include('zpSpider.urls')),
    # url(r'^docs/$', include('rest_framework_swagger.urls')),
    url(r'^api-doc/$', SwaggerSchemaView.as_view(), name='docs'),
    url(r'^', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
]
