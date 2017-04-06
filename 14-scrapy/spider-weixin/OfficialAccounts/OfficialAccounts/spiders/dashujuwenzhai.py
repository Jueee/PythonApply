# -*- coding: utf-8 -*-
import scrapy
import re,json
from OfficialAccounts.items import OfficialaccountsItem

class DashujuwenzhaiSpider(scrapy.Spider):
    name = "dashujuwenzhai"
    allowed_domains = ["qq.com"]
    start_urls = ['http://weixin.sogou.com/weixin?type=1&s_from=input&query=大数据文摘&ie=utf8']

    def parse(self, response):
        href = response.xpath("//*[@id='sogou_vr_11002301_box_0']/div/div[2]/p[1]/a/@href").extract_first()
        yield scrapy.Request(href,callback=self.parse_profile)

    def parse_profile(self,response):
        items = []
        htmlBody = response.body
        try:
            data = re.search(r"var msgList = ({.*?});", htmlBody).group(1)
            msgList = json.loads(data)['list']    
            for msg in msgList:
                item = OfficialaccountsItem()
                title = msg['app_msg_ext_info']['title']
                digest = msg['app_msg_ext_info']['digest']
                author = msg['app_msg_ext_info']['author']
                item['title'] = title
                item['digest'] = digest
                item['author'] = author
                items.append(item)
        except Exception, e:
            print "[Error]"
        return items