from django.db import models

# Create your models here.
class TNews(models.Model):
    news_id = models.CharField(max_length=128,unique=True)
    title = models.CharField(max_length=128,unique=True)
    article = models.CharField(max_length=20000)
    publish_time = models.CharField(max_length=256)
    author = models.CharField(max_length=256)
    url_http = models.CharField(max_length=256)
    img_tp = models.CharField(max_length=256)
    img_url = models.CharField(max_length=256)
    comments_num = models.IntegerField(default=0)
    resouces = models.CharField(max_length=256)
    createtime = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.news_id

# TODO 图片功能还没有加上去，日后需求定义
'''
news id             新闻id
title               新闻标题
article             新闻内容
publish_time        新闻的发布原网站的时间
author              新闻的作者
url_http            新闻的原网站地址
img_tp              图片的拓展字段
img_url             图片地址
comments_num        评论数量
resources           新闻来源（原网站）
createtime          创建时间
'''