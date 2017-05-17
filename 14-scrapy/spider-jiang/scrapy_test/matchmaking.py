# -*- coding: utf-8 -*-

import re,json
import codecs

import sys 
reload(sys) 
sys.setdefaultencoding('utf-8') 


file = codecs.open("matchmaking.json","rb","utf-8")

while 1:
    line = file.readline().replace(u'\xa0', u' ')
    if not line:
        break
    rrr = '{"country": "(.*?)", "href": "(.*?)", "title": "(.*?)"}'
    
    try:
        reSearch = re.search(rrr, line)
        country = reSearch.group(1).replace("?", "").replace("\s+", " ")
        href = reSearch.group(2).replace("-", "").replace("?", "").strip().replace(" ", "")
        title = reSearch.group(3).replace("?", "").replace("\s+", " ")
        ttt = "%s\t%s\t%s" % (title,href,country)
        print ttt.encode('GBK', 'ignore')
    except Exception, e:
        print line.encode('GBK', 'ignore')
    