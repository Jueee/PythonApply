# -*- coding: utf-8 -*-

# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.

import scrapy


class CSDNBlogList(scrapy.Spider):
    """docstring for CSDNBlogList"""
    
    name = 'csdnbloglist'
    start_urls = [
        'http://blog.csdn.net/oYunTaoLianWu/article/list',
    ]

    def parse(self,response):
        for bloglist in response.css('div.list_item'):
            yield{
            #    'title':bloglist.xpath('//h1/span/a/text()').extract_first(),
                'title':bloglist.css('span.link_title a::text').extract_first(),
                'blogtime':bloglist.css('span.link_postdate::text').extract_first(),
                'view':bloglist.css('span.link_view::text').extract_first(),
                'comments':bloglist.css('span.link_comments::text').extract_first(),
            }
        pages = response.css('div.pagelist a')
        for page in pages:
            if page.css('a::text').extract_first().encode('utf-8')=='下一页':
                next_page = page.css('a::attr("href")').extract_first()
                next_page = response.urljoin(next_page)
                yield scrapy.Request(next_page,callback=self.parse)