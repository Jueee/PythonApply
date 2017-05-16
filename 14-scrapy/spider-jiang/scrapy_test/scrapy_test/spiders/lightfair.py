# -*- coding: utf-8 -*-
import scrapy,re

class LightFair(scrapy.Spider):
    """docstring for LightFair"""
    
    name = "lightfair"

    start_urls = [
        "http://www.lightfair.com/lightfair/V40/exhibitor_list/exnamelist.cvn?sort_letter=&start=1&catID=0&exhibLineID=0&pav=0&view_all=0&exhibName=&lineName=&city=&zip=&state=&country=&cat=&product=&contact=",
    ]
        
    def parse(self,response):
        for lightfairlist in response.xpath("//table[@id='tblExhibitors']/form/tr"):
            href = lightfairlist.xpath("td[2]/div[@class='exhibRow']/a/@href").extract_first()
            try:
                exbid = re.search(r"'(.*?)'", href).group(1)
                url = "http://www.lightfair.com/V40/exhibitor_list/displayEx.cvn?exbid=%s&printfr=true&popup=1" % (exbid)
                yield scrapy.Request(url,callback=self.parse_dir_contents)
            except Exception, e:
                pass

        
        next_page = response.xpath("//span[@id='spPageWrap']/a[@class='pager normal']/@onclick").extract()[-1]
        page_num = re.search(r"(\d+)", next_page).group(1)
        url = "http://www.lightfair.com/lightfair/V40/exhibitor_list/exnamelist.cvn?sort_letter=&start="+page_num+"&catID=0&exhibLineID=0&pav=0&view_all=0&exhibName=&lineName=&city=&zip=&state=&country=&cat=&product=&contact="
        yield scrapy.Request(url,callback=self.parse)
        
        
    def parse_dir_contents(self,response):
        website = response.xpath("//form[@name='linker']/a/@href").extract_first()
        product = response.xpath("//td[@valign='top']/b/text()").extract()
        phone = response.xpath("//td[@valign='vertical-align: top;']/text()").extract()
        yield {
            'name':response.xpath("//td[@style='color:black; vertical-align: top;']/b/text()").extract_first(),
            'address':response.xpath("//td[@style='color:black; vertical-align: top;']/text()").extract()[2].lstrip().rstrip().replace("\n", "").replace("\r", "")+ "\t" +
            response.xpath("//td[@style='color:black; vertical-align: top;']/text()").extract()[3].lstrip().rstrip().replace("\n", "").replace("\r", "")+ "\t" + 
            response.xpath("//td[@style='color:black; vertical-align: top;']/text()").extract()[4].lstrip().rstrip().replace("\n", "").replace("\r", ""),
            'nation':response.xpath("//td[@style='color:black; vertical-align: top;']/text()").extract()[4].lstrip().rstrip().replace("\n", "").replace("\r", ""),
            'product':";".join(product),
            'phone':"".join(phone).replace("\n", "").replace("\r", ""),
            'website':re.search(r"'(http.*?)'", website).group(1)
        }

