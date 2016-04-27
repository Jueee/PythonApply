#! /usr/bin/python
# -*- coding: utf-8 -*-

# 导入
import MySQLdb

# 连接数据库： 
conn = MySQLdb.connect(host='localhost',user='root',passwd='jue',db='juedb',charset='utf8')
# 获取操作游标：
cur = conn.cursor()
# 执行sql语句
cur.execute("SELECT  *  FROM information_schema.TABLES WHERE  TABLE_SCHEMA='juedb'")
# 用循环打印结果：
for r in cur:
   print r
# 关闭
cur.close()
conn.close()