# -*- coding: utf-8 -*-

import scrapy
import logging
from w3school.items import W3SchoolItem

# 编写的spider必须继承自scrapy的Spider类
class W3SchoolSpider(scrapy.Spider):
    """docstring for ClassName"""

    # 属性name即spider唯一名字
    name = "w3school"
    allowed_domains = ['w3school.com.cn']
    # start_url可以理解为爬取入口
    start_urls = [
        "http://www.w3school.com.cn/xml/xml_syntax.asp"
    ]

    # parse() 是对scrapy.Spider类的override
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