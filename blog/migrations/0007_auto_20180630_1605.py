# Generated by Django 2.0.4 on 2018-06-30 08:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_auto_20180612_1532'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='blog_classfies',
            options={'managed': False},
        ),
        migrations.AddField(
            model_name='blog',
            name='remote_ip',
            field=models.CharField(default='0.0.0.0', max_length=256),
        ),
    ]
