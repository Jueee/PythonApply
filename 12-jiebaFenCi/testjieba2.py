# coding:utf-8
#!/usr/local/bin/python

import sys  
reload(sys)  
sys.setdefaultencoding('gbk')   

import jieba

string = "类似之前的外发账号的统计维度，每月汇总一次，当月的每天汇总一次有更新的（前期先不做）"
seg_list = jieba.cut(string)
for str in seg_list:
    print(str.decode('utf-8').encode('gbk'))