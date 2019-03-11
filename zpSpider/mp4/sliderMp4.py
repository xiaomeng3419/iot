import requests
import time


def downloadBzhan(url,path):
    print(path)
    start = time.time()
    size = 0
    header = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36"
    }
    response = requests.get(url,headers = header,stream=True)
    chunk_size = 1024
    content_size = int(response.headers['content-length'])#总大小
    if response.status_code == 200:
        print("【文件大小】:%0.2f MB"%(content_size / chunk_size /1024))
        with open(path,'wb') as file:
            for data in  response.iter_content(chunk_size=chunk_size):
                file.write(data)
                size += len(data)
                print('\r'+'【下载进度】:%s %.2f%%' % ('>' *int(size*50/content_size),float(size/content_size*100)),end='')
    end = time.time()
    print("用时%s"%str(end-start))


url = "http://api.vc.bilibili.com/board/v1/ranking/top?"
for i in range(1):
    num = i*10+1;
    dat = {
        "page_size":10,
        "next_offset":str(num),
        "tag":'今日热门',
        "platform":'pc'
    }
    html = requests.get(url,params=dat).json()
    infos = html["data"]['items']
    header={
        "User-Agent":"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36"
    }
    for info in  infos:
        name = info["item"]['description']
        video_playurl = info['item']['video_playurl']
        print(name,video_playurl)
        try:
            downloadBzhan(video_playurl,path="%s.mp4"%time.time())
            # data = requests.get(video_playurl,headers = header,timeout=30).content
            # with open("%s.mp4"%name,'wb') as fn:
            #     fn.write(data)
            print("成功下载")

        except :
            raise
            print("fail")
