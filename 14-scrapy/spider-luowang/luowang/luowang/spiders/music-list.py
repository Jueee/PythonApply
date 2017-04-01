# -*- coding: utf-8 -*-


import scrapy


class MusicList(scrapy.Spider):
    """docstring for MusicList"""
    
    name = "musiclist"

    start_urls = [
        "http://www.luoo.net/music/",
    ]
        
    def parse(self,response):
        for musiclist in response.xpath("//div[@class='vol-list']/div[@class='item']"):
            yield{
                'listname':musiclist.xpath("div[@class='meta rounded clearfix']/a[@class='name']/text()").extract_first(),
                'href':musiclist.xpath("div[@class='meta rounded clearfix']/a[@class='name']/@href").extract_first()
            }
        
        next_page = response.xpath("//div[@class='paginator']/a[@class='next']/@href").extract_first()
        next_page = response.urljoin(next_page)
        yield scrapy.Request(next_page,callback=self.parse)
        