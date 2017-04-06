# -*- coding: utf-8 -*-


import scrapy


class MusicContentNew(scrapy.Spider):
    """docstring for MusicList"""
    
    name = "musiccontent"

    start_urls = [
        "http://www.luoo.net/music/",
    ]
        
    def parse(self,response):
        for musiclist in response.xpath("//div[@class='vol-list']/div[@class='item']"):
            url = musiclist.xpath("div[@class='meta rounded clearfix']/a[@class='name']/@href").extract_first()
            yield scrapy.Request(url,callback=self.parse_dir_contents)

        '''
        next_page = response.xpath("//div[@class='paginator']/a[@class='next']/@href").extract_first()
        next_page = response.urljoin(next_page)
        yield scrapy.Request(next_page,callback=self.parse)
        '''
        
    def parse_dir_contents(self,response):
        for music in response.xpath("//div[@id='luooPlayerPlaylist']/ul/li"):
            yield {
                'name':music.xpath("div[@class='track-wrapper clearfix']/a[@class='trackname btn-play']/text()").extract_first(),
                'artist':music.xpath("div[@class='track-wrapper clearfix']/span[@class='artist btn-play']/text()").extract_first(),
            }

