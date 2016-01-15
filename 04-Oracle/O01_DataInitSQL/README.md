##脚本功能说明

使用PLSQL导出的数据SQL如下：  
	
	insert into tsys_organization (ORG_ID, DIMENSION, ORG_CODE, ORG_NAME, PARENT_ID, MANAGE_ID, POSITION_CODE, ORG_CATE, ORG_LEVEL, ORG_ORDER, ORG_PATH, SSO_ORG_CODE, SSO_PARENT_CODE, EXT_ID, REMARK, STATUS, L_LEVEL, L_LEAF, HEADS, LEADER, ISVIRTUAL)
	values ('0_000000', '0', '0_000000', '中铁信托有限责任公司', 'bizroot', 'bizroot', null, '1', '0', 0, '#bizroot#0_000000#', null, null, null, null, 0, null, null, null, null, null);
	
	insert into tsys_organization (ORG_ID, DIMENSION, ORG_CODE, ORG_NAME, PARENT_ID, MANAGE_ID, POSITION_CODE, ORG_CATE, ORG_LEVEL, ORG_ORDER, ORG_PATH, SSO_ORG_CODE, SSO_PARENT_CODE, EXT_ID, REMARK, STATUS, L_LEVEL, L_LEAF, HEADS, LEADER, ISVIRTUAL)
	values ('0_001', '0', '0_001', '公司领导及高管', '0_000000', '0_000000', '0_001head', '2', '0', 0, '#bizroot#0_000000#0_001#', null, null, null, null, 0, 1, 1, 'JKQ', 'BHX', 1);
	
	insert into tsys_organization (ORG_ID, DIMENSION, ORG_CODE, ORG_NAME, PARENT_ID, MANAGE_ID, POSITION_CODE, ORG_CATE, ORG_LEVEL, ORG_ORDER, ORG_PATH, SSO_ORG_CODE, SSO_PARENT_CODE, EXT_ID, REMARK, STATUS, L_LEVEL, L_LEAF, HEADS, LEADER, ISVIRTUAL)
	values ('0_012', '0', '0_012', '市场重庆开发部', '0_000000', '0_000000', '0_012head', '1', '0', 11, '#bizroot#0_000000#0_012#', null, null, null, null, 0, null, null, null, null, null);

这种形式的SQL分为多次insert，执行效率极低。  
在数据量较大的时候，非常容易造成PLSQL卡死。  

本脚本的在输入表名后，即可生成如下脚本：   

	delete from TSYS_ORGANIZATION;
	
	insert into TSYS_ORGANIZATION(ORG_ID,DIMENSION,ORG_CODE,ORG_NAME,PARENT_ID,MANAGE_ID,POSITION_CODE,ORG_CATE,ORG_LEVEL,ORG_ORDER,ORG_PATH,SSO_ORG_CODE,SSO_PARENT_CODE,EXT_ID,REMARK,STATUS,L_LEVEL,L_LEAF,HEADS,LEADER,ISVIRTUAL)
	select '0_000000','0','0_000000','中铁信托有限责任公司','bizroot','bizroot',null,'1','0',0,'#bizroot#0_000000#',null,null,null,null,0,null,null,null,null,null from dual union all
	select '0_001','0','0_001','公司领导及高管','0_000000','0_000000','0_001head','2','0',0,'#bizroot#0_000000#0_001#',null,null,null,null,0,1,1,'JKQ','BHX',1 from dual union all
	select '0_012','0','0_012','市场重庆开发部','0_000000','0_000000','0_012head','1','0',11,'#bizroot#0_000000#0_012#',null,null,null,null,0,null,null,null,null,null from dual;
	
	commit;

只有一个insert，将极大的提高执行效率。同时也避免了去PLSQL导出脚本的不方便。
