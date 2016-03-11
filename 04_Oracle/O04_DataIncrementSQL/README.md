##根据表名和字段等信息，生成表数据内容的增量脚本  
先判断表中某记录是否存在，若存在则跳过，若不存在则新增。
####示例  

	tableName = 'tsys_parameter'  
	fieldName = 'PARAM_CODE'  
	whereValue = " and kind_code='TSR_PARA'"
以上条件，将拼装为SQL：    
	
	select t.* from tsys_parameter t where t.kind_code='TSR_PARA';
并根据 PARAM_CODE 字段，来判断记录是否存在，并进行导出。
####执行结果  	                                                                                                                                      
	declare                                                                                                                                                                                                  
	v_cnt int :=0;                                                                                                                                                                                           
	begin                                                                                                                                                                                                    
	  SELECT COUNT(*)  into v_cnt FROM TSYS_PARAMETER WHERE PARAM_CODE = 'isShowDeptnameAndProjcode';                                                                                                        
	  if v_cnt = 0  then                                                                                                                                                                                     
	     insert into TSYS_PARAMETER(PARAM_CODE,REL_ORG,KIND_CODE,PARAM_NAME,PARAM_VALUE,LIFECYCLE,PLATFORM,PARAM_DESC,EXT_FLAG,PARAM_REGEX)                                                                  
	     select 'isShowDeptnameAndProjcode','0_000000','TSR_PARA','是否显示所属部门和项目代码','0',null,null,'是否显示全要素报表中所属部门和项目代码  0:不显示  1:显示',null,null from dual;                 
	     dbms_output.put_line('添加TSYS_PARAMETER(isShowDeptnameAndProjcode)成功！');                                                                                                                        
	  end if;                                                                                                                                                                                                
	  SELECT COUNT(*)  into v_cnt FROM TSYS_PARAMETER WHERE PARAM_CODE = 'isUpdatePredictYield';                                                                                                             
	  if v_cnt = 0  then                                                                                                                                                                                     
	     insert into TSYS_PARAMETER(PARAM_CODE,REL_ORG,KIND_CODE,PARAM_NAME,PARAM_VALUE,LIFECYCLE,PLATFORM,PARAM_DESC,EXT_FLAG,PARAM_REGEX)                                                                  
	     select 'isUpdatePredictYield','0_000000','TSR_PARA','是否更新收益率','0',null,'0','0：不更新，维持TA原数据值/1：更新，从申报数据产品表取数',null,null from dual;                                    
	     dbms_output.put_line('添加TSYS_PARAMETER(isUpdatePredictYield)成功！');                                                                                                                             
	  end if;                                                                                                                                                                                                
	  SELECT COUNT(*)  into v_cnt FROM TSYS_PARAMETER WHERE PARAM_CODE = 'isReferToCustType';                                                                                                                
	  if v_cnt = 0  then                                                                                                                                                                                     
	     insert into TSYS_PARAMETER(PARAM_CODE,REL_ORG,KIND_CODE,PARAM_NAME,PARAM_VALUE,LIFECYCLE,PLATFORM,PARAM_DESC,EXT_FLAG,PARAM_REGEX)                                                                  
	     select 'isReferToCustType','0_000000','TSR_PARA','是否参考客户类型生成投资客户类型','2',null,'0','1:默认生成单位和个人投资客户类型/2:根据实际客户类型生成投资客户类型',null,null from dual;         
	     dbms_output.put_line('添加TSYS_PARAMETER(isReferToCustType)成功！');                                                                                                                                
	  end if;                                                                                                                                                                                                
	                                                                                                                                                                                                         
	  commit;                                                                                                                                                                                                
	end;                                                                                                                                                                                                     
	/                                                                                                                                                                                                        
	                                                                                                                                                                                                                                                                                                                                       

