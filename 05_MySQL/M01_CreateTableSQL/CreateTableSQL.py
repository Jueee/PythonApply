import pymysql
import os.path
import time

TABLE_NAMES = ['students']

DB_NAME = 'juedb'

# 根据SQL获取查询结果List
def get_columns(sql):
    list_columns = []
    coon = None
    cursor = None
    try:
        coon = pymysql.connect(host='localhost',user='root',passwd='jue',db=DB_NAME,charset='utf8')
        cursor = coon.cursor()  #建立一个cursor
        cursor.execute(sql)
        row=cursor.fetchall()
        for x in row:
            list_columns.append(x)
    except cx_Oracle.DatabaseError as e:
        print(e)
    except AttributeError:
        print('execute函数获取的类型错误！')
    finally:
        if cursor:
            cursor.close()
        if coon:
            coon.close()
    return list_columns

def table_sql(tableName):
    return '''
SELECT t.Column_name,
       case when t.Data_type='varchar' then CONCAT('varchar','(',t.Character_maximum_length,')') 
       else Data_type end Data_type,
       t.Is_nullable,t.Column_key,t.Column_default,t.Column_comment 
  FROM information_schema.COLUMNS t 
 WHERE TABLE_SCHEMA='%s' AND TABLE_NAME='%s' 
 order by ordinal_position
''' % (DB_NAME,tableName)

def table_content(cols):
    s = ''
    for x in range(len(cols)):
        cs = cols[x]
        s += "   %-30s%-20s%-10s%-10s%-10s\n" % (cs[0],cs[1],cs[2],cs[3],cs[4])
    return s

def create_table_sql(tableNames):
    tlist = []
    for x in range(len(tableNames)):
        tableName = str.upper(tableNames[x])
        columns = get_columns(table_sql(tableName))
        tlist.append(table_content(columns))
    return ''.join(tlist)

# 获取桌面路径
def GetDesktopPath():
    return os.path.join(os.path.expanduser("~"), 'Desktop')

# 保存文件至桌面
def get_SQL_File(tableName):
    fileName = '数据初始化.sql'
    filePath = os.path.join(GetDesktopPath(),fileName)
    tableSQL = create_table_sql(tableName)
    with open(filePath,'w') as f:
        f.write(tableSQL)
        print(tableSQL)
        print('生成文件成功：%s' % filePath)

if __name__ == '__main__':
    get_SQL_File(TABLE_NAMES)