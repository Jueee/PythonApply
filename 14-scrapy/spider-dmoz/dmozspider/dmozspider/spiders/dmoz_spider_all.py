# -*- coding: utf-8 -*-

import scrapy
from dmozspider.items import DmozspiderItem

class DmozSpider(scrapy.Spider):
    """docstring for DmozSpider"""
    
    # name: 用于区别Spider。 该名字必须是唯一的，您不可以为不同的Spider设定相同的名字。
    name = "dmozall"
    allowed_domains = ['dmoztools.net']

    # start_urls: 包含了Spider在启动时进行爬取的url列表。 因此，第一个被获取到的页面将是其中之一。 后续的URL则从初始的URL获取到的数据中提取。
    start_urls = [
        'http://dmoztools.net/Computers/Programming/Languages/Python',
    ]

    # parse() 是spider的一个方法。 被调用时，每个初始URL完成下载后生成的 Response 对象将会作为唯一的参数传递给该函数。 该方法负责解析返回的数据(response data)，提取数据(生成item)以及生成需要进一步处理的URL的 Request 对象。
    def parse(self,response):
        for href in response.xpath("//div[@id='cat-list-content-2']/div[@class='cat-item']"):
            urlstr = href.xpath("a/@href").extract_first()
            # 构造一个绝对路径的URL(页面上的链接都是相对路径的)
            url = "http://dmoztools.net" + urlstr
            # 产生(yield)一个请求， 该请求使用 parse_dir_contents() 方法作为回调函数, 用于最终产生我们想要的数据.。
            yield scrapy.Request(url,callback=self.parse_dir_contents)
            
            
    # 回调函数负责提取一些item,查找能跟进的页面的链接, 并且使用相同的回调函数yield一个 Request:
    def parse_dir_contents(self,response):
        for sel in response.xpath("//div[@id='site-list-content']/div[@class='site-item ']"):
            title = sel.xpath("div[@class='title-and-desc']/a/div[@class='site-title']/text()").extract()
            link = sel.xpath("div[@class='title-and-desc']/a/@href").extract()
            desc = sel.xpath("div[@class='title-and-desc']/div[@class='site-descr ']/text()").extract()

            item = DmozspiderItem()
            item['title'] = title
            item['link'] = link
            item['desc'] = desc
            yield item