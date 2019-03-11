from django.db import models
import datetime

# Create your models here.
'''
models.DateTimeField attribute
auto_now recode alter update time in everytime
auto_now_add : only create add createtime
'''


def getDateF( fields=None):
    if type(fields) is datetime.date or type(fields) is datetime.datetime:
        #                     fieldValue = fieldValue.isoformat()
        fields = datetime.datetime.strftime(fields, '%Y-%m-%d %H:%M:%S')
    return fields

class Blog_classfies(models.Model):
    class_name = models.CharField(max_length=128,unique=True)
    class_content = models.CharField(max_length=256)
    updatetime = models.DateTimeField(auto_now=True)
    createtime = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.class_name

    def __unicode__(self):
        return self.class_name
        # 将属性和属性值转换成dict 列表生成式
    def toDict(self):
        return dict([(attr, getDateF(fields = getattr(self, attr))) for attr in
                     [f.name for f in self._meta.fields]])

    def toJSON(self):
        fields = []
        for field in self._meta.fields:
            fields.append(field.name)

        d = {}
        for attr in fields:
            if isinstance(getattr(self, attr), datetime.datetime):
                d[attr] = getattr(self, attr).strftime('%Y-%m-%d %H:%M:%S')
            elif isinstance(getattr(self, attr), datetime.date):
                d[attr] = getattr(self, attr).strftime('%Y-%m-%d')
            else:
                d[attr] = getattr(self, attr)

        import json
        return json.dumps(d)



    class Meta:
        managed = False
        db_table = 'blog_blog_classfies'
'''
外键写法：
注意被关联的表需要写在主表（关联的表）前面
'''
class Blog(models.Model):
    blog_name = models.CharField(max_length=128,unique=True)
    blog_content = models.CharField(max_length=256)
    email = models.EmailField(unique=True)
    blog_tag = models.CharField(max_length=256, null=True)
    # classfy = models.ForeignKey(Blog_classfies, on_delete=models.CASCADE)
    classfy = models.IntegerField()
    updatetime = models.DateTimeField(auto_now=True)
    createtime = models.DateTimeField(auto_now_add=True)
    user_id  = models.IntegerField(null=True)
    remote_ip = models.CharField(max_length=256,default="0.0.0.0")
    editor_flag = models.IntegerField(default=0)
    access_num = models.IntegerField(default=0)

    def __str__(self):
        return self.blog_name


