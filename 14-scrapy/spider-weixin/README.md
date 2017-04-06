# 爬取微信相关信息  

## scrapy 工程爬取
新建工程：
> scrapy startproject weixin

执行工程：
> cd weixin  
> scrapy crawl weixin
## 微信公众号 scrapy 工程爬取
[http://weixin.sogou.com/](http://weixin.sogou.com/)
新建工程：
> scrapy startproject OfficialAccounts

执行工程：
> cd OfficialAccounts  
  
新增“大数据文摘”公众号文章的爬取  
> scrapy genspider dashujuwenzhai qq.com  
> scrapy crawl dashujuwenzhai

新增“大数据文摘”公众号文章的爬取并保存到MySQL数据库 
> scrapy crawl dashujuwenzhai2mysql


新增通用公众号文章的爬取并保存到MySQL数据库 
> scrapy crawl common2mysql -a query=1  
> scrapy crawl common2mysql -a query=han