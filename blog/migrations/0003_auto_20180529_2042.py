# Generated by Django 2.0.4 on 2018-05-29 12:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20180529_2040'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='blog_classfies',
            name='blog_tag',
        ),
        migrations.AddField(
            model_name='blog',
            name='blog_tag',
            field=models.CharField(max_length=256, null=True),
        ),
    ]