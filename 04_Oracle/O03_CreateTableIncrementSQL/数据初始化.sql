
--建表脚本创建开始:" 2016-03-10 17:42:12
declare
v_cnt      int          :=0;
begin
      SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_PK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_PK VARCHAR2(64)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_PK is ''主键ID=统计日期+项目代码''';
     dbms_output.put_line('添加C_PK(主键ID=统计日期+项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'D_DATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add D_DATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.D_DATE is ''统计日期''';
     dbms_output.put_line('添加D_DATE(统计日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_PROJCODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_PROJCODE VARCHAR2(40)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_PROJCODE is ''项目代码''';
     dbms_output.put_line('添加C_PROJCODE(项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_PROJNAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_PROJNAME VARCHAR2(255)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_PROJNAME is ''项目简称''';
     dbms_output.put_line('添加C_PROJNAME(项目简称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_PROJFULLNAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_PROJFULLNAME VARCHAR2(255)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_PROJFULLNAME is ''项目全称''';
     dbms_output.put_line('添加C_PROJFULLNAME(项目全称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'D_BDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add D_BDATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.D_BDATE is ''成立日期''';
     dbms_output.put_line('添加D_BDATE(成立日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'D_EDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add D_EDATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.D_EDATE is ''到期日期''';
     dbms_output.put_line('添加D_EDATE(到期日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'L_PERIOD';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add L_PERIOD NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.L_PERIOD is ''项目期限: 单位月，=round( ((到期日-成立日)/365)*12,0 )''';
     dbms_output.put_line('添加L_PERIOD(项目期限: 单位月，=round( ((到期日-成立日)/365)*12,0 ))成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'L_EXISTDAYS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add L_EXISTDAYS NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.L_EXISTDAYS is ''存续天数：单位天''';
     dbms_output.put_line('添加L_EXISTDAYS(存续天数：单位天)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'L_PROJKIND';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add L_PROJKIND NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.L_PROJKIND is ''项目类型: 1单一资金/2集合资金/3财产及财产权''';
     dbms_output.put_line('添加L_PROJKIND(项目类型: 1单一资金/2集合资金/3财产及财产权)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'L_FUNCTYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add L_FUNCTYPE NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.L_FUNCTYPE is ''功能分类: 1融资类/2投资类/3事务管理类''';
     dbms_output.put_line('添加L_FUNCTYPE(功能分类: 1融资类/2投资类/3事务管理类)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'L_COOPTYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add L_COOPTYPE NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.L_COOPTYPE is ''合作类型：1银信合作/2证信合作/3银信合作.信政合作/4信政合作/5私募基金合作/6银信合作.私募基金合作/9其他''';
     dbms_output.put_line('添加L_COOPTYPE(合作类型：1银信合作/2证信合作/3银信合作.信政合作/4信政合作/5私募基金合作/6银信合作.私募基金合作/9其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'L_INDUSTRY';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add L_INDUSTRY NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.L_INDUSTRY is ''投向行业：1基础产业/2房地产/3证券/4金融机构/5工商企业/9其他''';
     dbms_output.put_line('添加L_INDUSTRY(投向行业：1基础产业/2房地产/3证券/4金融机构/5工商企业/9其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_RUNMODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_RUNMODE VARCHAR2(8)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_RUNMODE is ''运行方式: 0封闭/1开放''';
     dbms_output.put_line('添加C_RUNMODE(运行方式: 0封闭/1开放)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_MANAGETYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_MANAGETYPE VARCHAR2(8)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_MANAGETYPE is ''管理责任分类: 0主动/1被动''';
     dbms_output.put_line('添加C_MANAGETYPE(管理责任分类: 0主动/1被动)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_INDUSTRYDTL1';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_INDUSTRYDTL1 VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_INDUSTRYDTL1 is ''行业明细1''';
     dbms_output.put_line('添加C_INDUSTRYDTL1(行业明细1)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_INDUSTRYDTL2_NAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_INDUSTRYDTL2_NAME VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_INDUSTRYDTL2_NAME is ''行业明细2名称''';
     dbms_output.put_line('添加C_INDUSTRYDTL2_NAME(行业明细2名称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_INDUSTRYDTL2_B';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_INDUSTRYDTL2_B VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_INDUSTRYDTL2_B is ''行业明细2_B''';
     dbms_output.put_line('添加C_INDUSTRYDTL2_B(行业明细2_B)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_USEOFAREA';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_USEOFAREA VARCHAR2(32)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_USEOFAREA is ''资金投向地区代码''';
     dbms_output.put_line('添加C_USEOFAREA(资金投向地区代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_USEOFAREA_NAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_USEOFAREA_NAME VARCHAR2(60)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_USEOFAREA_NAME is ''资金投向地区名称''';
     dbms_output.put_line('添加C_USEOFAREA_NAME(资金投向地区名称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_ISQDII';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_ISQDII VARCHAR2(8)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_ISQDII is ''是否QDII''';
     dbms_output.put_line('添加C_ISQDII(是否QDII)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_ISPWFT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_ISPWFT VARCHAR2(8)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_ISPWFT is ''是否公益信托''';
     dbms_output.put_line('添加C_ISPWFT(是否公益信托)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_ISANNUITY';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_ISANNUITY VARCHAR2(8)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_ISANNUITY is ''是否年金信托''';
     dbms_output.put_line('添加C_ISANNUITY(是否年金信托)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_ISABS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_ISABS VARCHAR2(8)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_ISABS is ''是否资产证券化''';
     dbms_output.put_line('添加C_ISABS(是否资产证券化)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'F_EXPYIELDRATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add F_EXPYIELDRATE NUMBER(22,6)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.F_EXPYIELDRATE is ''预计收益率''';
     dbms_output.put_line('添加F_EXPYIELDRATE(预计收益率)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_TRUSTREWARDTYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_TRUSTREWARDTYPE VARCHAR2(2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_TRUSTREWARDTYPE is ''信托报酬计提方式[0-固定/1-浮动/2-固定+浮动]''';
     dbms_output.put_line('添加C_TRUSTREWARDTYPE(信托报酬计提方式[0-固定/1-浮动/2-固定+浮动])成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'F_TRUSTPAYRATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add F_TRUSTPAYRATE NUMBER(22,6)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.F_TRUSTPAYRATE is ''信托报酬率''';
     dbms_output.put_line('添加F_TRUSTPAYRATE(信托报酬率)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_RISKMEASURE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_RISKMEASURE VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_RISKMEASURE is ''风险缓释措施类型''';
     dbms_output.put_line('添加C_RISKMEASURE(风险缓释措施类型)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_RISKMEASURE_NAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_RISKMEASURE_NAME VARCHAR2(1000)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_RISKMEASURE_NAME is ''风险缓释措施名称''';
     dbms_output.put_line('添加C_RISKMEASURE_NAME(风险缓释措施名称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_TMANAGER';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_TMANAGER VARCHAR2(32)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_TMANAGER is ''项目经理''';
     dbms_output.put_line('添加C_TMANAGER(项目经理)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_CMANAGER';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_CMANAGER VARCHAR2(32)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_CMANAGER is ''项目高管''';
     dbms_output.put_line('添加C_CMANAGER(项目高管)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_OWERSIGHT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_OWERSIGHT VARCHAR2(32)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_OWERSIGHT is ''监管责任人''';
     dbms_output.put_line('添加C_OWERSIGHT(监管责任人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_ASNUMBER';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_ASNUMBER VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_ASNUMBER is ''账套号''';
     dbms_output.put_line('添加C_ASNUMBER(账套号)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_DEPTNAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_DEPTNAME VARCHAR2(32)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_DEPTNAME is ''所属部门''';
     dbms_output.put_line('添加C_DEPTNAME(所属部门)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'D_COLLTIME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add D_COLLTIME DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.D_COLLTIME is ''采集时间''';
     dbms_output.put_line('添加D_COLLTIME(采集时间)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_COLLMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_COLLMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_COLLMAN is ''采集人''';
     dbms_output.put_line('添加C_COLLMAN(采集人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'L_CHECKFLAG';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add L_CHECKFLAG NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.L_CHECKFLAG is ''审核标志[TOTAL_FACTOR_CHECK]：0未审核/1已审核/2核查不通过/3已核查''';
     dbms_output.put_line('添加L_CHECKFLAG(审核标志[TOTAL_FACTOR_CHECK]：0未审核/1已审核/2核查不通过/3已核查)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'D_CHECKDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add D_CHECKDATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.D_CHECKDATE is ''审核日期''';
     dbms_output.put_line('添加D_CHECKDATE(审核日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_CHECKMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_CHECKMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_CHECKMAN is ''审核人''';
     dbms_output.put_line('添加C_CHECKMAN(审核人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_REMARK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_REMARK VARCHAR2(255)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_REMARK is ''备注''';
     dbms_output.put_line('添加C_REMARK(备注)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_TCMP' AND COLUMN_NAME = 'C_CHECKINFO';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_TCMP add C_CHECKINFO VARCHAR2(4000)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_TCMP.C_CHECKINFO is ''核查信息''';
     dbms_output.put_line('添加C_CHECKINFO(核查信息)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'C_PK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add C_PK VARCHAR2(64)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.C_PK is ''主键ID=统计日期+项目代码''';
     dbms_output.put_line('添加C_PK(主键ID=统计日期+项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'D_DATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add D_DATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.D_DATE is ''统计日期''';
     dbms_output.put_line('添加D_DATE(统计日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'C_PROJCODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add C_PROJCODE VARCHAR2(40)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.C_PROJCODE is ''项目代码''';
     dbms_output.put_line('添加C_PROJCODE(项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_SSXT_TA';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_SSXT_TA NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_SSXT_TA is ''实收信托TA''';
     dbms_output.put_line('添加F_SSXT_TA(实收信托TA)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_BANKBS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_BANKBS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_BANKBS is ''资金来源_银行表内资金''';
     dbms_output.put_line('添加F_FS_BANKBS(资金来源_银行表内资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_BANKFC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_BANKFC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_BANKFC is ''资金来源_银行理财资金''';
     dbms_output.put_line('添加F_FS_BANKFC(资金来源_银行理财资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_BANKARO';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_BANKARO NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_BANKARO is ''资金来源_银行代销机构''';
     dbms_output.put_line('添加F_FS_BANKARO(资金来源_银行代销机构)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_BANKARN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_BANKARN NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_BANKARN is ''资金来源_银行代销自然人''';
     dbms_output.put_line('添加F_FS_BANKARN(资金来源_银行代销自然人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_STOCKBS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_STOCKBS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_STOCKBS is ''资金来源_证券表内资金''';
     dbms_output.put_line('添加F_FS_STOCKBS(资金来源_证券表内资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_STOCKFC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_STOCKFC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_STOCKFC is ''资金来源_证券理财资金''';
     dbms_output.put_line('添加F_FS_STOCKFC(资金来源_证券理财资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_STOCKAR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_STOCKAR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_STOCKAR is ''资金来源_证券代理推荐''';
     dbms_output.put_line('添加F_FS_STOCKAR(资金来源_证券代理推荐)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_FUNDBS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_FUNDBS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_FUNDBS is ''资金来源_基金表内资金''';
     dbms_output.put_line('添加F_FS_FUNDBS(资金来源_基金表内资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_FUNDFC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_FUNDFC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_FUNDFC is ''资金来源_基金理财资金''';
     dbms_output.put_line('添加F_FS_FUNDFC(资金来源_基金理财资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_FUNDAR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_FUNDAR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_FUNDAR is ''资金来源_基金代理推荐''';
     dbms_output.put_line('添加F_FS_FUNDAR(资金来源_基金代理推荐)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_INSUREBS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_INSUREBS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_INSUREBS is ''资金来源_保险表内资金''';
     dbms_output.put_line('添加F_FS_INSUREBS(资金来源_保险表内资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_INSUREFC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_INSUREFC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_INSUREFC is ''资金来源_保险理财资金''';
     dbms_output.put_line('添加F_FS_INSUREFC(资金来源_保险理财资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_INSUREAR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_INSUREAR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_INSUREAR is ''资金来源_保险代理推荐''';
     dbms_output.put_line('添加F_FS_INSUREAR(资金来源_保险代理推荐)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_OFIBS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_OFIBS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_OFIBS is ''资金来源_其他金融表内资金''';
     dbms_output.put_line('添加F_FS_OFIBS(资金来源_其他金融表内资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_OFIFC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_OFIFC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_OFIFC is ''资金来源_其他金融理财资金''';
     dbms_output.put_line('添加F_FS_OFIFC(资金来源_其他金融理财资金)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_OFIAR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_OFIAR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_OFIAR is ''资金来源_其他金融代理推荐''';
     dbms_output.put_line('添加F_FS_OFIAR(资金来源_其他金融代理推荐)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_NOFIOC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_NOFIOC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_NOFIOC is ''资金来源_非金融机构''';
     dbms_output.put_line('添加F_FS_NOFIOC(资金来源_非金融机构)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_NOFINC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_NOFINC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_NOFINC is ''资金来源_非金融自然人''';
     dbms_output.put_line('添加F_FS_NOFINC(资金来源_非金融自然人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_SELFMKOC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_SELFMKOC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_SELFMKOC is ''资金来源_自主营销机构''';
     dbms_output.put_line('添加F_FS_SELFMKOC(资金来源_自主营销机构)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_FS_SELFMKNC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_FS_SELFMKNC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_FS_SELFMKNC is ''资金来源_自主营销自然人''';
     dbms_output.put_line('添加F_FS_SELFMKNC(资金来源_自主营销自然人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_PS_BANKAR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_PS_BANKAR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_PS_BANKAR is ''项目来源_银行推荐''';
     dbms_output.put_line('添加F_PS_BANKAR(项目来源_银行推荐)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_PS_OFIAR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_PS_OFIAR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_PS_OFIAR is ''项目来源_其他金融推荐''';
     dbms_output.put_line('添加F_PS_OFIAR(项目来源_其他金融推荐)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_PS_SELFMK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_PS_SELFMK NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_PS_SELFMK is ''项目来源_自主开发''';
     dbms_output.put_line('添加F_PS_SELFMK(项目来源_自主开发)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_PS_OTHER';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_PS_OTHER NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_PS_OTHER is ''项目来源_其他''';
     dbms_output.put_line('添加F_PS_OTHER(项目来源_其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'L_SECBENF_NPQ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add L_SECBENF_NPQ NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.L_SECBENF_NPQ is ''劣后受益人_自然人个数''';
     dbms_output.put_line('添加L_SECBENF_NPQ(劣后受益人_自然人个数)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_SECBENF_NPM';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_SECBENF_NPM NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_SECBENF_NPM is ''劣后受益人_自然人金额''';
     dbms_output.put_line('添加F_SECBENF_NPM(劣后受益人_自然人金额)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'L_SECBENF_FIQ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add L_SECBENF_FIQ NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.L_SECBENF_FIQ is ''劣后受益人_金融机构个数''';
     dbms_output.put_line('添加L_SECBENF_FIQ(劣后受益人_金融机构个数)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_SECBENF_FIM';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_SECBENF_FIM NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_SECBENF_FIM is ''劣后受益人_金融机构金额''';
     dbms_output.put_line('添加F_SECBENF_FIM(劣后受益人_金融机构金额)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'L_SECBENF_OIQ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add L_SECBENF_OIQ NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.L_SECBENF_OIQ is ''劣后受益人_普通机构个数''';
     dbms_output.put_line('添加L_SECBENF_OIQ(劣后受益人_普通机构个数)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'F_SECBENF_OIM';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add F_SECBENF_OIM NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.F_SECBENF_OIM is ''劣后受益人_普通机构金额''';
     dbms_output.put_line('添加F_SECBENF_OIM(劣后受益人_普通机构金额)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'D_COLLTIME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add D_COLLTIME DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.D_COLLTIME is ''采集时间''';
     dbms_output.put_line('添加D_COLLTIME(采集时间)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'C_COLLMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add C_COLLMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.C_COLLMAN is ''采集人''';
     dbms_output.put_line('添加C_COLLMAN(采集人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'L_CHECKFLAG';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add L_CHECKFLAG NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.L_CHECKFLAG is ''审核标志：0未审核/1审核中/2已审核''';
     dbms_output.put_line('添加L_CHECKFLAG(审核标志：0未审核/1审核中/2已审核)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'D_CHECKDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add D_CHECKDATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.D_CHECKDATE is ''审核日期''';
     dbms_output.put_line('添加D_CHECKDATE(审核日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'C_CHECKMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add C_CHECKMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.C_CHECKMAN is ''审核人''';
     dbms_output.put_line('添加C_CHECKMAN(审核人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'C_REMARK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add C_REMARK VARCHAR2(255)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.C_REMARK is ''备注''';
     dbms_output.put_line('添加C_REMARK(备注)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSTA' AND COLUMN_NAME = 'C_SUBPROJCODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSTA add C_SUBPROJCODE VARCHAR2(40)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSTA.C_SUBPROJCODE is ''子项目代码''';
     dbms_output.put_line('添加C_SUBPROJCODE(子项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_PK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_PK VARCHAR2(64)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_PK is ''主键ID=统计日期+项目代码''';
     dbms_output.put_line('添加C_PK(主键ID=统计日期+项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'D_DATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add D_DATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.D_DATE is ''统计日期''';
     dbms_output.put_line('添加D_DATE(统计日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_PROJCODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_PROJCODE VARCHAR2(40)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_PROJCODE is ''项目代码''';
     dbms_output.put_line('添加C_PROJCODE(项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'L_RIVALID';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add L_RIVALID NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.L_RIVALID is ''对手ID''';
     dbms_output.put_line('添加L_RIVALID(对手ID)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_RIVALNAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_RIVALNAME VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_RIVALNAME is ''对手名称''';
     dbms_output.put_line('添加C_RIVALNAME(对手名称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'L_RIVALTYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add L_RIVALTYPE NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.L_RIVALTYPE is ''对手类别【1个人/2机构】''';
     dbms_output.put_line('添加L_RIVALTYPE(对手类别【1个人/2机构】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_AREA';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_AREA VARCHAR2(16)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_AREA is ''行政区域代码''';
     dbms_output.put_line('添加C_AREA(行政区域代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_AREANAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_AREANAME VARCHAR2(60)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_AREANAME is ''行政区域名称''';
     dbms_output.put_line('添加C_AREANAME(行政区域名称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_LISTEDTYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_LISTEDTYPE VARCHAR2(16)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_LISTEDTYPE is ''上市标志【0-非上市、1-境内上市、2-境外上市、3-其他】''';
     dbms_output.put_line('添加C_LISTEDTYPE(上市标志【0-非上市、1-境内上市、2-境外上市、3-其他】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_PLATFORMTYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_PLATFORMTYPE VARCHAR2(16)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_PLATFORMTYPE is ''平台标志【0-非平台；1-非名单类平台；2-调出类平台；3-未调出类平台】''';
     dbms_output.put_line('添加C_PLATFORMTYPE(平台标志【0-非平台；1-非名单类平台；2-调出类平台；3-未调出类平台】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_GOVNAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_GOVNAME VARCHAR2(64)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_GOVNAME is ''所在政府名称''';
     dbms_output.put_line('添加C_GOVNAME(所在政府名称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_GOVLEVLE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_GOVLEVLE VARCHAR2(16)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_GOVLEVLE is ''所在政府级别''';
     dbms_output.put_line('添加C_GOVLEVLE(所在政府级别)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_ISGOVHOLDING';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_ISGOVHOLDING VARCHAR2(8)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_ISGOVHOLDING is ''是否政府控股【0-是；1-否】''';
     dbms_output.put_line('添加C_ISGOVHOLDING(是否政府控股【0-是；1-否】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_ENTSCALETYPE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_ENTSCALETYPE VARCHAR2(32)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_ENTSCALETYPE is ''企业规模类型【0-大型企业、1-中型企业、2-小型企业、3-微型企业】''';
     dbms_output.put_line('添加C_ENTSCALETYPE(企业规模类型【0-大型企业、1-中型企业、2-小型企业、3-微型企业】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_INDUSTRYDTL1';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_INDUSTRYDTL1 VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_INDUSTRYDTL1 is ''所属行业【A-农、林、牧、渔业；B-采掘业；C-制造业；D-电力、燃气及水的生产和供应业；E-建筑业；F-交通运输、仓储和邮政业；G-信息传输、计算机服务和软件业；H-批发和零售业；I-住宿和餐饮业；J-金融业；K-房地产业；L-租赁和商务服务业；M-科学研究、技术服务业和地质勘察业；N-水利、环境和公共设施管理业；O-居民服务和其他服务业；P-教育；Q-卫生、社会保障和社会福利业；R-文化、体育和娱乐业；S-公共管理和社会组织；T-国际组织；Z-未知】''';
     dbms_output.put_line('添加C_INDUSTRYDTL1(所属行业【A-农、林、牧、渔业；B-采掘业；C-制造业；D-电力、燃气及水的生产和供应业；E-建筑业；F-交通运输、仓储和邮政业；G-信息传输、计算机服务和软件业；H-批发和零售业；I-住宿和餐饮业；J-金融业；K-房地产业；L-租赁和商务服务业；M-科学研究、技术服务业和地质勘察业；N-水利、环境和公共设施管理业；O-居民服务和其他服务业；P-教育；Q-卫生、社会保障和社会福利业；R-文化、体育和娱乐业；S-公共管理和社会组织；T-国际组织；Z-未知】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_PACTBAL';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_PACTBAL NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_PACTBAL is ''合同余额【成本】''';
     dbms_output.put_line('添加F_PACTBAL(合同余额【成本】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_CFCOSTS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_CFCOSTS NUMBER(22,6)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_CFCOSTS is ''融资成本【年化】''';
     dbms_output.put_line('添加F_CFCOSTS(融资成本【年化】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_COLLRATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_COLLRATE NUMBER(22,6)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_COLLRATE is ''抵质押率''';
     dbms_output.put_line('添加F_COLLRATE(抵质押率)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'L_INSEQ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add L_INSEQ NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.L_INSEQ is ''内部序号''';
     dbms_output.put_line('添加L_INSEQ(内部序号)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_WEIGHT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_WEIGHT NUMBER(22,6)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_WEIGHT is ''权重''';
     dbms_output.put_line('添加F_WEIGHT(权重)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_PTQYRZ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_PTQYRZ NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_PTQYRZ is ''项目情况_信政类_一般公司类企业融资''';
     dbms_output.put_line('添加F_XMQK_XZ_PTQYRZ(项目情况_信政类_一般公司类企业融资)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_JTJCSS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_JTJCSS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_JTJCSS is ''项目情况_信政类_交通基础设施''';
     dbms_output.put_line('添加F_XMQK_XZ_JTJCSS(项目情况_信政类_交通基础设施)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_SZJCSS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_SZJCSS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_SZJCSS is ''项目情况_信政类_市政基础设施''';
     dbms_output.put_line('添加F_XMQK_XZ_SZJCSS(项目情况_信政类_市政基础设施)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_SLJNCJCSS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_SLJNCJCSS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_SLJNCJCSS is ''项目情况_信政类_水利及农村基础设施''';
     dbms_output.put_line('添加F_XMQK_XZ_SLJNCJCSS(项目情况_信政类_水利及农村基础设施)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_HJBFSS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_HJBFSS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_HJBFSS is ''项目情况_信政类_环境保护设施''';
     dbms_output.put_line('添加F_XMQK_XZ_HJBFSS(项目情况_信政类_环境保护设施)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_SHSY';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_SHSY NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_SHSY is ''项目情况_信政类_社会事业''';
     dbms_output.put_line('添加F_XMQK_XZ_SHSY(项目情况_信政类_社会事业)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_YQ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_YQ NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_YQ is ''项目情况_信政类_园区''';
     dbms_output.put_line('添加F_XMQK_XZ_YQ(项目情况_信政类_园区)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_TDCBZX';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_TDCBZX NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_TDCBZX is ''项目情况_信政类_土地储备中心''';
     dbms_output.put_line('添加F_XMQK_XZ_TDCBZX(项目情况_信政类_土地储备中心)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_BZXAJGC';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_BZXAJGC NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_BZXAJGC is ''项目情况_信政类_保障性安居工程''';
     dbms_output.put_line('添加F_XMQK_XZ_BZXAJGC(项目情况_信政类_保障性安居工程)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_XZ_QT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_XZ_QT NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_XZ_QT is ''项目情况_信政类_其他''';
     dbms_output.put_line('添加F_XMQK_XZ_QT(项目情况_信政类_其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_FXZFDC_ZZ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_FXZFDC_ZZ NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_FXZFDC_ZZ is ''项目情况_非信政类房地产_住宅''';
     dbms_output.put_line('添加F_XMQK_FXZFDC_ZZ(项目情况_非信政类房地产_住宅)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_FXZFDC_SY';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_FXZFDC_SY NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_FXZFDC_SY is ''项目情况_非信政类房地产_商用''';
     dbms_output.put_line('添加F_XMQK_FXZFDC_SY(项目情况_非信政类房地产_商用)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_FXZFDC_JSF';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_FXZFDC_JSF NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_FXZFDC_JSF is ''项目情况_非信政类房地产_经适房''';
     dbms_output.put_line('添加F_XMQK_FXZFDC_JSF(项目情况_非信政类房地产_经适房)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_FXZFDC_TDCB';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_FXZFDC_TDCB NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_FXZFDC_TDCB is ''项目情况_非信政类房地产_土地储备''';
     dbms_output.put_line('添加F_XMQK_FXZFDC_TDCB(项目情况_非信政类房地产_土地储备)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_FXZFDC_QT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_FXZFDC_QT NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_FXZFDC_QT is ''项目情况_非信政类房地产_其他''';
     dbms_output.put_line('添加F_XMQK_FXZFDC_QT(项目情况_非信政类房地产_其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_KCNY';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_KCNY NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_KCNY is ''项目情况_矿产能源''';
     dbms_output.put_line('添加F_XMQK_KCNY(项目情况_矿产能源)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_XMQK_QT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_XMQK_QT NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_XMQK_QT is ''项目情况_其他''';
     dbms_output.put_line('添加F_XMQK_QT(项目情况_其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_JYXXJL';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_JYXXJL NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_JYXXJL is ''预计还款来源_经营性现金流''';
     dbms_output.put_line('添加F_YJHKLY_JYXXJL(预计还款来源_经营性现金流)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_FDCXMXSSR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_FDCXMXSSR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_FDCXMXSSR is ''预计还款来源_房地产项目销售收入''';
     dbms_output.put_line('添加F_YJHKLY_FDCXMXSSR(预计还款来源_房地产项目销售收入)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_XTZCZRHCSBX';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_XTZCZRHCSBX NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_XTZCZRHCSBX is ''预计还款来源_信托资产转让或出售变现''';
     dbms_output.put_line('添加F_YJHKLY_XTZCZRHCSBX(预计还款来源_信托资产转让或出售变现)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_TDCRSR';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_TDCRSR NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_TDCRSR is ''预计还款来源_土地出让收入''';
     dbms_output.put_line('添加F_YJHKLY_TDCRSR(预计还款来源_土地出让收入)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_ZXFYFH';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_ZXFYFH NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_ZXFYFH is ''预计还款来源_专项费用返还''';
     dbms_output.put_line('添加F_YJHKLY_ZXFYFH(预计还款来源_专项费用返还)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_ZXSSFH';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_ZXSSFH NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_ZXSSFH is ''预计还款来源_专项税收返还''';
     dbms_output.put_line('添加F_YJHKLY_ZXSSFH(预计还款来源_专项税收返还)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_BOT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_BOT NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_BOT is ''预计还款来源_BOT或类似收入''';
     dbms_output.put_line('添加F_YJHKLY_BOT(预计还款来源_BOT或类似收入)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_CZDD';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_CZDD NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_CZDD is ''预计还款来源_财政兜底''';
     dbms_output.put_line('添加F_YJHKLY_CZDD(预计还款来源_财政兜底)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'F_YJHKLY_QT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add F_YJHKLY_QT NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.F_YJHKLY_QT is ''预计还款来源_其他''';
     dbms_output.put_line('添加F_YJHKLY_QT(预计还款来源_其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'D_COLLTIME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add D_COLLTIME DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.D_COLLTIME is ''采集时间''';
     dbms_output.put_line('添加D_COLLTIME(采集时间)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_COLLMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_COLLMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_COLLMAN is ''采集人''';
     dbms_output.put_line('添加C_COLLMAN(采集人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'L_CHECKFLAG';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add L_CHECKFLAG NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.L_CHECKFLAG is ''审核标志：0未审核/1审核中/2已审核''';
     dbms_output.put_line('添加L_CHECKFLAG(审核标志：0未审核/1审核中/2已审核)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'D_CHECKDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add D_CHECKDATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.D_CHECKDATE is ''审核日期''';
     dbms_output.put_line('添加D_CHECKDATE(审核日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_CHECKMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_CHECKMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_CHECKMAN is ''审核人''';
     dbms_output.put_line('添加C_CHECKMAN(审核人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_REMARK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_REMARK VARCHAR2(255)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_REMARK is ''备注''';
     dbms_output.put_line('添加C_REMARK(备注)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_CHECKINFO';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_CHECKINFO VARCHAR2(4000)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_CHECKINFO is ''核查信息''';
     dbms_output.put_line('添加C_CHECKINFO(核查信息)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_SUBPROJCODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_SUBPROJCODE VARCHAR2(40)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_SUBPROJCODE is ''子项目代码''';
     dbms_output.put_line('添加C_SUBPROJCODE(子项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_PROVINCENAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_PROVINCENAME VARCHAR2(60)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_PROVINCENAME is ''所属省份''';
     dbms_output.put_line('添加C_PROVINCENAME(所属省份)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_INDUSTRYDTL';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_INDUSTRYDTL VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_INDUSTRYDTL is ''投向行业明细【AM.2012版】''';
     dbms_output.put_line('添加C_INDUSTRYDTL(投向行业明细【AM.2012版】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_RISKMEASURE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_RISKMEASURE VARCHAR2(100)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_RISKMEASURE is ''风险缓释措施类型''';
     dbms_output.put_line('添加C_RISKMEASURE(风险缓释措施类型)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSAM' AND COLUMN_NAME = 'C_RISKMEASURE_NAME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSAM add C_RISKMEASURE_NAME VARCHAR2(1000)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSAM.C_RISKMEASURE_NAME is ''风险缓释措施名称''';
     dbms_output.put_line('添加C_RISKMEASURE_NAME(风险缓释措施名称)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'C_PK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add C_PK VARCHAR2(64)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.C_PK is ''主键ID=统计日期+项目代码''';
     dbms_output.put_line('添加C_PK(主键ID=统计日期+项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'D_DATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add D_DATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.D_DATE is ''统计日期''';
     dbms_output.put_line('添加D_DATE(统计日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'D_INITDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add D_INITDATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.D_INITDATE is ''初始化日【估值凭证的初始化日期】''';
     dbms_output.put_line('添加D_INITDATE(初始化日【估值凭证的初始化日期】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'C_PROJCODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add C_PROJCODE VARCHAR2(40)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.C_PROJCODE is ''项目代码''';
     dbms_output.put_line('添加C_PROJCODE(项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_SSXT_FA';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_SSXT_FA NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_SSXT_FA is ''实收信托FA''';
     dbms_output.put_line('添加F_SSXT_FA(实收信托FA)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_ZCYE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_ZCYE NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_ZCYE is ''资产合计【余额】''';
     dbms_output.put_line('添加F_ZCYE(资产合计【余额】)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_DK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_DK NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_DK is ''资金运用方式_贷款''';
     dbms_output.put_line('添加F_YYFS_DK(资金运用方式_贷款)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_JYX';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_JYX NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_JYX is ''资金运用方式_交易性''';
     dbms_output.put_line('添加F_YYFS_JYX(资金运用方式_交易性)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_KGCSCYDQ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_KGCSCYDQ NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_KGCSCYDQ is ''资金运用方式_可供出售及持有到期''';
     dbms_output.put_line('添加F_YYFS_KGCSCYDQ(资金运用方式_可供出售及持有到期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_CQGQTZ';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_CQGQTZ NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_CQGQTZ is ''资金运用方式_股权投资''';
     dbms_output.put_line('添加F_YYFS_CQGQTZ(资金运用方式_股权投资)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_RZZL';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_RZZL NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_RZZL is ''资金运用方式_租赁''';
     dbms_output.put_line('添加F_YYFS_RZZL(资金运用方式_租赁)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_MRFS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_MRFS NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_MRFS is ''资金运用方式_买入返售''';
     dbms_output.put_line('添加F_YYFS_MRFS(资金运用方式_买入返售)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_CFTY';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_CFTY NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_CFTY is ''资金运用方式_存放同业''';
     dbms_output.put_line('添加F_YYFS_CFTY(资金运用方式_存放同业)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_QT';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_QT NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_QT is ''资金运用方式_其他''';
     dbms_output.put_line('添加F_YYFS_QT(资金运用方式_其他)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_TRUSTPAY';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_TRUSTPAY NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_TRUSTPAY is ''信托报酬''';
     dbms_output.put_line('添加F_TRUSTPAY(信托报酬)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_OTHERFEE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_OTHERFEE NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_OTHERFEE is ''其他费用''';
     dbms_output.put_line('添加F_OTHERFEE(其他费用)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'L_BDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add L_BDATE NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.L_BDATE is ''成立日期''';
     dbms_output.put_line('添加L_BDATE(成立日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'L_EDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add L_EDATE NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.L_EDATE is ''到期日期''';
     dbms_output.put_line('添加L_EDATE(到期日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'L_EXISTDAYS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add L_EXISTDAYS NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.L_EXISTDAYS is ''存续天数''';
     dbms_output.put_line('添加L_EXISTDAYS(存续天数)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'L_BIEXISTDAYS';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add L_BIEXISTDAYS NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.L_BIEXISTDAYS is ''初始化前天数''';
     dbms_output.put_line('添加L_BIEXISTDAYS(初始化前天数)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_DAYAVGSCALE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_DAYAVGSCALE NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_DAYAVGSCALE is ''日均规模''';
     dbms_output.put_line('添加F_DAYAVGSCALE(日均规模)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_OTHERFEERATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_OTHERFEERATE NUMBER(22,6)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_OTHERFEERATE is ''其他费用率''';
     dbms_output.put_line('添加F_OTHERFEERATE(其他费用率)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'D_COLLTIME';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add D_COLLTIME DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.D_COLLTIME is ''采集时间''';
     dbms_output.put_line('添加D_COLLTIME(采集时间)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'C_COLLMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add C_COLLMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.C_COLLMAN is ''采集人''';
     dbms_output.put_line('添加C_COLLMAN(采集人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'L_CHECKFLAG';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add L_CHECKFLAG NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.L_CHECKFLAG is ''审核标志：0未审核/1审核中/2已审核''';
     dbms_output.put_line('添加L_CHECKFLAG(审核标志：0未审核/1审核中/2已审核)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'D_CHECKDATE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add D_CHECKDATE DATE';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.D_CHECKDATE is ''审核日期''';
     dbms_output.put_line('添加D_CHECKDATE(审核日期)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'C_CHECKMAN';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add C_CHECKMAN VARCHAR2(20)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.C_CHECKMAN is ''审核人''';
     dbms_output.put_line('添加C_CHECKMAN(审核人)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'C_REMARK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add C_REMARK VARCHAR2(255)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.C_REMARK is ''备注''';
     dbms_output.put_line('添加C_REMARK(备注)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'C_SUBPROJCODE';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add C_SUBPROJCODE VARCHAR2(40)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.C_SUBPROJCODE is ''子项目代码''';
     dbms_output.put_line('添加C_SUBPROJCODE(子项目代码)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'L_RIVAL_ID';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add L_RIVAL_ID NUMBER(22)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.L_RIVAL_ID is ''对手ID''';
     dbms_output.put_line('添加L_RIVAL_ID(对手ID)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'C_CONTRACTNO';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add C_CONTRACTNO VARCHAR2(32)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.C_CONTRACTNO is ''合同编号''';
     dbms_output.put_line('添加C_CONTRACTNO(合同编号)成功！');
   end if;
   SELECT COUNT(*)  into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TRPT_TPROJFULLFACTOR_HSFA' AND COLUMN_NAME = 'F_YYFS_TYCK';
   if v_cnt = 0  then
     execute immediate 'alter table TRPT_TPROJFULLFACTOR_HSFA add F_YYFS_TYCK NUMBER(22,2)';
     execute immediate 'comment on column TRPT_TPROJFULLFACTOR_HSFA.F_YYFS_TYCK is ''同业存款''';
     dbms_output.put_line('添加F_YYFS_TYCK(同业存款)成功！');
   end if;
 commit;
end;
/
