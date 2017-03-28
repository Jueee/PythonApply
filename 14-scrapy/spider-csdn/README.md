# 爬取 CSDN 博客目录数据 #  
[http://blog.csdn.net/oYunTaoLianWu/article/list](http://blog.csdn.net/oYunTaoLianWu/article/list "http://blog.csdn.net/oYunTaoLianWu/article/list")

## 单一文件爬取 ##
按 css 路径提取
> scrapy runspider spider-mybloglist-css.py -o bloglist.json  

按 xpath 路径提取
> scrapy runspider spider-mybloglist-xpath.py -o bloglist.json   
## scrapy 工程爬取 ##
新建工程：
> scrapy startproject csdnblog

执行工程：
> cd csdnblog  
> scrapy crawl csdnbloglist

【注】“csdnbloglist”来自  
	

>csdnblog\csdnblog\spiders\__init__.py  

> 	class CSDNBlogList(scrapy.Spider):  
    	"""docstring for CSDNBlogList"""  
    	name = 'csdnbloglist'