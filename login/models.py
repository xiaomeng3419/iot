from django.db import models
import datetime


def getDateF( fields=None):
    if type(fields) is datetime.date or type(fields) is datetime.datetime:
        #                     fieldValue = fieldValue.isoformat()
        fields = datetime.datetime.strftime(fields, '%Y-%m-%d %H:%M:%S')
    return fields
# Create your models here.
class User(models.Model):
    gender = (
        ('male','男'),
        ('female', '女'),
    )
    name = models.CharField(max_length=128,unique=True)
    stuno = models.CharField(max_length=128,null=True)
    password = models.CharField(max_length=256)
    departmentcode = models.IntegerField(default='0',null=True)
    status = models.IntegerField(default='0',null=True)
    phone = models.CharField(max_length=256,null=True)
    email = models.EmailField(unique=True)
    sex = models.CharField(max_length=32,choices=gender,default="男")
    createtime = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ["-createtime"]
        verbose_name = "用户"
        verbose_name_plural = "用户"

class Department(models.Model):
    departmentname = models.CharField(max_length=128,unique=True)
    departmentcode = models.CharField(max_length=128,null=True)
    email = models.EmailField(unique=True,null=True)
    createtime = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.departmentname

    def toDict(self):
        return dict([(attr, getDateF(fields = getattr(self, attr))) for attr in
                     [f.name for f in self._meta.fields]])

