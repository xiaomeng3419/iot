from django.db import models

# Create your models here.
class Punch(models.Model):
    user_id = models.CharField(max_length=256, null=True)
    day_time = models.CharField(max_length=256, null=True)
    first_time = models.DateTimeField()
    last_time = models.DateTimeField()
    delete = models.IntegerField(default=0)
    times = models.IntegerField(default=0)
    rates = models.DecimalField(max_digits=3,decimal_places=2)
    punch_host = models.CharField(max_length=256,default="")

    def __str__(self):
        return self.user_id

class Excel_Model(models.Model):
    column_1 = models.CharField(max_length=256, null=True)
    column_2 = models.CharField(max_length=256, null=True)
    column_3 = models.CharField(max_length=256, null=True)
    column_4 = models.CharField(max_length=256, null=True)
    column_5 = models.CharField(max_length=256, null=True)
    column_6 = models.CharField(max_length=256, null=True)
    column_7 = models.CharField(max_length=256, null=True)
    column_8 = models.CharField(max_length=256, null=True)
    column_9 = models.CharField(max_length=256, null=True)
    column_10 = models.CharField(max_length=256, null=True)
    column_11 = models.CharField(max_length=256, null=True)
    column_12 = models.CharField(max_length=256, null=True)
    column_13 = models.CharField(max_length=256, null=True)
    column_14 = models.CharField(max_length=256, null=True)
    column_15 = models.CharField(max_length=256, null=True)
    column_16 = models.CharField(max_length=256, null=True)
    column_17 = models.CharField(max_length=256, null=True)
    column_18 = models.CharField(max_length=256, null=True)
    column_19 = models.CharField(max_length=256, null=True)
    column_20 = models.CharField(max_length=256, null=True)
    field_name = models.CharField(max_length=1024, null=True)
    excel_id = models.CharField(max_length=256, null=True)
    createtime = models.DateTimeField(auto_now_add=True)
    delete = models.IntegerField(default=0)
    check_status = models.IntegerField(default=0)

    def __str__(self):
        return self.user_id


class Excel_Type(models.Model):
    # 上传的用户
    user_id = models.CharField(max_length=256, null=True)
    # 上传的用户
    notice_content = models.CharField(max_length=1024, null=True)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True,null=True)
    # 表名
    excel_name = models.CharField(max_length=256, null=True)
    # 是否推送
    is_push_check =  models.IntegerField(default=0)
    # 导入检验规则
    field_rule = models.CharField(max_length=256, null=True)
    # 是否关闭检验
    is_closed = models.IntegerField(default=2)
    # 校验截止日期
    last_time = models.DateTimeField()
    delete = models.IntegerField(default=0)
    field_name = models.CharField(max_length=1024, null=True)