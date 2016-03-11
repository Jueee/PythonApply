'''
##根据表名，生成表字段的增量脚本  

1. 支持多张表操作；
2. 先判断表中是否有某个字段，若存在则跳过，若不存在则新增。
'''
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
        coon = cx_Oracle.connect('tcmptest', 'tcmptest', '192.168.58.23:1521/orcl')   # 建立连接，3 个参数分开写
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
select t.column_name,
       t.data_type,
       t.data_length,
       t.data_scale,
       t.nullable,
       t.column_id,
       c.comments,
       (SELECT CASE WHEN t.column_name = m.column_name THEN 1 ELSE 0 END FROM DUAL) iskey,
       tb.comments,
       case when t.data_type='VARCHAR2' then t.data_type||'('||t.data_length||')'
            when t.data_type='NUMBER' and t.data_scale=0 then t.data_type||'('||t.data_length||')'
            when t.data_type='NUMBER' and t.data_scale<>0 then t.data_type||'('||t.data_length||','||t.data_scale||')'
       else t.data_type end xxxx
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

def judgeStr():
    ISOTIMEFORMAT='%Y-%m-%d %X'
    ti = time.strftime( ISOTIMEFORMAT,time.localtime())
    return '''
--建表脚本创建开始:" %s
declare
v_cnt      int          :=0;
begin
    ''' % (ti)

def col_comments(tableName,cols):
    s = ''
    for x in range(len(cols)):
        cs = cols[x]
        if cs[6] is not None:
            nullable = ''
            if cs[4]=='N':
                nullable = 'not null'
            s += "  SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = '%s' AND COLUMN_NAME = '%s';\n" % (tableName,cs[0]) 
            s += "   if v_cnt = 0  then\n"
            s += "     execute immediate 'alter table %s add %s %s %s';\n" % (tableName,cs[0],cs[9],nullable) 
            s += "     execute immediate 'comment on column %s.%s is ''%s''';\n" % (tableName,cs[0],cs[6]) 
            s += "     dbms_output.put_line('添加%s(%s)成功！');\n" % (cs[0],cs[6])
            s += "   end if;\n "
    return s

def create_table_sql(tableNames):
    tlist = []
    tlist.append(judgeStr())
    for x in range(len(tableNames)):
        tableName = str.upper(tableNames[x])
        columns = get_columns(table_sql(tableName))
        tlist.append(col_comments(tableName,columns))
    tlist.append("commit;\nend;\n/\n")
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