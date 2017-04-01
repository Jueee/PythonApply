

import scrapy

class QuotesSpider(scrapy.Spider):
    """docstring for QuotesSpider"""
    
    name = "quotes-tag"

    def start_requests(self):
        url = 'http://quotes.toscrape.com/'
        tag = getattr(self, 'tag', None)
        if tag is not None:
            url = url + 'tag/' + tag
        yield scrapy.Request(url=url,callback=self.parse)

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