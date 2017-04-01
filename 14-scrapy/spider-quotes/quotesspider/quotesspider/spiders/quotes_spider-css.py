

import scrapy

class QuotesSpider(scrapy.Spider):
    """docstring for QuotesSpider"""
    
    name = "quotes-css"

    def start_requests(self):
        urls = [
            'http://quotes.toscrape.com/page/1/',
            'http://quotes.toscrape.com/page/2/',
        ]
        for url in urls:
            yield scrapy.Request(url=url,callback=self.parse)

    def parse(self,response):
        for quote in response.css("div.quote"):
            yield{
                'text':quote.css("span::text").extract_first().strip(),
                'author':quote.css("small::text").extract_first().strip(),
                'tags':quote.css("div.tags a::text").extract()
            }