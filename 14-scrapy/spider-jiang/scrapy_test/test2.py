# -*- coding: utf-8 -*-

import re,json

line = """
{"website": "http://www.silvair.com", "phone": "Phone               - (415) 231-6588", "product": "Building Integration, Intelligent Buildings, and Smart Lighting", "name": "SILVAIR", "address": "717 Market Street   Suite 100", "nation": "Suite 100"}
"""
rrr = '{"website": "(.*?)", "phone": "(.*?)", "product": "(.*?)", "name": "(.*?)", "address": "(.*?)", "nation": "(.*?)"}'
reSearch = re.search(rrr, line)
website = reSearch.group(1).replace("\s+", " ")
phone = reSearch.group(2).replace("\s+", " ")
product = reSearch.group(3).replace("\s+", " ")
name = reSearch.group(4).replace("\s+", " ")
address = reSearch.group(5).replace("\s+", " ")
nation = reSearch.group(6).replace("\s+", " ")
ttt = "%s\t%s\t%s\t%s\t%s\t%s" % (name,nation,phone,product,address,website)
print(ttt)