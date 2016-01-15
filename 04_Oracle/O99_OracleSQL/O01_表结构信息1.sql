select a.owner 所属用户,
       a.table_name 表名,
       a.column_name 字段名,
       a.data_type 字段类型,
       a.字段长度,
       a.字段精度,
       a.是否为空,
       a.orderid 排序,
       a.创建日期,
       a.最后修改日期,
       case when a.owner = d.owner and a.table_name = d.table_name and a.column_name = d.column_name then '主键' else '' end 是否主键
  from (select a.owner,
               a.table_name,
               b.column_name,
               b.data_type,
               case when b.data_precision is null then b.data_length else data_precision end 字段长度,
               data_scale 字段精度,
               decode(nullable, 'Y', '√', 'N', '×') 是否为空,
               b.COLUMN_ID orderid,
               c.created 创建日期,
               c.last_ddl_time 最后修改日期
          from all_tables a, all_tab_columns b, all_objects c
         where a.table_name = b.table_name
           and a.owner = b.owner
           and a.owner = c.owner
           and a.table_name = c.object_name
           and a.owner = upper('scott') --这个是查某个用户，你到时候把用户名换一下就好，一定大写
           and c.object_type = 'TABLE') a
  left join (select a.owner, a.table_name, a.column_name, a.constraint_name
               from user_cons_columns a, user_constraints b
              where a.constraint_name = b.constraint_name
                and b.constraint_type = 'P') d
    on a.owner = d.owner
   and a.table_name = d.table_name
   and a.column_name = d.column_name
 order by a.owner, a.table_name,a.orderid;
