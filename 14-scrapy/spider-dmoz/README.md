# 爬取 dmoz 数据 #  
目标站点：[http://www.dmoz.org/](http://www.dmoz.org/)  
由于站点切换，新站点地址：[http://dmoztools.net/](http://dmoztools.net/)  
  
  
【注】本项目基于 Scrapy1.0 的官方文档。  
[https://doc.scrapy.org/en/1.0/intro/tutorial.html](https://doc.scrapy.org/en/1.0/intro/tutorial.html)  
中文翻译站点：  
[http://scrapy-chs.readthedocs.io/zh_CN/1.0/intro/tutorial.html](http://scrapy-chs.readthedocs.io/zh_CN/1.0/intro/tutorial.html)  



## dmozspider 爬取 ##
新建工程：
> scrapy startproject dmozspider

执行工程：
> cd dmozspider  
> scrapy crawl dmoz

后台打印日志
> scrapy crawl dmozspider --set LOG_FILE=log

循环爬取不同的站点，并保存数据  
起始节点：[http://dmoztools.net/Computers/Programming/Languages/Python](http://dmoztools.net/Computers/Programming/Languages/Python) 
> scrapy crawl dmozall -o items.json

