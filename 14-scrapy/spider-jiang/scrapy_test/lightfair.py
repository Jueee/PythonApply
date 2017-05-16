# -*- coding: utf-8 -*-

import re,json
import codecs

import sys 
reload(sys) 
sys.setdefaultencoding('gbk') 


file = codecs.open("lightfair.json","r","utf-8")

while 1:
    line = file.readline()
    if not line:
        break
    rrr = '{"website": "(.*?)", "phone": "(.*?)", "product": "(.*?)", "name": "(.*?)", "address": "(.*?)", "nation": "(.*?)"}'
    try:
        reSearch = re.search(rrr, line)
        website = reSearch.group(1).replace("?", "").replace("\s+", " ")
        phone = reSearch.group(2).replace("-", "").replace("?", "").strip().replace(" ", "").replace("Fax", "    Fax")
        product = reSearch.group(3).replace("?", "").replace("\s+", " ")
        name = reSearch.group(4).replace("?", "").replace("\s+", " ")
        address = reSearch.group(5).replace("?", "").replace("\t", " ").replace("\s+", " ")
        nation = reSearch.group(6).replace("?", "").replace("\s+", " ")
        ttt = "%s\t%s\t%s\t%s\t%s\t%s" % (name,nation,phone,product,address,website)
        print ttt.encode('GBK', 'ignore')
    except Exception, e:
        pass