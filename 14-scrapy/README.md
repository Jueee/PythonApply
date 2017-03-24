# scrapy模块的使用 #
### scrapy的安装 ###
> pip install scrapy 
 
或  
> python2 -m pip install -U scrapy  
> python3 -m pip install -U scrapy
### scrapy的使用样例 ###
> scrapy runspider shareditor.py
### scrapy创建网络爬虫 ###
> scrapy startproject myfirstpro  

####settings.py——爬虫的配置文件####
<table>
<tr>
    <th>USER_AGENT</th>
    <th>发http请求时的指明</th>
</tr>
<tr>
    <th>ROBOTSTXT_OBEY</th>
    <th>是否遵守robots协议（被封禁的不抓取）</th>
</tr>
<tr>
    <th>DOWNLOAD_DELAY</th>
    <th>对同一个站点抓取延迟</th>
</tr>
<tr>
    <th>CONCURRENT_REQUESTS_PER_DOMAIN</th>
    <th>对同一个站点并发有多少个线程抓取</th>
</tr>
<tr>
    <th>CONCURRENT_REQUESTS_PER_IP</th>
    <th>对同一个站点并发有多少个IP抓取</th>
</tr>
</table>
执行网络爬虫
> scrapy crawl shareditor  
### scrapy调试页面解析 ###  
> scrapy shell http://www.shareditor.com/  

进入调试终端，可以直接使用request、response等变量来做各种操作尝试

【注意】  
1. 如果想获取文本，调用selector的xpath方法后要调用extract()方法  
2. 如果想找到第一个匹配xpath的内容，需要调用extract_first()方法  
