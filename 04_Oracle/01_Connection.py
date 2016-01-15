import cx_Oracle

db1 = cx_Oracle.connect('tcmp', 'jue', 'localhost:1521/orcl')	# 建立连接，3 个参数分开写
db2 = cx_Oracle.connect('tcmp/jue@localhost:1521/orcl') # 建立连接，3 个参数连写

print(db1,db2)
print(db1.version,db2.version)

dsn_tns = cx_Oracle.makedsn('localhost', 1521, 'orcl')
print(dsn_tns) 

db3 = cx_Oracle.connect('tcmp', 'jue', dsn_tns)
print(db3)
print(db3.version)