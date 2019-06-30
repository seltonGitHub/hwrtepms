/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : elecsystem

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2019-06-30 22:33:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for elec_antenna
-- ----------------------------
DROP TABLE IF EXISTS `elec_antenna`;
CREATE TABLE `elec_antenna` (
  `AntennaID` varchar(50) NOT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `AntennaName` varchar(50) DEFAULT NULL,
  `TxZengyi` varchar(50) DEFAULT NULL,
  `SPBSWidth` varchar(50) DEFAULT NULL,
  `JiHuaFangShi` varchar(50) DEFAULT NULL,
  `TxChengshi` varchar(50) DEFAULT NULL,
  `WorkHZ` varchar(50) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_antenna
-- ----------------------------

-- ----------------------------
-- Table structure for elec_application
-- ----------------------------
DROP TABLE IF EXISTS `elec_application`;
CREATE TABLE `elec_application` (
  `applicationID` int(11) NOT NULL,
  `applicationTemplateID` int(11) DEFAULT NULL,
  `applicationUserID` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `path` varchar(5000) DEFAULT NULL,
  `applyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT NULL,
  `processInstanceID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`applicationID`) USING BTREE,
  KEY `applicationTemplateID` (`applicationTemplateID`) USING BTREE,
  KEY `applicationUserID` (`applicationUserID`) USING BTREE,
  CONSTRAINT `elec_application_ibfk_1` FOREIGN KEY (`applicationTemplateID`) REFERENCES `elec_application_template` (`id`),
  CONSTRAINT `elec_application_ibfk_2` FOREIGN KEY (`applicationUserID`) REFERENCES `elec_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_application
-- ----------------------------

-- ----------------------------
-- Table structure for elec_application_template
-- ----------------------------
DROP TABLE IF EXISTS `elec_application_template`;
CREATE TABLE `elec_application_template` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `processDefinitionKey` varchar(500) DEFAULT NULL,
  `path` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_application_template
-- ----------------------------

-- ----------------------------
-- Table structure for elec_approveinfo
-- ----------------------------
DROP TABLE IF EXISTS `elec_approveinfo`;
CREATE TABLE `elec_approveinfo` (
  `approveID` int(11) NOT NULL,
  `applicationID` int(11) DEFAULT NULL,
  `comment` varchar(5000) DEFAULT NULL,
  `approval` tinyint(1) DEFAULT NULL,
  `approveUserID` varchar(50) DEFAULT NULL,
  `approveTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`approveID`) USING BTREE,
  KEY `applicationID` (`applicationID`) USING BTREE,
  KEY `approveUserID` (`approveUserID`) USING BTREE,
  CONSTRAINT `elec_approveinfo_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `elec_application` (`applicationID`),
  CONSTRAINT `elec_approveinfo_ibfk_2` FOREIGN KEY (`approveUserID`) REFERENCES `elec_user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_approveinfo
-- ----------------------------

-- ----------------------------
-- Table structure for elec_commonmsg
-- ----------------------------
DROP TABLE IF EXISTS `elec_commonmsg`;
CREATE TABLE `elec_commonmsg` (
  `comID` varchar(50) NOT NULL,
  `stationRun` varchar(5000) DEFAULT NULL,
  `devRun` varchar(5000) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `createEmpCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_commonmsg
-- ----------------------------

-- ----------------------------
-- Table structure for elec_device
-- ----------------------------
DROP TABLE IF EXISTS `elec_device`;
CREATE TABLE `elec_device` (
  `DevID` varchar(50) NOT NULL,
  `DevPlanID` varchar(50) DEFAULT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `DevName` varchar(50) DEFAULT NULL,
  `DevType` varchar(10) DEFAULT NULL,
  `Trademark` varchar(50) DEFAULT NULL,
  `SpecType` varchar(50) DEFAULT NULL,
  `ProduceHome` varchar(50) DEFAULT NULL,
  `ProduceArea` varchar(50) DEFAULT NULL,
  `Useness` varchar(50) DEFAULT NULL,
  `Quality` varchar(10) DEFAULT NULL,
  `UseUnit` varchar(50) DEFAULT NULL,
  `DevExpense` decimal(20,2) DEFAULT NULL,
  `AdjustPeriod` varchar(50) DEFAULT NULL,
  `OverhaulPeriod` varchar(50) DEFAULT NULL,
  `Configure` varchar(100) DEFAULT NULL,
  `DevState` varchar(10) DEFAULT NULL,
  `RunDescribe` varchar(500) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `UseDate` datetime DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `QUnit` varchar(10) DEFAULT NULL,
  `APUnit` varchar(10) DEFAULT NULL,
  `OPUnit` varchar(10) DEFAULT NULL,
  `APState` varchar(10) DEFAULT NULL,
  `OPState` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_device
-- ----------------------------

-- ----------------------------
-- Table structure for elec_device_plan
-- ----------------------------
DROP TABLE IF EXISTS `elec_device_plan`;
CREATE TABLE `elec_device_plan` (
  `DevPlanID` int(50) NOT NULL AUTO_INCREMENT,
  `JctID` varchar(50) DEFAULT NULL,
  `DevName` varchar(100) DEFAULT NULL,
  `DevType` varchar(10) DEFAULT NULL,
  `Trademark` varchar(50) DEFAULT NULL,
  `SpecType` varchar(50) DEFAULT NULL,
  `ProduceHome` varchar(50) DEFAULT NULL,
  `ProduceArea` varchar(50) DEFAULT NULL,
  `Useness` varchar(50) DEFAULT NULL,
  `Quality` varchar(10) DEFAULT NULL,
  `UseUnit` varchar(50) DEFAULT NULL,
  `DevExpense` decimal(20,2) DEFAULT NULL,
  `PlanDate` datetime DEFAULT NULL,
  `AdjustPeriod` varchar(50) DEFAULT NULL,
  `OverhaulPeriod` varchar(50) DEFAULT NULL,
  `Configure` varchar(50) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `PurchaseState` varchar(10) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `QUnit` varchar(10) DEFAULT NULL,
  `APUnit` varchar(10) DEFAULT NULL,
  `OPUnit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DevPlanID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_device_plan
-- ----------------------------
INSERT INTO `elec_device_plan` VALUES ('1', '上海', '采煤机', '120', '三菱', 'xxx-xx', null, null, '采煤', '3', '开掘', '2000000.00', '2019-05-01 22:47:21', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `elec_device_plan` VALUES ('2', '广州', '风机', '110', '重汽', 'xxx-xx', null, null, '通风', '3', '开掘', '2000000.00', '2019-05-08 22:47:21', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `elec_device_plan` VALUES ('3', '深圳', '绞车', '120', '中船', 'xxx-xx', null, null, '运输', '3', '开掘', '2000000.00', '2019-05-31 22:47:21', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `elec_device_plan` VALUES ('4', '成都', '破碎机', '120', '北方', 'xxx-xx', null, null, '破碎', '3', '开掘', '2000000.00', '2019-06-30 22:47:21', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `elec_device_plan` VALUES ('5', '北京', '掘进机', '110', '三一', 'xxx-xx', null, null, '掘进', '3', '开掘', '2000000.00', '2019-07-31 22:47:21', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for elec_engineering
-- ----------------------------
DROP TABLE IF EXISTS `elec_engineering`;
CREATE TABLE `elec_engineering` (
  `EngineID` varchar(50) NOT NULL,
  `ProjID` varchar(50) DEFAULT NULL,
  `EngineName` varchar(100) DEFAULT NULL,
  `EngineState` varchar(10) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_engineering
-- ----------------------------

-- ----------------------------
-- Table structure for elec_engineering_plan
-- ----------------------------
DROP TABLE IF EXISTS `elec_engineering_plan`;
CREATE TABLE `elec_engineering_plan` (
  `EnginePlanID` varchar(50) NOT NULL,
  `ProjPlanID` varchar(50) DEFAULT NULL,
  `EngineName` varchar(100) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_engineering_plan
-- ----------------------------

-- ----------------------------
-- Table structure for elec_engineering_plan_history
-- ----------------------------
DROP TABLE IF EXISTS `elec_engineering_plan_history`;
CREATE TABLE `elec_engineering_plan_history` (
  `SepId` varchar(50) NOT NULL,
  `EnginePlanID` varchar(50) DEFAULT NULL,
  `ProjPlanID` varchar(50) DEFAULT NULL,
  `EngineName` varchar(100) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `DeclareYear` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_engineering_plan_history
-- ----------------------------

-- ----------------------------
-- Table structure for elec_exportfields
-- ----------------------------
DROP TABLE IF EXISTS `elec_exportfields`;
CREATE TABLE `elec_exportfields` (
  `belongTo` varchar(10) NOT NULL,
  `expNameList` varchar(5000) DEFAULT NULL,
  `expFieldName` varchar(5000) DEFAULT NULL,
  `noExpNameList` varchar(5000) DEFAULT NULL,
  `noExpFieldName` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`belongTo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_exportfields
-- ----------------------------
INSERT INTO `elec_exportfields` VALUES ('4', '所属单位#设备名称#计划时间', 'JctID#DevName#PlanDate', '设备类型#品牌#型号#用途#数量#单位#金额', 'DevType#Trademark#SpecType#Useness#Quality#UseUnit#DevExpense');
INSERT INTO `elec_exportfields` VALUES ('5-1', '所属单位#用户姓名#登录名#密码#性别#出生日期#联系地址#联系电话#电子邮箱#手机#是否在职#入职时间#离职时间#职位#备注', 'jctID#userName#logonName#logonPwd#sexID#birthday#address#contactTel#email#mobile#isDuty#onDutyDate#offDutyDate#postID#remark', null, null);
INSERT INTO `elec_exportfields` VALUES ('5-3', '站点运行情况#设备运行情况#创建日期', 'stationRun#devRun#createDate', null, null);

-- ----------------------------
-- Table structure for elec_fileupload
-- ----------------------------
DROP TABLE IF EXISTS `elec_fileupload`;
CREATE TABLE `elec_fileupload` (
  `SeqID` int(11) NOT NULL,
  `ProjID` varchar(50) DEFAULT NULL,
  `BelongTo` varchar(50) DEFAULT NULL,
  `FileName` varchar(50) DEFAULT NULL,
  `FileURL` varchar(1000) DEFAULT NULL,
  `ProgressTime` varchar(20) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`SeqID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_fileupload
-- ----------------------------

-- ----------------------------
-- Table structure for elec_jctbuild
-- ----------------------------
DROP TABLE IF EXISTS `elec_jctbuild`;
CREATE TABLE `elec_jctbuild` (
  `BuildID` varchar(50) NOT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `BuildName` varchar(50) DEFAULT NULL,
  `BuildType` varchar(10) DEFAULT NULL,
  `BuildStartDate` datetime DEFAULT NULL,
  `DxDate` datetime DEFAULT NULL,
  `UseDate` datetime DEFAULT NULL,
  `BuildLayer` varchar(50) DEFAULT NULL,
  `BuildArea` varchar(50) DEFAULT NULL,
  `ExtendBuildDate` datetime DEFAULT NULL,
  `ExtendBuildArea` varchar(50) DEFAULT NULL,
  `BuildExpense` decimal(20,2) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_jctbuild
-- ----------------------------

-- ----------------------------
-- Table structure for elec_log
-- ----------------------------
DROP TABLE IF EXISTS `elec_log`;
CREATE TABLE `elec_log` (
  `logID` varchar(50) NOT NULL,
  `ipAddress` varchar(50) DEFAULT NULL,
  `opeName` varchar(50) DEFAULT NULL,
  `opeTime` datetime DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`logID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_log
-- ----------------------------

-- ----------------------------
-- Table structure for elec_maintainplan
-- ----------------------------
DROP TABLE IF EXISTS `elec_maintainplan`;
CREATE TABLE `elec_maintainplan` (
  `PlanID` varchar(50) NOT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `OccurDate` datetime DEFAULT NULL,
  `MainContent` varchar(500) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_maintainplan
-- ----------------------------

-- ----------------------------
-- Table structure for elec_overhaul_record
-- ----------------------------
DROP TABLE IF EXISTS `elec_overhaul_record`;
CREATE TABLE `elec_overhaul_record` (
  `DevID` varchar(50) DEFAULT NULL,
  `IsAdjust` varchar(10) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `IsHaving` varchar(10) DEFAULT NULL,
  `Record` varchar(500) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `SeqID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_overhaul_record
-- ----------------------------

-- ----------------------------
-- Table structure for elec_popedom
-- ----------------------------
DROP TABLE IF EXISTS `elec_popedom`;
CREATE TABLE `elec_popedom` (
  `MID` varchar(32) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `url` varchar(5000) DEFAULT NULL,
  `icon` varchar(5000) DEFAULT NULL,
  `target` varchar(500) DEFAULT NULL,
  `isParent` tinyint(1) DEFAULT NULL,
  `isMenu` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MID`,`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_popedom
-- ----------------------------
INSERT INTO `elec_popedom` VALUES ('aa', '0', '技术设施维护管理', '', '../images/MenuIcon/jishusheshiweihuguanli.gif', '', '1', '1');
INSERT INTO `elec_popedom` VALUES ('ab', 'aa', '仪器设备管理', '', '../images/MenuIcon/yiqishebeiguanli.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ac', 'aa', '设备校准检修', '', '../images/MenuIcon/shebeijiaozhunjianxiu.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ad', 'aa', '设备购置计划', '/menu/planIndex.html', '../images/MenuIcon/shebeigouzhijihua.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ae', '0', '技术资料图纸管理', '', '../images/MenuIcon/jishuziliaotuzhiguanli.gif', '', '1', '1');
INSERT INTO `elec_popedom` VALUES ('ae1', 'ae', '添加', null, null, null, '0', '0');
INSERT INTO `elec_popedom` VALUES ('ae2', 'ae', '查询', null, null, null, '0', '0');
INSERT INTO `elec_popedom` VALUES ('af', 'ae', '资料图纸管理', '/menu/dataChartIndex.html', '../images/MenuIcon/ziliaotuzhiguanli.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ag', '0', '站点设备运行管理', '', '../images/MenuIcon/zhuandianshebeiyunxingguanli.gif', '', '1', '1');
INSERT INTO `elec_popedom` VALUES ('ah', 'ag', '站点基本信息', '', '../images/MenuIcon/zhandianjibenxinxi.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ai', 'ag', '运行情况', '', '../images/MenuIcon/yunxingqingkuang.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('aj', 'ag', '维护情况', '', '../images/MenuIcon/weihuqingkuang.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ak', '0', '监测台建筑管理', '', '../images/MenuIcon/jiancetaijianzhuguanli.gif', '', '1', '1');
INSERT INTO `elec_popedom` VALUES ('al', 'ak', '监测台建筑管理', '', '../images/MenuIcon/jiancetaijianzhu.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('am', '0', '系统管理', '', '../images/MenuIcon/xitongguanli.gif', '', '1', '1');
INSERT INTO `elec_popedom` VALUES ('an', 'am', '用户管理', '../system/elecUserAction_home.do', '../images/MenuIcon/yonghuguanli.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ao', 'am', '角色管理', '/menu/roleIndex.html', '../images/MenuIcon/jueseguanli.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ap', 'am', '运行监控', '../system/elecCommonMsgAction_home.do', '../images/MenuIcon/daibanshiyi.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('aq', 'am', '数据字典维护', '/menu/dictionaryIndex.html', '../images/MenuIcon/shujuzidianguanli.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ar', '0', '审批流转', '', '../images/MenuIcon/shenpiliuzhuanguanli.gif', '', '1', '1');
INSERT INTO `elec_popedom` VALUES ('as', 'ar', '审批流程管理', '../workflow/elecProcessDefinitionAction_home.do', '../images/MenuIcon/shenpiliuchengguanli.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('at', 'ar', '申请模板管理', '../workflow/elecApplicationTemplateAction_home.do', '../images/MenuIcon/shenqingmobanguanli.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('au', 'ar', '起草申请', '../workflow/elecApplicationFlowAction_home.do', '../images/MenuIcon/qicaoshenqing.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('av', 'ar', '待我审批', '../workflow/elecApplicationFlowAction_myTaskHome.do', '../images/MenuIcon/daiwoshenpi.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('aw', 'ar', '我的申请查询', '../workflow/elecApplicationFlowAction_myApplicationHome.do', '../images/MenuIcon/wodeshenqingchaxun.gif', 'mainFrame', '0', '1');
INSERT INTO `elec_popedom` VALUES ('ba', '0', '系统登录', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('bb', 'ba', '首页显示', '/system/elecMenuAction_menuHome.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('bc', 'ba', '标题', '/system/elecMenuAction_title.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('bd', 'ba', '菜单', '/system/elecMenuAction_left.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('be', 'ba', '加载左侧树型结构', '/system/elecMenuAction_showMenu.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('bf', 'ba', '改变框架', '../system/elecMenuAction_change.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('bg', 'ba', '加载主显示页面', '../system/elecMenuAction_loading.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('bh', 'ba', '站点运行', '../system/elecMenuAction_alermStation.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('bi', 'ba', '设备运行', '../system/elecMenuAction_alermDevice.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('bj', 'ba', '重新登录', '../system/elecMenuAction_logout.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ca', '0', '运行监控', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('cb', 'ca', '保存', '/system/elecCommonMsgAction_save.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('cc', 'ca', 'ajax进度条', '/system/elecCommonMsgAction_progressBar.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('da', '0', '导出设置', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('db', 'da', '导出设置设置', '/system/elecExportFieldsAction_setExportExcel.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('dc', 'da', '导出设置保存', '/system/elecExportFieldsAction_saveSetExportExcel.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ea', '0', '数据字典', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('eb', 'ea', '编辑', '/system/elecSystemDDLAction_edit.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ec', 'ea', '保存', '/system/elecSystemDDLAction_save.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fa', '0', '用户管理', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('fb', 'fa', '新增', '/system/elecUserAction_add.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fc', 'fa', '保存', '/system/elecUserAction_save.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fd', 'fa', '编辑', '/system/elecUserAction_edit.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fe', 'fa', '删除', '/system/elecUserAction_delete.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ff', 'fa', '验证登录名', '/system/elecUserAction_checkUser.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fg', 'fa', '导出excel', '/system/elecUserAction_exportExcel.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fh', 'fa', 'excel导入页面', '/system/elecUserAction_importPage.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fi', 'fa', 'excel导入', '/system/elecUserAction_importData.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fj', 'fa', '人员统计(单位)', '/system/elecUserAction_chartUser.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fk', 'fa', '人员统计(性别)', '/system/elecUserAction_chartUserFCF.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('fl', 'fa', '联动查询单位名称', '/system/elecUserAction_findJctUnit.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ga', '0', '角色管理', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('gb', 'ga', '编辑', '/system/elecRoleAction_edit.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('gc', 'ga', '保存', '/system/elecRoleAction_save.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ha', '0', '申请流程管理', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('hb', 'ha', '部署流程定义', '/workflow/elecProcessDefinitionAction_add.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('hc', 'ha', '保存', '/workflow/elecProcessDefinitionAction_save.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('hd', 'ha', '查看流程图', '/workflow/elecProcessDefinitionAction_downloadProcessImage.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('he', 'ha', '删除流程定义', '/workflow/elecProcessDefinitionAction_delete.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ia', '0', '申请模板管理', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('ib', 'ia', '新增', '/workflow/elecApplicationTemplateAction_add.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ic', 'ia', '新增保存', '/workflow/elecApplicationTemplateAction_save.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('id', 'ia', '编辑', '/workflow/elecApplicationTemplateAction_edit.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ie', 'ia', '编辑保存', '/workflow/elecApplicationTemplateAction_update.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('if', 'ia', '删除', '/workflow/elecApplicationTemplateAction_delete.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ig', 'ia', '下载', '/workflow/elecApplicationTemplateAction_download.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ja', '0', '申请流程管理', '', '', '', '1', '0');
INSERT INTO `elec_popedom` VALUES ('jb', 'ja', '提交申请页面', '/workflow/elecApplicationFlowAction_submitApplication.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('jc', 'ja', '提交申请', '/workflow/elecApplicationFlowAction_saveApplication.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('jd', 'ja', '我的申请查询首页', '/workflow/elecApplicationFlowAction_myApplicationHome.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('je', 'ja', '待我审批首页', '/workflow/elecApplicationFlowAction_myTaskHome.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('jf', 'ja', '跳转审批处理页面', '/workflow/elecApplicationFlowAction_flowApprove.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('jg', 'ja', '下载', '/workflow/elecApplicationFlowAction_download.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('jh', 'ja', '审核', '/workflow/elecApplicationFlowAction_approve.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('ji', 'ja', '审核历史', '/workflow/elecApplicationFlowAction_approvedHistory.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('jj', 'ja', '查看流程图', '/workflow/elecApplicationFlowAction_approvedHistoryPic.do', '', '', '0', '0');
INSERT INTO `elec_popedom` VALUES ('jk', 'ja', '查看流程执行位置图片', '/workflow/elecApplicationFlowAction_processImage.do', '', '', '0', '0');

-- ----------------------------
-- Table structure for elec_project
-- ----------------------------
DROP TABLE IF EXISTS `elec_project`;
CREATE TABLE `elec_project` (
  `ProjID` varchar(50) NOT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `LayProjID` varchar(50) DEFAULT NULL,
  `ProjName` varchar(100) DEFAULT NULL,
  `ProjState` varchar(10) DEFAULT NULL,
  `ProjType` varchar(50) DEFAULT NULL,
  `PlanInvest` decimal(20,2) DEFAULT NULL,
  `MainContent` varchar(100) DEFAULT NULL,
  `BuildDate` datetime DEFAULT NULL,
  `IsYanShou` varchar(10) DEFAULT NULL,
  `Cycle` varchar(50) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `YanShouDate` datetime DEFAULT NULL,
  `ProjSize` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_project
-- ----------------------------

-- ----------------------------
-- Table structure for elec_project_declare
-- ----------------------------
DROP TABLE IF EXISTS `elec_project_declare`;
CREATE TABLE `elec_project_declare` (
  `SeqID` int(11) NOT NULL,
  `ProjPlanID` varchar(50) DEFAULT NULL,
  `DeclareYear` varchar(10) DEFAULT NULL,
  `DeclareState` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_project_declare
-- ----------------------------

-- ----------------------------
-- Table structure for elec_project_layout
-- ----------------------------
DROP TABLE IF EXISTS `elec_project_layout`;
CREATE TABLE `elec_project_layout` (
  `LayProjID` varchar(50) NOT NULL,
  `ProjName` varchar(100) DEFAULT NULL,
  `SeqID` int(11) DEFAULT NULL,
  `ProjGrade` int(11) DEFAULT NULL,
  `ParentProjID` varchar(50) DEFAULT NULL,
  `Property` varchar(10) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Adress` varchar(50) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `PlanStartTime` datetime DEFAULT NULL,
  `PlanInvest` decimal(20,2) DEFAULT NULL,
  `MainContent` varchar(500) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `VarSeqId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_project_layout
-- ----------------------------

-- ----------------------------
-- Table structure for elec_project_plan
-- ----------------------------
DROP TABLE IF EXISTS `elec_project_plan`;
CREATE TABLE `elec_project_plan` (
  `ProjPlanID` varchar(50) NOT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `LayProjID` varchar(50) DEFAULT NULL,
  `ProjName` varchar(100) DEFAULT NULL,
  `ProjState` varchar(10) DEFAULT NULL,
  `ProjType` varchar(10) DEFAULT NULL,
  `DeclareDate` datetime DEFAULT NULL,
  `PlanInvest` decimal(20,2) DEFAULT NULL,
  `KeYan` varchar(10) DEFAULT NULL,
  `ChuShe` varchar(10) DEFAULT NULL,
  `KeYanInvest` decimal(20,2) DEFAULT NULL,
  `ChuSheInvest` decimal(20,2) DEFAULT NULL,
  `IsDeclare` varchar(10) DEFAULT NULL,
  `IsApprove` varchar(10) DEFAULT NULL,
  `Gist` varchar(100) DEFAULT NULL,
  `MainContent` varchar(500) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `ProjSize` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_project_plan
-- ----------------------------

-- ----------------------------
-- Table structure for elec_role
-- ----------------------------
DROP TABLE IF EXISTS `elec_role`;
CREATE TABLE `elec_role` (
  `roleID` varchar(32) NOT NULL,
  `roleName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_role
-- ----------------------------
INSERT INTO `elec_role` VALUES ('1', '系统管理员');
INSERT INTO `elec_role` VALUES ('2', '高级管理员');
INSERT INTO `elec_role` VALUES ('3', '中级管理员');
INSERT INTO `elec_role` VALUES ('4', '业务用户');
INSERT INTO `elec_role` VALUES ('5', '一般用户');
INSERT INTO `elec_role` VALUES ('6', '普通用户');

-- ----------------------------
-- Table structure for elec_role_popedom
-- ----------------------------
DROP TABLE IF EXISTS `elec_role_popedom`;
CREATE TABLE `elec_role_popedom` (
  `roleID` varchar(32) NOT NULL,
  `mid` varchar(32) NOT NULL,
  PRIMARY KEY (`roleID`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_role_popedom
-- ----------------------------
INSERT INTO `elec_role_popedom` VALUES ('1', 'aa');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ab');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ac');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ad');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ae');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ae1');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ae2');
INSERT INTO `elec_role_popedom` VALUES ('1', 'af');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ag');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ah');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ai');
INSERT INTO `elec_role_popedom` VALUES ('1', 'aj');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ak');
INSERT INTO `elec_role_popedom` VALUES ('1', 'al');
INSERT INTO `elec_role_popedom` VALUES ('1', 'am');
INSERT INTO `elec_role_popedom` VALUES ('1', 'an');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ao');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ap');
INSERT INTO `elec_role_popedom` VALUES ('1', 'aq');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ar');
INSERT INTO `elec_role_popedom` VALUES ('1', 'as');
INSERT INTO `elec_role_popedom` VALUES ('1', 'at');
INSERT INTO `elec_role_popedom` VALUES ('1', 'au');
INSERT INTO `elec_role_popedom` VALUES ('1', 'av');
INSERT INTO `elec_role_popedom` VALUES ('1', 'aw');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ba');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bb');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bc');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bd');
INSERT INTO `elec_role_popedom` VALUES ('1', 'be');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bf');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bg');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bh');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bi');
INSERT INTO `elec_role_popedom` VALUES ('1', 'bj');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ca');
INSERT INTO `elec_role_popedom` VALUES ('1', 'cb');
INSERT INTO `elec_role_popedom` VALUES ('1', 'cc');
INSERT INTO `elec_role_popedom` VALUES ('1', 'da');
INSERT INTO `elec_role_popedom` VALUES ('1', 'db');
INSERT INTO `elec_role_popedom` VALUES ('1', 'dc');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ea');
INSERT INTO `elec_role_popedom` VALUES ('1', 'eb');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ec');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fa');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fb');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fc');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fd');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fe');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ff');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fg');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fh');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fi');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fj');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fk');
INSERT INTO `elec_role_popedom` VALUES ('1', 'fl');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ga');
INSERT INTO `elec_role_popedom` VALUES ('1', 'gb');
INSERT INTO `elec_role_popedom` VALUES ('1', 'gc');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ha');
INSERT INTO `elec_role_popedom` VALUES ('1', 'hb');
INSERT INTO `elec_role_popedom` VALUES ('1', 'hc');
INSERT INTO `elec_role_popedom` VALUES ('1', 'hd');
INSERT INTO `elec_role_popedom` VALUES ('1', 'he');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ia');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ib');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ic');
INSERT INTO `elec_role_popedom` VALUES ('1', 'id');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ie');
INSERT INTO `elec_role_popedom` VALUES ('1', 'if');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ig');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ja');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jb');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jc');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jd');
INSERT INTO `elec_role_popedom` VALUES ('1', 'je');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jf');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jg');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jh');
INSERT INTO `elec_role_popedom` VALUES ('1', 'ji');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jj');
INSERT INTO `elec_role_popedom` VALUES ('1', 'jk');
INSERT INTO `elec_role_popedom` VALUES ('2', 'aa');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ab');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ad');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ae');
INSERT INTO `elec_role_popedom` VALUES ('2', 'af');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ag');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ah');
INSERT INTO `elec_role_popedom` VALUES ('2', 'aj');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ak');
INSERT INTO `elec_role_popedom` VALUES ('2', 'al');
INSERT INTO `elec_role_popedom` VALUES ('2', 'am');
INSERT INTO `elec_role_popedom` VALUES ('2', 'an');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ap');
INSERT INTO `elec_role_popedom` VALUES ('2', 'aq');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ar');
INSERT INTO `elec_role_popedom` VALUES ('2', 'as');
INSERT INTO `elec_role_popedom` VALUES ('2', 'aw');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ba');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bb');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bc');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bd');
INSERT INTO `elec_role_popedom` VALUES ('2', 'be');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bf');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bg');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bh');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bi');
INSERT INTO `elec_role_popedom` VALUES ('2', 'bj');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ca');
INSERT INTO `elec_role_popedom` VALUES ('2', 'cb');
INSERT INTO `elec_role_popedom` VALUES ('2', 'cc');
INSERT INTO `elec_role_popedom` VALUES ('2', 'da');
INSERT INTO `elec_role_popedom` VALUES ('2', 'db');
INSERT INTO `elec_role_popedom` VALUES ('2', 'dc');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ea');
INSERT INTO `elec_role_popedom` VALUES ('2', 'eb');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ec');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fa');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fb');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fc');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fd');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fe');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ff');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fg');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fh');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fi');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fj');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fk');
INSERT INTO `elec_role_popedom` VALUES ('2', 'fl');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ga');
INSERT INTO `elec_role_popedom` VALUES ('2', 'gb');
INSERT INTO `elec_role_popedom` VALUES ('2', 'gc');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ha');
INSERT INTO `elec_role_popedom` VALUES ('2', 'hb');
INSERT INTO `elec_role_popedom` VALUES ('2', 'hc');
INSERT INTO `elec_role_popedom` VALUES ('2', 'hd');
INSERT INTO `elec_role_popedom` VALUES ('2', 'he');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ia');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ib');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ic');
INSERT INTO `elec_role_popedom` VALUES ('2', 'id');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ie');
INSERT INTO `elec_role_popedom` VALUES ('2', 'if');
INSERT INTO `elec_role_popedom` VALUES ('2', 'ig');
INSERT INTO `elec_role_popedom` VALUES ('3', 'aa');
INSERT INTO `elec_role_popedom` VALUES ('3', 'ab');
INSERT INTO `elec_role_popedom` VALUES ('4', 'ag');
INSERT INTO `elec_role_popedom` VALUES ('4', 'ah');
INSERT INTO `elec_role_popedom` VALUES ('5', 'aa');
INSERT INTO `elec_role_popedom` VALUES ('5', 'ab');
INSERT INTO `elec_role_popedom` VALUES ('5', 'ac');
INSERT INTO `elec_role_popedom` VALUES ('5', 'ad');
INSERT INTO `elec_role_popedom` VALUES ('5', 'ak');
INSERT INTO `elec_role_popedom` VALUES ('5', 'al');
INSERT INTO `elec_role_popedom` VALUES ('6', 'aa');
INSERT INTO `elec_role_popedom` VALUES ('6', 'ab');
INSERT INTO `elec_role_popedom` VALUES ('6', 'ac');
INSERT INTO `elec_role_popedom` VALUES ('6', 'ad');
INSERT INTO `elec_role_popedom` VALUES ('6', 'ae');
INSERT INTO `elec_role_popedom` VALUES ('6', 'ae2');
INSERT INTO `elec_role_popedom` VALUES ('6', 'af');
INSERT INTO `elec_role_popedom` VALUES ('6', 'am');
INSERT INTO `elec_role_popedom` VALUES ('6', 'an');

-- ----------------------------
-- Table structure for elec_role_user
-- ----------------------------
DROP TABLE IF EXISTS `elec_role_user`;
CREATE TABLE `elec_role_user` (
  `roleid` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  PRIMARY KEY (`roleid`,`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_role_user
-- ----------------------------
INSERT INTO `elec_role_user` VALUES ('1', '402881e43d8b1e28013d8b8ae5a10001');
INSERT INTO `elec_role_user` VALUES ('1', '402881e43d8b1e28013d8b8ae5a10002');
INSERT INTO `elec_role_user` VALUES ('2', '402881e43d8b1e28013d8b8ae5a10001');
INSERT INTO `elec_role_user` VALUES ('2', '402881e43d8b1e28013d8b8ae5a10004');
INSERT INTO `elec_role_user` VALUES ('5', '402881e43d8b1e28013d8b8ae5a10003');
INSERT INTO `elec_role_user` VALUES ('6', '402881e43d8b1e28013d8b8ae5a10003');

-- ----------------------------
-- Table structure for elec_station
-- ----------------------------
DROP TABLE IF EXISTS `elec_station`;
CREATE TABLE `elec_station` (
  `StationID` varchar(50) NOT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `StationCode` varchar(50) DEFAULT NULL,
  `StationName` varchar(50) DEFAULT NULL,
  `JCFrequency` varchar(100) DEFAULT NULL,
  `ProduceHome` varchar(50) DEFAULT NULL,
  `ContactType` varchar(50) DEFAULT NULL,
  `UseStartDate` datetime DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `StationType` varchar(50) DEFAULT NULL,
  `AttributionGround` varchar(50) DEFAULT NULL,
  `period` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_station
-- ----------------------------

-- ----------------------------
-- Table structure for elec_stationbug
-- ----------------------------
DROP TABLE IF EXISTS `elec_stationbug`;
CREATE TABLE `elec_stationbug` (
  `BugID` int(11) NOT NULL,
  `StationID` varchar(50) DEFAULT NULL,
  `JctID` varchar(50) DEFAULT NULL,
  `SbMonth` varchar(50) DEFAULT NULL,
  `BugType` varchar(10) DEFAULT NULL,
  `OccurDate` varchar(50) DEFAULT NULL,
  `LauncherName` varchar(50) DEFAULT NULL,
  `BugDescribe` varchar(500) DEFAULT NULL,
  `ResolveDate` varchar(50) DEFAULT NULL,
  `ResolveMethod` varchar(500) DEFAULT NULL,
  `BugReason` varchar(500) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_stationbug
-- ----------------------------

-- ----------------------------
-- Table structure for elec_subengineering
-- ----------------------------
DROP TABLE IF EXISTS `elec_subengineering`;
CREATE TABLE `elec_subengineering` (
  `SubEngineID` varchar(50) NOT NULL,
  `ProjID` varchar(50) DEFAULT NULL,
  `EngineID` varchar(50) DEFAULT NULL,
  `SubEngineName` varchar(100) DEFAULT NULL,
  `SubEngineState` varchar(10) DEFAULT NULL,
  `UnitPrice` decimal(20,2) DEFAULT NULL,
  `Quality` int(11) DEFAULT NULL,
  `PlanInvest` decimal(20,2) DEFAULT NULL,
  `InvestMonth` varchar(50) DEFAULT NULL,
  `ActualInvest` decimal(20,2) DEFAULT NULL,
  `TiaoGaiInvest` decimal(20,2) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_subengineering
-- ----------------------------

-- ----------------------------
-- Table structure for elec_subengineering_plan
-- ----------------------------
DROP TABLE IF EXISTS `elec_subengineering_plan`;
CREATE TABLE `elec_subengineering_plan` (
  `SubEngineID` varchar(50) NOT NULL,
  `ProjPlanID` varchar(50) DEFAULT NULL,
  `EnginePlanID` varchar(50) DEFAULT NULL,
  `SubEngineName` varchar(100) DEFAULT NULL,
  `UnitPrice` decimal(20,2) DEFAULT NULL,
  `Quality` int(11) DEFAULT NULL,
  `PlanInvest` decimal(20,2) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_subengineering_plan
-- ----------------------------

-- ----------------------------
-- Table structure for elec_subengineering_plan_history
-- ----------------------------
DROP TABLE IF EXISTS `elec_subengineering_plan_history`;
CREATE TABLE `elec_subengineering_plan_history` (
  `SsepId` varchar(50) NOT NULL,
  `SubEngineID` varchar(50) DEFAULT NULL,
  `ProjPlanID` varchar(50) DEFAULT NULL,
  `EnginePlanID` varchar(50) DEFAULT NULL,
  `SubEngineName` varchar(100) DEFAULT NULL,
  `UnitPrice` decimal(20,2) DEFAULT NULL,
  `Quality` int(11) DEFAULT NULL,
  `PlanInvest` decimal(20,2) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `IsDelete` varchar(10) DEFAULT NULL,
  `CreateEmpID` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastEmpID` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `DeclareYear` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_subengineering_plan_history
-- ----------------------------

-- ----------------------------
-- Table structure for elec_systemddl
-- ----------------------------
DROP TABLE IF EXISTS `elec_systemddl`;
CREATE TABLE `elec_systemddl` (
  `seqID` int(10) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(20) DEFAULT NULL,
  `ddlCode` int(11) DEFAULT NULL,
  `ddlName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seqID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_systemddl
-- ----------------------------
INSERT INTO `elec_systemddl` VALUES ('1', '性别', '1', '男');
INSERT INTO `elec_systemddl` VALUES ('2', '性别', '2', '女');
INSERT INTO `elec_systemddl` VALUES ('3', '是否在职', '1', '是');
INSERT INTO `elec_systemddl` VALUES ('4', '是否在职', '2', '否');
INSERT INTO `elec_systemddl` VALUES ('5', '所属单位', '1', '北京');
INSERT INTO `elec_systemddl` VALUES ('6', '所属单位', '2', '上海');
INSERT INTO `elec_systemddl` VALUES ('7', '所属单位', '3', '深圳');
INSERT INTO `elec_systemddl` VALUES ('8', '所属单位', '4', '广州');
INSERT INTO `elec_systemddl` VALUES ('9', '所属单位', '5', '成都');
INSERT INTO `elec_systemddl` VALUES ('14', '审核状态', '1', '审核中');
INSERT INTO `elec_systemddl` VALUES ('15', '审核状态', '2', '审核不通过');
INSERT INTO `elec_systemddl` VALUES ('16', '审核状态', '3', '审核通过');
INSERT INTO `elec_systemddl` VALUES ('17', '图纸类别', '1', '国内图书');
INSERT INTO `elec_systemddl` VALUES ('18', '图纸类别', '2', '国外图书');
INSERT INTO `elec_systemddl` VALUES ('19', '职位', '1', '总经理');
INSERT INTO `elec_systemddl` VALUES ('20', '职位', '2', '部门经理');
INSERT INTO `elec_systemddl` VALUES ('21', '职位', '3', '员工');
INSERT INTO `elec_systemddl` VALUES ('54', '上海', '1', '上海浦东电力公司');
INSERT INTO `elec_systemddl` VALUES ('55', '上海', '2', '上海闸北电力公司');
INSERT INTO `elec_systemddl` VALUES ('56', '上海', '3', '上海徐汇电力公司');
INSERT INTO `elec_systemddl` VALUES ('57', '深圳', '1', '深圳福田电力公司');
INSERT INTO `elec_systemddl` VALUES ('58', '深圳', '2', '深圳龙岗电力公司');
INSERT INTO `elec_systemddl` VALUES ('59', '深圳', '3', '深圳南山电力公司');
INSERT INTO `elec_systemddl` VALUES ('60', '成都', '1', '成都电力公司');
INSERT INTO `elec_systemddl` VALUES ('71', '重庆', '1', '重庆3');
INSERT INTO `elec_systemddl` VALUES ('72', '重庆', '2', '重庆5');
INSERT INTO `elec_systemddl` VALUES ('73', '重庆', '3', '重庆4');
INSERT INTO `elec_systemddl` VALUES ('74', '设备类型', '1', '110');
INSERT INTO `elec_systemddl` VALUES ('75', '设备类型', '2', '120');
INSERT INTO `elec_systemddl` VALUES ('80', '北京', '1', '北京昌平电力公司');
INSERT INTO `elec_systemddl` VALUES ('81', '北京', '2', '北京海淀电力公司');
INSERT INTO `elec_systemddl` VALUES ('82', '北京', '3', '北京西城电力公司');

-- ----------------------------
-- Table structure for elec_text
-- ----------------------------
DROP TABLE IF EXISTS `elec_text`;
CREATE TABLE `elec_text` (
  `textID` varchar(50) NOT NULL,
  `textName` varchar(50) DEFAULT NULL,
  `textDate` datetime DEFAULT NULL,
  `textRemark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`textID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_text
-- ----------------------------

-- ----------------------------
-- Table structure for elec_user
-- ----------------------------
DROP TABLE IF EXISTS `elec_user`;
CREATE TABLE `elec_user` (
  `userID` varchar(50) NOT NULL,
  `jctID` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `logonName` varchar(50) DEFAULT NULL,
  `logonPwd` varchar(50) DEFAULT NULL,
  `sexID` varchar(50) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contactTel` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `isDuty` varchar(50) DEFAULT NULL,
  `postID` varchar(50) DEFAULT NULL,
  `onDutyDate` datetime DEFAULT NULL,
  `offDutyDate` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `isDelete` varchar(10) DEFAULT NULL,
  `createEmpID` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastEmpID` varchar(50) DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of elec_user
-- ----------------------------
INSERT INTO `elec_user` VALUES ('402881e43d8b1e28013d8b8ae5a10001', '1', '超级管理员', 'admin', '21232F297A57A5A743894A0E4A801FC3', '1', null, null, null, null, null, '1', '1', null, null, null, null, null, null, null, null);
INSERT INTO `elec_user` VALUES ('402881e43d8b1e28013d8b8ae5a10002', '2', '大黄2号', 'dahuang2', '21232F297A57A5A743894A0E4A801FC3', '1', null, null, null, null, null, '1', '1', null, null, null, null, null, null, null, null);
INSERT INTO `elec_user` VALUES ('402881e43d8b1e28013d8b8ae5a10003', '3', '大黄3号', 'dahuang3', '21232F297A57A5A743894A0E4A801FC3', '1', null, null, null, null, null, '1', '1', null, null, null, null, null, null, null, null);
INSERT INTO `elec_user` VALUES ('402881e43d8b1e28013d8b8ae5a10004', '4', '大黄4号', 'dahuang4', '21232F297A57A5A743894A0E4A801FC3', '1', null, null, null, null, null, '1', '1', null, null, null, null, null, null, null, null);
