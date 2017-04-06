# -*- coding: utf-8 -*-
import scrapy
import re,json,logging
from OfficialAccounts.items import OfficialaccountsItem


class CommonSpider(scrapy.Spider):
    name = "common2mysql"
    allowed_domains = ["qq.com"]

    def start_requests(self):
        query = getattr(self, 'query', None)
        logging.info("[query]"+query)
        url = 'http://weixin.sogou.com/weixin?type=1&s_from=input&query='+query+'&ie=utf8'
        yield scrapy.Request(url=url,callback=self.parse)

    def parse(self, response):
        try:
            href = response.xpath("//*[@id='sogou_vr_11002301_box_0']/div/div[2]/p[1]/a/@href").extract_first()
            yield scrapy.Request(href,callback=self.parse_profile)
        except Exception, e:
            logging.error("[No][Exit]")

    def parse_profile(self,response):
        items = []
        htmlBody = response.body
        if "verify_img" in htmlBody:
            logging.info("[verify_img]")
            return
        try:
            data = re.search(r"var msgList = ({.*?});", htmlBody).group(1)
            msgList = json.loads(data)['list']    
            for msg in msgList:
                item = OfficialaccountsItem()
                item['title'] = msg['app_msg_ext_info']['title']
                item['digest'] = msg['app_msg_ext_info']['digest']
                item['author'] = msg['app_msg_ext_info']['author']
                items.append(item)
        except Exception, e:
            print "[Error]"
        return items