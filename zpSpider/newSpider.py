import requests
import re
import json
import pandas
from bs4 import BeautifulSoup
from datetime import datetime


def getNewsDetail(newsurl):
    result = {}
    res = requests.get(newsurl)
    res.encoding = 'utf-8'
    soup = BeautifulSoup(res.text, 'html.parser')
    result['title'] = soup.select('.main-title')[0].text
    result['newssource'] = soup.select('.date-source a')[0].contents[0]
    timesource = soup.select('span.date')[0].text
    result['dt'] = datetime.strptime(timesource, '%Y年%m月%d日 %H:%M')
    result['article'] = '@'.join([p.text.strip() for p in soup.select('#article p')[:-1]])
    result['editor'] = soup.select('.show_author')[0].text.lstrip('责任编辑：')
    result['comments'] = getCommentCounts(newsurl)
    return result


comentURL = 'http://comment5.news.sina.com.cn/page/info?version=1&\
format=json&channel=gn&newsid=comos-{}&group=undefined&compress=0&\
ie=utf-8&oe=utf-8&page=1&page_size=3&t_size=3&h_size=3&thread=1&\
callback=jsonp_1519551354078&_=1519551354078'


def getCommentCounts(newsurl):
    m = re.search('doc-i(.*).shtml', newsurl)
    newsid = m.group(1)
    coments = requests.get(comentURL.format(newsid))
    jd = json.loads(coments.text.strip('jsonp_1519551354078(').rstrip(')'))
    return jd['result']['count']['total']


res = requests.get('http://news.sina.com.cn/china/')
res.encoding = 'utf-8'
soup = BeautifulSoup(res.text, 'html.parser')

newsdetails = []
news_total = []

# -----------------1-----------------
# for news1 in soup.select('.news-item'):
#     if len(news1.select('h2')) > 0 :
#         a = news1.select('a')[0]['href']
#         newsdetails.append(getNewsDetail(a))
#         newsary = getNewsDetail(a)
#         news_total.extend(newsdetails)
#         print(newsdetails)
# -----------------1-----------------

# -----------------2-----------------
for news1 in soup.select('.news-item'):
    if len(news1.select('h2')) > 0:
        a = news1.select('a')[0]['href']
        ah2 = {}
        ah2['title'] = news1.select('h2')[0].text
        ah2['url'] = news1.select('a')[0]['href']
        newsdetails.append([a])
        newsary = ah2
        news_total.extend([ah2])
# -----------------2-----------------


df = pandas.DataFrame(news_total)
df.to_excel('news.xlsx')
print(df)