from rest_framework import serializers
from .models import Blog_classfies

class BlogCSerializer(serializers.ModelSerializer):
    class Meta:
        model = Blog_classfies
        fields = '__all__'