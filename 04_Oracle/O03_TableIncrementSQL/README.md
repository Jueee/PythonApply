##根据表名，生成表字段的增量脚本  

1. 支持多张表操作；
2. 先判断表中是否有某个字段，若存在则跳过，若不存在则新增。



####示例  

	TABLE_NAMES = ['tsys_organization','tsys_user']
####执行结果  

		
	                                                                                                                                      
	--建表脚本创建开始:" 2016-03-11 09:01:06                                                                                              
	declare                                                                                                                               
	v_cnt      int          :=0;                                                                                                          
	begin                                                                                                                                 
	   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TSYS_ORGANIZATION' AND COLUMN_NAME = 'ORG_ID';            
	   if v_cnt = 0  then                                                                                                                 
	     execute immediate 'alter table TSYS_ORGANIZATION add ORG_ID VARCHAR2(40) not null';                                              
	     execute immediate 'comment on column TSYS_ORGANIZATION.ORG_ID is ''组织机构标识''';                                              
	     dbms_output.put_line('添加ORG_ID(组织机构标识)成功！');                                                                          
	   end if;                                                                                                                            
	   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TSYS_ORGANIZATION' AND COLUMN_NAME = 'DIMENSION';            
	   if v_cnt = 0  then                                                                                                                 
	     execute immediate 'alter table TSYS_ORGANIZATION add DIMENSION VARCHAR2(8) ';                                                    
	     execute immediate 'comment on column TSYS_ORGANIZATION.DIMENSION is ''维度''';                                                   
	     dbms_output.put_line('添加DIMENSION(维度)成功！');                                                                               
	   end if;                                                                                                                            
	   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TSYS_ORGANIZATION' AND COLUMN_NAME = 'ORG_CODE';             
	   if v_cnt = 0  then                                                                                                                 
	     execute immediate 'alter table TSYS_ORGANIZATION add ORG_CODE VARCHAR2(32) ';                                                    
	     execute immediate 'comment on column TSYS_ORGANIZATION.ORG_CODE is ''组织机构编码''';                                            
	     dbms_output.put_line('添加ORG_CODE(组织机构编码)成功！');                                                                        
	   end if;                                                                                                                            
	   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TSYS_USER' AND COLUMN_NAME = 'USER_ID';                      
	   if v_cnt = 0  then                                                                                                                 
	     execute immediate 'alter table TSYS_USER add USER_ID VARCHAR2(32) not null';                                                     
	     execute immediate 'comment on column TSYS_USER.USER_ID is ''用户代码''';                                                         
	     dbms_output.put_line('添加USER_ID(用户代码)成功！');                                                                             
	   end if;                                                                                                                            
	   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TSYS_USER' AND COLUMN_NAME = 'USER_NAME';                    
	   if v_cnt = 0  then                                                                                                                 
	     execute immediate 'alter table TSYS_USER add USER_NAME VARCHAR2(32) not null';                                                   
	     execute immediate 'comment on column TSYS_USER.USER_NAME is ''用户名称''';                                                       
	     dbms_output.put_line('添加USER_NAME(用户名称)成功！');                                                                           
	   end if;                                                                                                                            
	   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TSYS_USER' AND COLUMN_NAME = 'USER_PWD';                     
	   if v_cnt = 0  then                                                                                                                 
	     execute immediate 'alter table TSYS_USER add USER_PWD VARCHAR2(255) not null';                                                   
	     execute immediate 'comment on column TSYS_USER.USER_PWD is ''用户密码''';                                                        
	     dbms_output.put_line('添加USER_PWD(用户密码)成功！');                                                                            
	   end if;                                                                                                                            
	 commit;                                                                                                                              
	end;                                                                                                                                  
	/                                                                                                                                     

