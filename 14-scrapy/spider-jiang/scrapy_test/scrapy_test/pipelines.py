# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
import json
import codecs


class ScrapyTestPipeline(object):
    def process_item(self, item, spider):
        filename = spider.name+".json";
        self.file = codecs.open(filename,'a',encoding='utf-8')
        line = json.dumps(dict(item)) + "\n"
        self.file.write(line.decode("unicode_escape"))
        return item
