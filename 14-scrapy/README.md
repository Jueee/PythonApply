# scrapy模块的使用 
### scrapy的安装 
> pip install scrapy 
 
或  
> python2 -m pip install -U scrapy  
> python3 -m pip install -U scrapy
### scrapy的使用样例  
【注】更详细的使用说明可以参见HelloWorld工程：  
[https://github.com/Jueee/PythonApply/tree/master/14-scrapy/spider-helloworld](https://github.com/Jueee/PythonApply/tree/master/14-scrapy/spider-helloworld)  

scrapy直接执行爬虫脚本
> scrapy runspider shareditor.py  

scrapy创建网络爬虫
> scrapy startproject myfirstpro 

执行网络爬虫 
> scrapy crawl shareditor  

创建一个新的spider
> scrapy genspider mydomain mydomain.com
### scrapy调试页面解析  

> scrapy shell http://www.shareditor.com/  

进入调试终端，可以直接使用request、response等变量来做各种操作尝试

【注意】  
1. 如果想获取文本，调用selector的xpath方法后要调用extract()方法  
2. 如果想找到第一个匹配xpath的内容，需要调用extract_first()方法  

## Scrapy提供的命令  
Scrapy提供了两种类型的命令。  
一种必须在Scrapy项目中运行(针对项目(Project-specific)的命令)，另外一种则不需要(全局命令)。  
全局命令在项目中运行时的表现可能会与在非项目中运行有些许差别(因为可能会使用项目的设定)。

全局命令:  

    startproject  
	settings  
	runspider  
	shell  
	fetch  
	view  
	version  

项目(Project-only)命令:

	crawl
	check
	list
	edit
	parse
	genspider
	bench


为了启用一个Item Pipeline组件，你必须将它的类在“settings.py”中添加到 ITEM_PIPELINES 配置：

    ITEM_PIPELINES = {
    	'myproject.pipelines.PricePipeline': 300,
    	'myproject.pipelines.JsonWriterPipeline': 800,
	}
分配给每个类的整型值，确定了他们运行的顺序，item按数字从低到高的顺序，通过pipeline，通常将这些数字定义在0-1000范围内。