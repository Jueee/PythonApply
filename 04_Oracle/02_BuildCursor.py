import cx_Oracle

db = cx_Oracle.connect('tcmp', 'jue', 'localhost:1521/orcl')

cursor = db.cursor() #建立一个cursor

# 可以调用这个cursor.execute('SQL') 来执行SQL语句。
cursor.execute('select t.* from trptinfo  t') 

# 执行完毕以后，可以调用cursor.fetchall()一次取完所有结果，或者cursor.fetchone()一次取一行结果
row=cursor.fetchall()
for x in row:
    print(x)
       
print('====================')
# 带参数的查询-名字参数1
named_params = {'rpttypeid':1000001}
query1 = cursor.execute('SELECT * FROM trptinfo WHERE l_rpttypeid =: rpttypeid', named_params)
for x in query1:
    print(x)

print('====================')
# 带参数的查询-名字参数2
query2 = cursor.execute('SELECT * FROM trptinfo WHERE l_rpttypeid =: rpttypeid', rpttypeid = 1000001)
for x in query2:
    print(x)

print('====================')
# 带参数的查询-位置参数
query3 = cursor.execute('SELECT * FROM trptinfo WHERE l_rpttypeid =:1 AND c_istiming = :2', (1000001,0))
for x in query3:
    print(x)

print('====================')
# 带 like 参数的查询
stmt = "SELECT * FROM trptinfo WHERE l_rpttypeid = %d AND c_url like '%%%s%%'" % (1000001,'3553')
likequery = cursor.execute(stmt)
for x in likequery:
    print(x)
