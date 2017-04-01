# 爬取 quotes 数据  
[http://quotes.toscrape.com/tag/humor/](http://quotes.toscrape.com/tag/humor/ "http://quotes.toscrape.com/tag/humor/")

执行
> scrapy runspider spider-quotes.py -o quotes.json    

测试：

    scrapy shell http://quotes.toscrape.com/tag/humor/

    >>> response.css('div.quote')[0]
    <Selector xpath=u"descendant-or-self::div[@class and contains(concat(' ', normalize-space(@class), ' '), ' quote ')]" data=u'<div class="quote" itemscope itemtype="h'>
    >>> response.css('div.quote')[0].css('span.text::text').extract_first()
    u'\u201cThe person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.\u201d'
    >>> response.css('div.quote')[0].xpath('span/small/text()').extract_first()
    u'Jane Austen'
    >>> response.css('li.next a::attr("href")').extract_first()
    u'/tag/humor/page/2/'


## 工程 quotesspider
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

根据标签  
可以通过-a 在运行它们时使用该选项为 Scrapy 提供命令行参数。
> scrapy crawl quotes-tag -o quotes-tag-None.json

标签为“humor”或“thinking”：
> scrapy crawl quotes-tag -o quotes-tag-humor.json -a tag=humor  
> 
> scrapy crawl quotes-tag -o quotes-tag-thinking.json -a tag=thinking  

将tag=humor参数传递给Scrapy，它就只会访问 humor 标记中的URL，例如 http://quotes.toscrape.com/tag/humor。

