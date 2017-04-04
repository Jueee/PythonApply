# -*- coding: utf-8 -*-
import scrapy

# "url": "https://www.javbus.com/star/2jv"
# "photo": "https://pics.javbus.com/actress/2jv_a.jpg"


class ActressesNocodeSpider(scrapy.Spider):
    name = "actresses-nocode"
    allowed_domains = ["javbus.com"]
    start_urls = ['https://www.javbus.com/uncensored/actresses']

    def parse(self, response):
        for actresses in response.xpath("//div[@id='waterfall']/div[@class='item']"):
            yield{
                'name':actresses.xpath("a/div[@class='photo-info']/span/text()").extract_first(),
                'url':actresses.xpath("a/@href").extract_first().split("/")[-1],
                'photo':actresses.xpath("a/div[@class='photo-frame']/img/@src").extract_first().split("/")[-1]
            }

        next_page = response.xpath("//a[@id='next']/@href").extract_first()
        next_page = response.urljoin(next_page)
        yield scrapy.Request(next_page,callback=self.parse)