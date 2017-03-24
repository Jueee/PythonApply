# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.
# -*- coding: utf-8 -*-
import scrapy

class ShareditorSpider(scrapy.Spider):
    """docstring for ShareditorSpider"""
    name = 'shareditor'
    allowed_domains = ["shareditor.com"]
    start_urls = ['http://www.shareditor.com/']

    def parse(self,response):
        filename = response.url.split("/")[-2] + ".html"
        with open(filename,'wb') as f:
            f.write(response.body)
