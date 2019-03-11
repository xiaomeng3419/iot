import os
import uuid
import json
from iot import settings
# from django.conf import settings
from django.core.cache import cache

def getUUid4():
    return uuid.uuid4().hex

#read cache user id
def read_from_cache(user_name):
    key = 'user_id_of_'+user_name
    value = cache.get(key)
    if value == None:
        data = None
    else:
        data = json.loads(value)
    print(str(data))
    return data

#write cache user id
def write_to_cache(user_name):
    key = 'user_id_of_'+user_name
    cache.set(key, json.dumps(user_name), settings.NEVER_REDIS_TIMEOUT)

if __name__ == '__main__':
    temp = uuid.uuid4().hex
    print(temp)
    print("----------------------")
    # print(request.session[])
    # write_to_cache(user_name="zhangpan")
    # read_from_cache(user_name="zhangpan")
    print("----------------------")
