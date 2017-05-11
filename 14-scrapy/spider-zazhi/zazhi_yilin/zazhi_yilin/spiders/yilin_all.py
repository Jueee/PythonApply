# -*- coding: utf-8 -*-
import scrapy


class YilinAllSpider(scrapy.Spider):
    name = "yilin_all"
    allowed_domains = ["wuxizazhi.cnki.net"]

    start_urls = [
        "http://wuxizazhi.cnki.net/MagaList/YLYL.html",
    ]
        
    def parse(self,response):
        for musiclist in response.xpath("//div[@id='book_y_cho_box_2']/a"):
            url = "http://wuxizazhi.cnki.net" + musiclist.xpath("@href").extract_first()
            yield scrapy.Request(url,callback=self.parse_yaer)

    def parse_yaer(self,response):
        for musiclist in response.xpath("//ul[@class='book_y_list']/li"):
            url = "http://wuxizazhi.cnki.net" + musiclist.xpath("a/@href").extract_first()
            yield scrapy.Request(url,callback=self.parse_dir_contents)


    def parse_dir_contents(self,response):
        for music in response.xpath("//div[@id='slidingList0']/ul/li"):
            yield {
                'title':music.xpath("span/a/@title").extract_first(),
                'href':music.xpath("span/a/@href").extract_first(),
                'href':music.xpath("span/a/@href").extract_first(),
            }
