

import scrapy

class QuotesSpider(scrapy.Spider):
    """docstring for QuotesSpider"""
    
    name = "author"
    start_urls = [
        'http://quotes.toscrape.com/'
    ]

    def parse(self,response):
        for href in response.xpath("//div[@class='quote']/span[2]/a/@href").extract():
            yield scrapy.Request(response.urljoin(href),callback=self.parse_author)

        next_page = response.xpath("//ul[@class='pager']/li[@class='next']/a/@href").extract_first()
        if next_page is not None:
            next_page = response.urljoin(next_page)
            yield scrapy.Request(next_page,callback=self.parse)

    # 即使同一作者有许多引号，我们也不用担心多次访问同一作者页面。
    # 默认情况下，Scrapy会将重复的请求过滤出已访问的URL，避免了由于编程错误导致服务器太多的问题。
    def parse_author(self,response):
        yield{
            'url':response.url,
            'name':response.xpath("//h3[@class='author-title']/text()").extract_first().strip(),
            'birthday':response.xpath("//span[@class='author-born-date']/text()").extract_first().strip(),
            'born':response.xpath("//span[@class='author-born-location']/text()").extract_first().strip()
        }