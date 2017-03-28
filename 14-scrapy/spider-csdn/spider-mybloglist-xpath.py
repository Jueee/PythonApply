# -*- coding: utf-8 -*-
import scrapy
import codecs


import sys 
reload(sys) 
sys.setdefaultencoding('utf8')


class CSDNBlogList(scrapy.Spider):
    """docstring for CSDNBlogList"""
    
    name = 'bloglist'
    start_urls = [
        'http://blog.csdn.net/oYunTaoLianWu/article/list',
    ]

    def parse(self,response):
        for bloglist in response.xpath("/html/body/div[@id='container']/div[@id='body']/div[@id='main']/div[@class='main']/div[@class='list_item_new']/div[@id='article_list']/div[@class='list_item article_item']"):
            yield{
                'title':bloglist.xpath("div[@class='article_title']/h1/span[@class='link_title']/a/text()").extract_first(),
                'blogtime':bloglist.xpath("div[@class='article_manage']/span[@class='link_postdate']/text()").extract_first(),
                'view':bloglist.xpath("div[@class='article_manage']/span[@class='link_view']/text()").extract_first(),
                'comments':bloglist.xpath("div[@class='article_manage']/span[@class='link_comments']/text()").extract_first(),
            }
        pages = response.xpath("/html/body/div[@id='container']/div[@id='body']/div[@id='main']/div[@class='main']/div[@class='list_item_new']/div[@id='papelist']/a")
        for page in pages:
            if page.xpath('text()').extract_first().encode('utf-8')=='下一页':
                next_page = page.css('a::attr("href")').extract_first()
                next_page = response.urljoin(next_page)
                yield scrapy.Request(next_page,callback=self.parse)