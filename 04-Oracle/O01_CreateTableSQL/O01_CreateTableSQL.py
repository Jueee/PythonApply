import cx_Oracle
import os.path

tableName = 'testwyq'

TABLE_NAME = str.upper(tableName)

# 根据SQL获取查询结果List
def get_columns(sql):
    list_columns = []
    coon = None
    cursor = None
    try:
        coon = cx_Oracle.connect('hsncm', 'ncm', '192.168.50.74:1521/orcl')   # 建立连接，3 个参数分开写
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
    
# 表查询SQL
def select_sql(tableName):
    return "select %s from %s" % (get_col_str(tableName),tableName)

# 表结构SQL
def base_sql(tableName):
    return "select t.COLUMN_ID,t.COLUMN_NAME,t.DATA_TYPE from user_tab_columns t where t.TABLE_NAME='%s' order by t.COLUMN_ID" % (tableName)

# 表删除SQL
def delete_sql(tableName):
    return "delete from %s;\n" % tableName

# 获取表字段名称List
def get_Colname(list_columns):
    list_colname = []
    for i in range(len(list_columns)):
        list_colname.append(list_columns[i][1])
    return list_colname

# 获取表字段类型List
def get_Coltype(list_columns):
    list_coltype = []
    for i in range(len(list_columns)):
        list_coltype.append(list_columns[i][2])
    return list_coltype

# 表列Str
def get_col_str(tableName):
    x = get_columns(base_sql(tableName))
    y = get_Colname(x)
    return ','.join(y)

# 新增头
def get_sql_head(tableName):
    return "insert into %s(%s)" % (tableName,get_col_str(tableName))

# 获取表数据insert SQL
def table_data(tableName):
    data = get_columns(select_sql(tableName))
    dtype = get_Coltype(get_columns(base_sql(tableName)))
    print(dtype)
    sqlStr = ''
    for i in range(len(data)):
        slist = []
        for x in range(len(data[i])):
            a = data[i][x]
            if a is None:
                slist.append("null")
            elif dtype[x]=='NUMBER':
                slist.append("%s" % (a))
            elif dtype[x]=='DATE':
                slist.append("to_date('%s','yyyy-mm-dd hh24:mi:ss')" % (a))
            else:
                slist.append("'%s'" % (str(a)))
        if i == len(data)-1:
            sqlStr += "select %s from dual;\n" % (','.join(slist))
        else:
            sqlStr += "select %s from dual union all\n" % (','.join(slist))
    return sqlStr

# 拼装最终字符串
def get_table_sql(tableName):
    tlist = []
    tlist.append(delete_sql(tableName))
    tlist.append(get_sql_head(TABLE_NAME))
    tlist.append(table_data(TABLE_NAME))
    tlist.append('commit;')
    return '\n'.join(tlist)

# 获取桌面路径
def GetDesktopPath():
    return os.path.join(os.path.expanduser("~"), 'Desktop')

# 保存文件至桌面
def get_SQL_File(tableName):
    fileName = '数据初始化%s.sql' % (tableName)
    filePath = os.path.join(GetDesktopPath(),fileName)
    tableSQL = get_table_sql(tableName)
    with open(filePath,'w') as f:
        f.write(tableSQL)
        print(tableSQL)
        print('生成文件成功：%s' % filePath)


if __name__=='__main__':
    get_SQL_File(TABLE_NAME)