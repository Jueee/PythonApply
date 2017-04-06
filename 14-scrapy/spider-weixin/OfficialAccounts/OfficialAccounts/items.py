# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class OfficialaccountsItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    title = scrapy.Field()
    digest = scrapy.Field()
    author = scrapy.Field()
    datetime = scrapy.Field()
    fakeid = scrapy.Field()
    content = scrapy.Field()
    body = scrapy.Field()
