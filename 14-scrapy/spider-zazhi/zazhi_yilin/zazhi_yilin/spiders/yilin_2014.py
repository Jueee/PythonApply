# -*- coding: utf-8 -*-
import scrapy


class Yilin2014Spider(scrapy.Spider):
    name = "yilin_2014"
    allowed_domains = ["wuxizazhi.cnki.net"]

    start_urls = [
        "http://wuxizazhi.cnki.net/MagaList/YLYL2014.html",
    ]
        
    def parse(self,response):
        for musiclist in response.xpath("//ul[@class='book_y_list']/li"):
            url = "http://wuxizazhi.cnki.net" + musiclist.xpath("a/@href").extract_first()
            yield scrapy.Request(url,callback=self.parse_dir_contents)

    def parse_dir_contents(self,response):
        for music in response.xpath("//div[@id='slidingList0']/ul/li"):
            yield {
                'title':music.xpath("span/a/@title").extract_first(),
                'href':music.xpath("span/a/@href").extract_first(),
            }
