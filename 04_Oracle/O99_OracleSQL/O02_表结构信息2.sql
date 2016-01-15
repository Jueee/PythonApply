select t.table_name,
       t.column_name,
       t.data_type,
       t.data_length,
       t.data_scale,
       t.nullable,
       t.column_id,
       c.comments,
       (SELECT CASE WHEN t.column_name = m.column_name THEN 1 ELSE 0 END FROM DUAL) iskey
  FROM user_tab_cols t,
       user_col_comments c,
       (select m.column_name
          from user_constraints s, user_cons_columns m
         where lower(m.table_name) = 'tsys_organization'
           and m.table_name = s.table_name
           and m.constraint_name = s.constraint_name
           and s.constraint_type = 'P') m
 WHERE lower(t.table_name) = 'tsys_organization'
   and c.table_name = t.table_name
   and c.column_name = t.column_name
   and t.hidden_column = 'NO'
 order by t.column_id
