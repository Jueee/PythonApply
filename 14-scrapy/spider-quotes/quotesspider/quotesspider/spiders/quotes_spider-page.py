

import scrapy

class QuotesSpider(scrapy.Spider):
    """docstring for QuotesSpider"""
    
    name = "quotes-page"
    start_urls = [
        'http://quotes.toscrape.com/page/1/'
    ]

    def parse(self,response):
        for quote in response.xpath("//div[@class='quote']"):
            yield{
                'text':quote.xpath("span[@class='text']/text()").extract_first(),
                'author':quote.xpath("span[2]/small[@class='author']/text()").extract_first(),
                'tags':quote.xpath("div[@class='tags']/a[@class='tag']/text()").extract()
            }

        next_page = response.xpath("//ul[@class='pager']/li[@class='next']/a/@href").extract_first()
        if next_page is not None:
            next_page = response.urljoin(next_page)
            yield scrapy.Request(next_page,callback=self.parse)