

import scrapy

class QuotesSpider(scrapy.Spider):
    """docstring for QuotesSpider"""
    
    name = "quotes-xpath"

    def start_requests(self):
        urls = [
            'http://quotes.toscrape.com/page/1/',
            'http://quotes.toscrape.com/page/2/',
        ]
        for url in urls:
            yield scrapy.Request(url=url,callback=self.parse)

    def parse(self,response):
        for quote in response.xpath("//div[@class='quote']"):
            yield{
                'text':quote.xpath("span[@class='text']/text()").extract_first(),
                'author':quote.xpath("span[2]/small[@class='author']/text()").extract_first(),
                'tags':quote.xpath("div[@class='tags']/a[@class='tag']/text()").extract()
            }