# 工程 quotesspider #
参考样例：[https://doc.scrapy.org/en/latest/intro/tutorial.html](https://doc.scrapy.org/en/latest/intro/tutorial.html)  

新增工程：
> scrapy startproject quotesspider

保存网页数据：
> scrapy crawl quotes 

根据 xpath 爬取保存数据：
> scrapy crawl quotes-xpath -o quotes-xpath.json  

根据 css 爬取保存数据
> scrapy crawl quotes-css -o quotes-css.json  

根据翻页的“下一页”标签，逐页爬取保存数据  
> scrapy crawl quotes-page -o quotes-page.json  

根据翻页的“下一页”标签，逐页爬取保存作者信息数据  
> scrapy crawl author -o quotes-author.json

## 根据标签   
可以通过-a 在运行它们时使用该选项为 Scrapy 提供命令行参数。
> scrapy crawl quotes-tag -o quotes-tag-None.json

标签为“humor”或“thinking”：
> scrapy crawl quotes-tag -o quotes-tag-humor.json -a tag=humor  
> 
> scrapy crawl quotes-tag -o quotes-tag-thinking.json -a tag=thinking  

将tag=humor参数传递给Scrapy，它就只会访问 humor 标记中的URL，例如 http://quotes.toscrape.com/tag/humor。

