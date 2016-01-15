import cx_Oracle
import os.path
import time

TABLE_NAMES = ['tsys_organization','tsys_user']

# 根据SQL获取查询结果List
def get_columns(sql):
    list_columns = []
    coon = None
    cursor = None
    try:
        coon = cx_Oracle.connect('hstdc', 'tdc', '192.168.50.74:1521/orcl')   # 建立连接，3 个参数分开写
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

def judgeStr():
    ISOTIMEFORMAT='%Y-%m-%d %X'
    ti = time.strftime( ISOTIMEFORMAT,time.localtime())
    return '''
--建表脚本创建开始:" %s

DECLARE
  --判断表是否存在
  FUNCTION fc_IsTabExists(sTableName IN VARCHAR2)
    RETURN BOOLEAN AS
   iExists PLS_INTEGER;
  BEGIN
    SELECT COUNT(*) INTO iExists FROM user_tables ut WHERE ut.table_name  = UPPER(sTableName);
    RETURN CASE WHEN iExists > 0 THEN TRUE ELSE FALSE END;
  END;
BEGIN
    ''' % (ti)

def table_header(tableName):
    return '''
/* Table：%s*/
IF fc_IsTabExists('%s') THEN
  execute immediate 'drop table %s';
END IF;

execute immediate '
create table %s
(
''' % (tableName,tableName,tableName,tableName)

def table_sql(tableName):
    return '''
select t.column_name,
       t.data_type,
       t.data_length,
       t.data_scale,
       t.nullable,
       t.column_id,
       c.comments,
       (SELECT CASE WHEN t.column_name = m.column_name THEN 1 ELSE 0 END FROM DUAL) iskey,
       tb.comments
  FROM user_tab_cols t,
       USER_tab_COMMENTS tb,
       user_col_comments c,
       (select m.column_name
          from user_constraints s, user_cons_columns m
         where upper(m.table_name) = '%s'
           and m.table_name = s.table_name
           and m.constraint_name = s.constraint_name
           and s.constraint_type = 'P') m
 WHERE upper(t.table_name) = '%s'
   and c.table_name = t.table_name
   and c.table_name = tb.table_name
   and c.column_name = t.column_name
   and t.hidden_column = 'NO'
 order by t.column_id
''' % (tableName,tableName)

def table_content(cols):
    s = ''
    for x in range(len(cols)):
        cs = cols[x]
        if cs[1]=='VARCHAR2':
            s += "   %-20s%s(%s)" % (cs[0],cs[1],cs[2])
        elif cs[1]=='NUMBER' and cs[3]==0:
            s += "   %-20s%s(%s)" % (cs[0],cs[1],cs[2])
        elif cs[1]=='NUMBER' and cs[3]!=0:
            s += "   %-20s%s(%s,%s)" % (cs[0],cs[1],cs[2],cs[3])
        if cs[4]=='N':
            s += " not null"
        if x != len(cols)-1:
            s += ',\n'
    return s

def col_comments(tableName,cols):
    s = ''
    for x in range(len(cols)):
        cs = cols[x]
        if cs[6] is not None:
            s += "execute immediate 'comment on column %s.%s is ''%s''';\n" % (tableName,cs[0],cs[6]) 
    return s

def tab_comments(tableName,cols):
    s = ""
    if cols[0][8] is not None:
        s = "\
-- Add comments to the table\n\
execute immediate 'comment on table  %s is ''%s''';\n\
" % (tableName,cols[0][8])
    return s

def table_constraint(tableName,cols):
    s = []
    for x in range(len(cols)):
        if cols[x][7] == 1:
            s.append(cols[x][0])
    return '''
execute immediate 'alter table %s 
add constraint PK_%s primary key (%s) using index tablespace TS_TDC';
''' % (tableName,tableName,','.join(s))

def create_table_sql(tableNames):
    tlist = []
    tlist.append(judgeStr())
    for x in range(len(tableNames)):
        tableName = str.upper(tableNames[x])
        columns = get_columns(table_sql(tableName))
        tlist.append(table_header(tableName))
        tlist.append(table_content(columns))
        tlist.append("\n)';\n")
        tlist.append(tab_comments(tableName,columns))
        tlist.append("-- Add comments to the columns\n")
        tlist.append(col_comments(tableName,columns))
        tlist.append(table_constraint(tableName,columns))
    tlist.append("\nEND;\n/\n")
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