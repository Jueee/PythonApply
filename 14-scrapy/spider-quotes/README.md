爬取 quotes 数据。  
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

