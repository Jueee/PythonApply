# 爬取 w3school 数据 #  
[http://www.w3school.com.cn/xml/xml_syntax.asp](http://www.w3school.com.cn/xml/xml_syntax.asp "http://www.w3school.com.cn/xml/xml_syntax.asp")

## scrapy 工程爬取 ##
新建工程：
> scrapy startproject w3school

执行工程：
> cd w3school  
> scrapy crawl w3school  

后台打印日志
> scrapy crawl w3school --set LOG_FILE=log


为了启用一个Item Pipeline组件，你必须将它的类在“settings.py”中添加到 ITEM_PIPELINES 配置：  

    ITEM_PIPELINES = {
    	'w3school.pipelines.W3SchoolPipeline':300
	}
如果有多个类，则如下所示：

    ITEM_PIPELINES = {
    	'myproject.pipelines.PricePipeline': 300,
    	'myproject.pipelines.JsonWriterPipeline': 800,
	}
分配给每个类的整型值，确定了他们运行的顺序，item按数字从低到高的顺序，通过pipeline，通常将这些数字定义在0-1000范围内。