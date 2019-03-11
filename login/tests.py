from django.test import TestCase
import datetime
from django.utils import timezone
from .models import User
# Create your tests here.
class QuestionMethodTests(TestCase):
    def future_question():
        """
        在将来发布的问卷应该返回False
        """
        username = "zhangpan"
        password = "12345678"
        future_question = User(name__exact=username,password__password=password)
        print(future_question)

