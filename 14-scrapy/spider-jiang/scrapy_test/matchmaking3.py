# -*- coding: utf-8 -*-

import re,json

file = open("test.txt","rb")
while 1:
    line = file.readline().decode(encoding='utf-8').replace(u'\xa0', u' ')
    if not line:
        break
    rrr = '{"country": "(.*?)", "href": "(.*?)", "title": "(.*?)"}'
    try:
        reSearch = re.search(rrr, line)
        country = reSearch.group(1).replace("?", "").replace("\s+", " ")
        href = reSearch.group(2).replace("-", "").replace("?", "").strip().replace(" ", "")
        title = reSearch.group(3).replace("?", "").replace("\s+", " ")
        ttt = "%s\t%s\t%s" % (title,href,country)
        print(ttt)
    except Exception as e:
        print(line)
    