from django.db import models
from django.utils.encoding import python_2_unicode_compatible
import datetime
from django.utils import timezone

# Create your models here.
@python_2_unicode_compatible #支持py2需要加的
class Question(models.Model):
    # ...
    def __str__(self):  # 在python2版本中使用的是__unique__
        return self.question_text

    # ...
    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.pub_date <= now

    was_published_recently.admin_order_field = 'pub_date'
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'
    '''
    question string content
    pub_date  date publish time
    '''
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


@python_2_unicode_compatible
class Choice(models.Model):
    # ...
    def __str__(self):
        return self.choice_text
    question = models.ForeignKey(Question,on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)