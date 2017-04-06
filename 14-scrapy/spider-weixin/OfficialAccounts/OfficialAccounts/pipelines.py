# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
import codecs
import json
import MySQLdb

import sys
reload(sys)
sys.setdefaultencoding('utf8')

class OfficialaccountsPipeline(object):
    def __init__(self):
        self.conn = MySQLdb.connect(host='127.0.0.1',user='root',passwd='jue',db='scrapy',charset="utf8")
        self.cursor = self.conn.cursor()

    def process_item(self, item, spider):
        if '2mysql' in spider.name:
            sql = "insert ignore into OfficialAccounts(title,digest,author) values(%s,%s,%s)"
            param = (item['title'],item['digest'],item['author'])
            self.cursor.execute(sql,param)
            self.conn.commit()
        else:
            filename = spider.name+".json";
            self.file = codecs.open(filename,'a',encoding='utf-8')
            line = json.dumps(dict(item)) + "\n"
            self.file.write(line.decode("unicode_escape"))
            return item
