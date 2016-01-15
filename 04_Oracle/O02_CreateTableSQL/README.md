##根据表名，生成建表脚本  

1. 支持多张表操作；
2. 若数据库中存在表，则先删再建。



####示例  

	TABLE_NAMES = ['tsys_organization','tsys_user']
####执行结果  

		
	--建表脚本创建开始:" 2016-01-15 20:24:31

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
	    
	/* Table：TSYS_ORGANIZATION*/
	IF fc_IsTabExists('TSYS_ORGANIZATION') THEN
	  execute immediate 'drop table TSYS_ORGANIZATION';
	END IF;
	
	execute immediate '
	create table TSYS_ORGANIZATION
	(
	   ORG_ID              VARCHAR2(40) not null,
	   DIMENSION           VARCHAR2(8),
	   ORG_CODE            VARCHAR2(32),
	   ORG_NAME            VARCHAR2(32),
	   PARENT_ID           VARCHAR2(32),
	   MANAGE_ID           VARCHAR2(32),
	   POSITION_CODE       VARCHAR2(64),
	   ORG_CATE            VARCHAR2(8),
	   ORG_LEVEL           VARCHAR2(8),
	   ORG_ORDER           NUMBER(22),
	   ORG_PATH            VARCHAR2(1024),
	   SSO_ORG_CODE        VARCHAR2(32),
	   SSO_PARENT_CODE     VARCHAR2(32),
	   EXT_ID              VARCHAR2(128),
	   REMARK              VARCHAR2(256),
	   STATUS              NUMBER(22),
	   L_LEVEL             NUMBER(22),
	   L_LEAF              NUMBER(22),
	   HEADS               VARCHAR2(32),
	   LEADER              VARCHAR2(32),
	   ISVIRTUAL           NUMBER(22)
	)';
	-- Add comments to the table
	execute immediate 'comment on table  TSYS_ORGANIZATION is ''组织机构表''';
	-- Add comments to the columns
	execute immediate 'comment on column TSYS_ORGANIZATION.ORG_ID is ''组织ID''';
	execute immediate 'comment on column TSYS_ORGANIZATION.DIMENSION is ''维度''';
	execute immediate 'comment on column TSYS_ORGANIZATION.ORG_CODE is ''组织机构编码''';
	execute immediate 'comment on column TSYS_ORGANIZATION.ORG_NAME is ''组织机构名称''';
	execute immediate 'comment on column TSYS_ORGANIZATION.PARENT_ID is ''上级组织标识''';
	execute immediate 'comment on column TSYS_ORGANIZATION.MANAGE_ID is ''组管组织标识''';
	execute immediate 'comment on column TSYS_ORGANIZATION.POSITION_CODE is ''负责岗位标识''';
	execute immediate 'comment on column TSYS_ORGANIZATION.ORG_CATE is ''组织分类【BIZ_ORG_CATE：1-前台/2-中后台/3-非业务高管/9-其他】''';
	execute immediate 'comment on column TSYS_ORGANIZATION.ORG_LEVEL is ''组织级别【留用业务分类，BIZ_ORG_LEVEL：0-信托业务/1-自营业务/2-财富管理/3-高管】''';
	execute immediate 'comment on column TSYS_ORGANIZATION.ORG_ORDER is ''组织序号''';
	execute immediate 'comment on column TSYS_ORGANIZATION.ORG_PATH is ''组织内码''';
	execute immediate 'comment on column TSYS_ORGANIZATION.SSO_ORG_CODE is ''SSO组织编码''';
	execute immediate 'comment on column TSYS_ORGANIZATION.SSO_PARENT_CODE is ''SSO上级组织编码''';
	execute immediate 'comment on column TSYS_ORGANIZATION.EXT_ID is ''扩展标识''';
	execute immediate 'comment on column TSYS_ORGANIZATION.REMARK is ''备注''';
	execute immediate 'comment on column TSYS_ORGANIZATION.STATUS is ''状态''';
	execute immediate 'comment on column TSYS_ORGANIZATION.L_LEVEL is ''级次【0－99】''';
	execute immediate 'comment on column TSYS_ORGANIZATION.L_LEAF is ''是否明细【9006：0否/1是】''';
	execute immediate 'comment on column TSYS_ORGANIZATION.HEADS is ''负责人''';
	execute immediate 'comment on column TSYS_ORGANIZATION.LEADER is ''主管领导''';
	execute immediate 'comment on column TSYS_ORGANIZATION.ISVIRTUAL is ''是否虚拟【9006：0否/1是】''';
	
	execute immediate 'alter table TSYS_ORGANIZATION 
	add constraint PK_TSYS_ORGANIZATION primary key (ORG_ID) using index tablespace TS_TDC';
	
	/* Table：TSYS_USER*/
	IF fc_IsTabExists('TSYS_USER') THEN
	  execute immediate 'drop table TSYS_USER';
	END IF;
	
	execute immediate '
	create table TSYS_USER
	(
	   USER_ID             VARCHAR2(32) not null,
	   USER_NAME           VARCHAR2(32) not null,
	   USER_PWD            VARCHAR2(255) not null,
	   USER_TYPE           VARCHAR2(8) not null,
	   USER_STATUS         VARCHAR2(8) not null,
	   LOCK_STATUS         VARCHAR2(8),
	   CREATE_DATE         NUMBER(22) not null,
	   MODIFY_DATE         NUMBER(22),
	   PASS_MODIFY_DATE    NUMBER(22),
	   REMARK              VARCHAR2(256),
	   EXT_FIELD_1         VARCHAR2(256),
	   EXT_FIELD_2         VARCHAR2(256),
	   EXT_FIELD_3         VARCHAR2(256),
	   EXT_FIELD_4         VARCHAR2(256),
	   EXT_FIELD_5         VARCHAR2(256),
	   MOBILE              VARCHAR2(32),
	   EMAIL               VARCHAR2(256),
	   EXT_FLAG            VARCHAR2(8),
	   ORG_ID              VARCHAR2(40),
	   USER_ORDER          NUMBER(22),
	   USER_URL            VARCHAR2(250),
	   C_IDENTITYTYPE      VARCHAR2(3),
	   C_IDENTITYNO        VARCHAR2(40),
	   C_CREDENTIALS       VARCHAR2(40),
	   CREATE_TIME         NUMBER(22),
	   MODIFY_TIME         NUMBER(22),
	   C_XTJLZJLX          VARCHAR2(1),
	   C_XTJLZJHM          VARCHAR2(40),
	   C_XTJLZGRZHM        VARCHAR2(40),
	   PORTAL_THEME        VARCHAR2(100),
	   C_ISSENDSMS         VARCHAR2(1),
	   C_FAX               VARCHAR2(32),
	   C_TELEPHONE         VARCHAR2(32)
	)';
	-- Add comments to the columns
	execute immediate 'comment on column TSYS_USER.C_IDENTITYTYPE is ''证件类型''';
	execute immediate 'comment on column TSYS_USER.C_IDENTITYNO is ''证件号码''';
	execute immediate 'comment on column TSYS_USER.C_CREDENTIALS is ''资格证书''';
	execute immediate 'comment on column TSYS_USER.C_ISSENDSMS is ''默认为1， 1表示接收短信、0表示不接收短信''';
	execute immediate 'comment on column TSYS_USER.C_TELEPHONE is ''20150821新增字段''';
	
	execute immediate 'alter table TSYS_USER 
	add constraint PK_TSYS_USER primary key (USER_ID) using index tablespace TS_TDC';
	
	END;
	/
