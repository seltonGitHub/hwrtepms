#程序初始化可执行下面所有的sql语句
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 1,'性别',1,'男' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 2,'性别',2,'女');
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 3,'是否在职',1,'是' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 4,'是否在职',2,'否' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 5,'所属单位',1,'北京' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 6,'所属单位',2,'上海' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 7,'所属单位',3,'深圳' );


insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 14,'审核状态',1,'审核中' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 15,'审核状态',2,'审核不通过' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 16,'审核状态',3,'审核通过' );

insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 17,'图纸类别',1,'国内图书' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 18,'图纸类别',2,'国外图书' );

insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 19,'职位',1,'总经理' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 20,'职位',2,'部门经理' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 21,'职位',3,'员工' );

insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 51,'北京',1,'北京昌平电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 52,'北京',2,'北京海淀电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 53,'北京',3,'北京西城电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 54,'上海',1,'上海浦东电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 55,'上海',2,'上海闸北电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 56,'上海',3,'上海徐汇电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 57,'深圳',1,'深圳福田电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 58,'深圳',2,'深圳龙岗电力公司' );
insert Elec_SystemDDL(SeqID,Keyword,DdlCode,DdlName) values( 59,'深圳',3,'深圳南山电力公司' );

#系统权限


#初始化用户，角色，权限，登录名admin，密码admin，超级管理员权限
INSERT INTO Elec_User(userID,logonName,logonPwd,userName,jctID,sexID,isDuty,postID) VALUES('402881e43d8b1e28013d8b8ae5a10001','admin','21232F297A57A5A743894A0E4A801FC3','超级管理员','1','1','1','1');

INSERT INTO  Elec_Role(roleID,roleName) values( '1','系统管理员');
INSERT INTO  Elec_Role(roleID,roleName) values( '2','高级管理员');
INSERT INTO  Elec_Role(roleID,roleName) values( '3','中级管理员');
INSERT INTO  Elec_Role(roleID,roleName) values( '4','业务用户' );
INSERT INTO  Elec_Role(roleID,roleName) values( '5','一般用户' );
INSERT INTO  Elec_Role(roleID,roleName) values( '6','普通用户' );

#导出设置数据初始化
INSERT INTO Elec_ExportFields(belongTo,expNameList,expFieldName) VALUES('5-3','站点运行情况#设备运行情况#创建日期','stationRun#devRun#createDate');
INSERT INTO Elec_ExportFields(belongTo,expNameList,expFieldName) VALUES('5-1','所属单位#用户姓名#登录名#密码#性别#出生日期#联系地址#联系电话#电子邮箱#手机#是否在职#入职时间#离职时间#职位#备注','jctID#userName#logonName#logonPwd#sexID#birthday#address#contactTel#email#mobile#isDuty#onDutyDate#offDutyDate#postID#remark');
  


###############################################################################################################################################

#左侧菜单
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'aa','0','技术设施维护管理','','../images/MenuIcon/jishusheshiweihuguanli.gif','',TRUE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ab','aa','仪器设备管理','','../images/MenuIcon/yiqishebeiguanli.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ac','aa','设备校准检修','','../images/MenuIcon/shebeijiaozhunjianxiu.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ad','aa','设备购置计划','','../images/MenuIcon/shebeigouzhijihua.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ae','0','技术资料图纸管理','','../images/MenuIcon/jishuziliaotuzhiguanli.gif','',TRUE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'af','ae','资料图纸管理','','../images/MenuIcon/ziliaotuzhiguanli.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ag','0','站点设备运行管理','','../images/MenuIcon/zhuandianshebeiyunxingguanli.gif','',TRUE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ah','ag','站点基本信息','','../images/MenuIcon/zhandianjibenxinxi.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ai','ag','运行情况','','../images/MenuIcon/yunxingqingkuang.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'aj','ag','维护情况','','../images/MenuIcon/weihuqingkuang.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ak','0','监测台建筑管理','','../images/MenuIcon/jiancetaijianzhuguanli.gif','',TRUE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'al','ak','监测台建筑管理','','../images/MenuIcon/jiancetaijianzhu.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'am','0','系统管理','','../images/MenuIcon/xitongguanli.gif','',TRUE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'an','am','用户管理','../system/ElecUserAction_home.do','../images/MenuIcon/yonghuguanli.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ao','am','角色管理','../system/ElecRoleAction_home.do','../images/MenuIcon/jueseguanli.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ap','am','运行监控','../system/ElecCommonMsgAction_home.do','../images/MenuIcon/daibanshiyi.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'aq','am','数据字典维护','../system/ElecSystemDDLAction_home.do','../images/MenuIcon/shujuzidianguanli.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ar','0','审批流转','','../images/MenuIcon/shenpiliuzhuanguanli.gif','',TRUE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'as','ar','审批流程管理','../workflow/ElecProcessDefinitionAction_home.do','../images/MenuIcon/shenpiliuchengguanli.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'at','ar','申请模板管理','../workflow/ElecApplicationTemplateAction_home.do','../images/MenuIcon/shenqingmobanguanli.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'au','ar','起草申请','../workflow/ElecApplicationFlowAction_home.do','../images/MenuIcon/qicaoshenqing.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'av','ar','待我审批','../workflow/ElecApplicationFlowAction_myTaskHome.do','../images/MenuIcon/daiwoshenpi.gif','mainFrame',FALSE,TRUE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'aw','ar','我的申请查询','../workflow/ElecApplicationFlowAction_myApplicationHome.do','../images/MenuIcon/wodeshenqingchaxun.gif','mainFrame',FALSE,TRUE );




#系统登录
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ba','0','系统登录','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bb','ba','首页显示','/system/ElecMenuAction_menuHome.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bc','ba','标题','/system/ElecMenuAction_title.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bd','ba','菜单','/system/ElecMenuAction_left.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'be','ba','加载左侧树型结构','/system/ElecMenuAction_showMenu.do','','',FALSE,FALSE );

INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bf','ba','改变框架','../system/ElecMenuAction_change.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bg','ba','加载主显示页面','../system/ElecMenuAction_loading.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bh','ba','站点运行','../system/ElecMenuAction_alermStation.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bi','ba','设备运行','../system/ElecMenuAction_alermDevice.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'bj','ba','重新登录','../system/ElecMenuAction_logout.do','','',FALSE,FALSE );


#运行监控
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ca','0','运行监控','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'cb','ca','保存','/system/ElecCommonMsgAction_save.do','','',FALSE,FALSE );

INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'cc','ca','ajax进度条','/system/ElecCommonMsgAction_progressBar.do','','',FALSE,FALSE );


#导出设置
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'da','0','导出设置','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'db','da','导出设置设置','/system/ElecExportFieldsAction_setExportExcel.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'dc','da','导出设置保存','/system/ElecExportFieldsAction_saveSetExportExcel.do','','',FALSE,FALSE );

#数据字典
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ea','0','数据字典','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'eb','ea','编辑','/system/ElecSystemDDLAction_edit.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ec','ea','保存','/system/ElecSystemDDLAction_save.do','','',FALSE,FALSE );


#用户管理
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fa','0','用户管理','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fb','fa','新增','/system/ElecUserAction_add.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fc','fa','保存','/system/ElecUserAction_save.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fd','fa','编辑','/system/ElecUserAction_edit.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fe','fa','删除','/system/ElecUserAction_delete.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ff','fa','验证登录名','/system/ElecUserAction_checkUser.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fg','fa','导出excel','/system/ElecUserAction_exportExcel.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fh','fa','excel导入页面','/system/ElecUserAction_importPage.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fi','fa','excel导入','/system/ElecUserAction_importData.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fj','fa','人员统计(单位)','/system/ElecUserAction_chartUser.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fk','fa','人员统计(性别)','/system/ElecUserAction_chartUserFCF.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'fl','fa','联动查询单位名称','/system/ElecUserAction_findJctUnit.do','','',FALSE,FALSE );



#角色管理
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ga','0','角色管理','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'gb','ga','编辑','/system/ElecRoleAction_edit.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'gc','ga','保存','/system/ElecRoleAction_save.do','','',FALSE,FALSE );


#申请流程管理
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ha','0','申请流程管理','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'hb','ha','部署流程定义','/workflow/ElecProcessDefinitionAction_add.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'hc','ha','保存','/workflow/ElecProcessDefinitionAction_save.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'hd','ha','查看流程图','/workflow/ElecProcessDefinitionAction_downloadProcessImage.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'he','ha','删除流程定义','/workflow/ElecProcessDefinitionAction_delete.do','','',FALSE,FALSE );


#申请模板管理
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ia','0','申请模板管理','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ib','ia','新增','/workflow/ElecApplicationTemplateAction_add.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ic','ia','新增保存','/workflow/ElecApplicationTemplateAction_save.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'id','ia','编辑','/workflow/ElecApplicationTemplateAction_edit.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ie','ia','编辑保存','/workflow/ElecApplicationTemplateAction_update.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'if','ia','删除','/workflow/ElecApplicationTemplateAction_delete.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ig','ia','下载','/workflow/ElecApplicationTemplateAction_download.do','','',FALSE,FALSE );


#起草申请、待我审批、我的申请查询
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ja','0','申请流程管理','','','',TRUE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jb','ja','提交申请页面','/workflow/ElecApplicationFlowAction_submitApplication.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jc','ja','提交申请','/workflow/ElecApplicationFlowAction_saveApplication.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jd','ja','我的申请查询首页','/workflow/ElecApplicationFlowAction_myApplicationHome.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'je','ja','待我审批首页','/workflow/ElecApplicationFlowAction_myTaskHome.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jf','ja','跳转审批处理页面','/workflow/ElecApplicationFlowAction_flowApprove.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jg','ja','下载','/workflow/ElecApplicationFlowAction_download.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jh','ja','审核','/workflow/ElecApplicationFlowAction_approve.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'ji','ja','审核历史','/workflow/ElecApplicationFlowAction_approvedHistory.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jj','ja','查看流程图','/workflow/ElecApplicationFlowAction_approvedHistoryPic.do','','',FALSE,FALSE );
INSERT Elec_Popedom(MID,pid,NAME,url,icon,target,isParent,ismenu) VALUES( 'jk','ja','查看流程执行位置图片','/workflow/ElecApplicationFlowAction_processImage.do','','',FALSE,FALSE );








