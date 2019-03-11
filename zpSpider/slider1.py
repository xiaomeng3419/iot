# import requests
# from bs4 import BeautifulSoup
# def content(url):
#     text = requests.get(url)
#     text.encoding = 'utf-8'
#     soup2 = BeautifulSoup(text.text,'html5lib')
#     header2 = soup2.select('h1')[0].text
#     text2 = soup2.select('#artibody')[0].text
#     time2 = soup2.select('.time-source')[0].text
#     print(header2,text2,time2,'\n\n\n')
# res = requests.get('http://news.sina.com.cn/china/')
# res.encoding = 'utf-8'
# soup = BeautifulSoup(res.text,"html5lib")
# for news in soup.select('.news-item'):
#     if len(news.select('h2')) > 0:
#         header = news.select('h2')[0].text
#         link = news.select('a')[0]['href']
#         time = news.select('.time')[0].text
#         print(link,time)
#         content(link)

import requests
from bs4 import BeautifulSoup
import re
import json
import pandas
res = requests.get("http://news.sina.com.cn/china/")
res.encoding='utf-8'
soup = BeautifulSoup(res.text,'html.parser')
# for news in soup.select('.news-item'):
#     if len(news.select('h2'))>0:
#         h2 = news.select('h2')[0].text
#         a = news.select('a')[0]['href']
#         time = news.select('.time')[0].text
#         print(news.select('h2')[0].text)
#         print(a)
#         print(time)

# res1 = requests.get("http://news.sina.com.cn/c/2018-07-05/doc-ihexfcvk0690918.shtml")
# res1.encoding='utf-8'
# soup2 = BeautifulSoup(res1.text,'html.parser')
# print(soup2.select('.main-title')[0].text)
# print(soup2.select('.article')[0].text)
# print(soup2.select('.show_author')[0].text)
# print(soup2.select('.date-source a')[0].text)
# print(soup2.select('.date-source')[0].contents[1].text)
# print(type(soup2.select('.date-source')[0].contents[1]))
#
# res3 = requests.get("http://comment5.news.sina.com.cn/page/info?version=1&format=json&channel=gn&newsid=comos-hexfcvk0460684&group=undefined&compress=0&ie=utf-8&oe=utf-8"
#                     "&page=1&page_size=3")
# js = json.loads(res3.text.strip('var data='))
# print(js)
# print(js['result']['count']['total'])

newsurl = "http://news.sina.com.cn/s/2018-07-05/doc-ihexfcvk0460684.shtml"
# newid = newsurl.split('/')[-1].rsplit('.shtml').lstrip('doc-i')
# print(newsurl.split('/')[-1].rsplit('.shtml')[0].lstrip('doc-i'))

commentUrl = "http://comment5.news.sina.com.cn/page/info?version=1&format=json&channel=gn&" \
             "newsid=comos-{}&group=undefined&compress=0&ie=utf-8&oe=utf-8" \
             "&page=1&page_size=3"

def getConmentNum(url):
    res3 = requests.get(commentUrl.format(getNewsId(url)))
    js = json.loads(res3.text.strip('var data='))
    d = js['result']['count']['total']
    # print(js)
    print(js['result']['count']['total'])
    return d

def getNewsId(url):
    m = re.search('doc-i(.+).shtml',url)
    newsId = m.group(1)
    return newsId

def getNewDetail(newUrl):
    newData = {}
    vo = requests.get(newUrl)
    vo.encoding='utf-8'
    vosoup = BeautifulSoup(vo.text,'html.parser')
    newData['id'] = getNewsId(newUrl)
    newData['title'] = vosoup.select('.main-title')[0].text
    newData['urlSource'] = vosoup.select('.source')[0].text
    newData['aritcle'] = vosoup.select('.article')[0].text
    newData['urlHttp'] = newUrl
    newData['dt'] =vosoup.select('.date-source')[0].contents[1].text
    newData['editor'] =vosoup.select('.show_author')[0].text
    newData['comments'] =getConmentNum(newUrl)
    return newData


listurls = "http://api.roll.news.sina.com.cn/zt_list?channel=news&cat_1=gnxw&cat_2==gdxw1||=gatxw||=zs-pl||=mtjj&level==1||=2" \
          "&show_ext=1&show_all=1&show_num=22&tag=1&format=json&page={}&callback=newsloadercallback&_=1530798907150"
# print
listurl = "http://api.roll.news.sina.com.cn/zt_list?channel=news&cat_1=gnxw&cat_2==gdxw1||=gatxw||=zs-pl||=mtjj" \
           "&level==1||=2&show_ext=1&show_all=1&show_num=22&tag=1&format=json&page={}&callback=newsloadercallback&_=1530960997000"
def parseListLink(listUrl):
    listLink = []
    newDetails = []
    urls = requests.get(listurl)
    urls.encoding='utf-8'
    print(json.loads(urls.text.lstrip('  newsloadercallback(').rstrip(');')))
    lists = json.loads(urls.text.lstrip('  newsloadercallback(').rstrip(');'))
    for ent in lists['result']['data']:
        # listLink.append(ent['url'])
        newDetails.append(getNewDetail(ent['url']))
        print(ent['url'])
    return newDetails
# urlssoup = BeautifulSoup(urls.text,'')
# print(parseListLink(listurl))

# news_total = []
# for i in range(1,2):
#     print(listurl.format(i))
#     newsurls = listurl.format(i)
#     newarrary = parseListLink(newsurl)
#     news_total.extend(newarrary)

# df = pandas.DataFrame(news_total)
# df.head()
# df.to_excel("d:/temp.xlsx")
# print(getConmentNum(newsurl))
# print(getNewsId(newsurl))
# print(getNewDetail(newsurl))


from googletrans import Translator

if __name__ == "__main__":
    translator = Translator(service_urls=['translate.google.cn'])
    source = 'I am still not happy!！'
    text = translator.translate(source,  src='en', dest='zh-cn').text
    print(text)