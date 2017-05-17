# -*- coding: utf-8 -*-
import scrapy,re

class LightFair(scrapy.Spider):
    """docstring for LightFair"""
    
    name = "matchmaking"

    def start_requests(self):
        head_url = "http://matchmaking.sialchina.cn/ExhibitorList2017.do?type=active&actIds=27&sort=a.areaname_zh+asc&action=ExhibitorList2017&total=6&rows=235&len=40&page="
        urls = [
            head_url+"6"
        ]
        for url in urls:
            yield scrapy.Request(url=url,callback=self.parse)
        
    def parse(self,response):
        for lightfairlist in response.xpath("//div[@class='clearfix icbs-content']"):
            url = "http://matchmaking.sialchina.cn"+lightfairlist.xpath("div[@class='icbs-desc']/div[@class='orienco']/span/a/@href").extract_first().strip()
            yield scrapy.Request(url,callback=self.parse_dir_contents)
        '''
        next_page = response.xpath("//div[@class='pageBtn']/ul/li[3]/@onclick").extract_first()
        url = "http://matchmaking.sialchina.cn/"+re.search(r"'(.*?)'", next_page).group(1).replace("amp;", "")
        print url
        yield scrapy.Request(url,callback=self.parse)
        '''

    def parse_dir_contents(self,response):
            yield {
                'title':response.xpath("//div[@class='title']/text()").extract_first().strip(),
                'country':response.xpath("//div[@class='dccst-middle']/span/text()").extract_first().strip().replace("\n", "").replace("\r", "").replace("\t", ""),
                'href':response.xpath("//div[@class='dccst-middle']/p/a/@href").extract_first().strip()
            }






