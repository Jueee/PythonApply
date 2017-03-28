
import scrapy
import logging
from w3school.items import W3SchoolItem


class W3SchoolSpider(scrapy.Spider):
    """docstring for ClassName"""
    
    name = "w3school"
    allowed_domains = ['w3school.com.cn']
    start_urls = [
        "http://www.w3school.com.cn/xml/xml_syntax.asp"
    ]

    def parse(self,response):
        items = []
        for site in response.xpath("//div[@id='navsecond']/div[@id='course']/ul[1]/li"):
            item = W3SchoolItem()

            item['title'] = site.xpath('a/text()').extract_first()
            item['link'] = site.xpath('a/@href').extract_first()
            item['desc'] = site.xpath('a/@title').extract_first()
            items.append(item)
            logging.info("Appending item...")

        logging.info("Append done.")
        return items