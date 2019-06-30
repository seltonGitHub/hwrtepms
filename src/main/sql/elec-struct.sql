
CREATE TABLE Elec_Antenna(AntennaID VARCHAR(50) NOT NULL,
	JctID VARCHAR(50)  NULL,
	AntennaName VARCHAR(50)   NULL,
	TxZengyi VARCHAR(50)  NULL,
	SPBSWidth VARCHAR(50)  NULL,
	JiHuaFangShi VARCHAR(50)  NULL,
	TxChengshi VARCHAR(50)  NULL,
	WorkHZ VARCHAR(50)  NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL
);



CREATE TABLE Elec_Device(DevID VARCHAR(50)  NOT NULL,
	DevPlanID VARCHAR(50)   NULL,
	JctID VARCHAR(50)   NULL,
	DevName VARCHAR(50)   NULL,
	DevType VARCHAR(10)   NULL,
	Trademark VARCHAR(50)  NULL,
	SpecType VARCHAR(50)  NULL,
	ProduceHome VARCHAR(50)  NULL,
	ProduceArea VARCHAR(50)  NULL,
	Useness VARCHAR(50)  NULL,
	Quality VARCHAR(10)  NULL,
	UseUnit VARCHAR(50)  NULL,
	DevExpense NUMERIC(20, 2) NULL,
	AdjustPeriod VARCHAR(50)  NULL,
	OverhaulPeriod VARCHAR(50)  NULL,
	Configure VARCHAR(100)  NULL,
	DevState VARCHAR(10)  NULL,
	RunDescribe VARCHAR(500)  NULL,
	COMMENT VARCHAR(500)  NULL,
	UseDate DATETIME NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	QUnit VARCHAR(10)  NULL,
	APUnit VARCHAR(10)  NULL,
	OPUnit VARCHAR(10)  NULL,
	APState VARCHAR(10)  NULL,
	OPState VARCHAR(10)  NULL
);

CREATE TABLE Elec_Device_Plan(
	DevPlanID VARCHAR(50)  NOT NULL,
	JctID VARCHAR(50)   NULL,
	DevName VARCHAR(100)   NULL,
	DevType VARCHAR(10)   NULL,
	Trademark VARCHAR(50)  NULL,
	SpecType VARCHAR(50)  NULL,
	ProduceHome VARCHAR(50)  NULL,
	ProduceArea VARCHAR(50)  NULL,
	Useness VARCHAR(50)  NULL,
	Quality VARCHAR(10)  NULL,
	UseUnit VARCHAR(50)  NULL,
	DevExpense NUMERIC(20, 2) NULL,
	PlanDate DATETIME NULL,
	AdjustPeriod VARCHAR(50)  NULL,
	OverhaulPeriod VARCHAR(50)  NULL,
	Configure VARCHAR(50)  NULL,
	COMMENT VARCHAR(500)  NULL,
	PurchaseState VARCHAR(10)  NULL,
	IsDelete VARCHAR(10)  NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	QUnit VARCHAR(10)  NULL,
	APUnit VARCHAR(10)  NULL,
	OPUnit VARCHAR(10)  NULL
); 

CREATE TABLE Elec_Engineering(
	EngineID VARCHAR(50)  NOT NULL,
	ProjID VARCHAR(50)   NULL,
	EngineName VARCHAR(100)   NULL,
	EngineState VARCHAR(10)   NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL
); 

CREATE TABLE Elec_Engineering_Plan(
	EnginePlanID VARCHAR(50)  NOT NULL,
	ProjPlanID VARCHAR(50)   NULL,
	EngineName VARCHAR(100)   NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL
); 
CREATE TABLE Elec_Engineering_Plan_History(
	SepId VARCHAR(50)  NOT NULL,
	EnginePlanID VARCHAR(50)   NULL,
	ProjPlanID VARCHAR(50)   NULL,
	EngineName VARCHAR(100)   NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	DeclareYear VARCHAR(50)  NULL
); 


CREATE TABLE Elec_FileUpload(
    SeqID INT NOT NULL primary key,   
	ProjID VARCHAR(50)  NULL,         
	BelongTo VARCHAR(50)  NULL,     
	FileName VARCHAR(50)  NULL,      
	FileURL VARCHAR(1000)  NULL,      
	ProgressTime VARCHAR(20)  NULL, 
	IsDelete VARCHAR(10)  NULL,    
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL       
); 

CREATE TABLE Elec_JctBuild(
	BuildID VARCHAR(50)  NOT NULL,
	JctID VARCHAR(50)   NULL,
	BuildName VARCHAR(50)   NULL,
	BuildType VARCHAR(10)   NULL,
	BuildStartDate DATETIME NULL,
	DxDate DATETIME NULL,
	UseDate DATETIME NULL,
	BuildLayer VARCHAR(50)  NULL,
	BuildArea VARCHAR(50)  NULL,
	ExtendBuildDate DATETIME NULL,
	ExtendBuildArea VARCHAR(50)  NULL,
	BuildExpense NUMERIC(20, 2) NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL
 ); 
CREATE TABLE Elec_MaintainPlan(
	PlanID VARCHAR(50)  NOT NULL,
	JctID VARCHAR(50)   NULL,
	OccurDate DATETIME  NULL,
	MainContent VARCHAR(500)  NULL,
	COMMENT VARCHAR(500)  NULL
);

CREATE TABLE Elec_Overhaul_Record(
	DevID VARCHAR(50)   NULL,
	IsAdjust VARCHAR(10)   NULL,
	StartDate DATETIME  NULL,
	EndDate DATETIME  NULL,
	IsHaving VARCHAR(10)   NULL,
	Record VARCHAR(500)  NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	SeqID INT NOT NULL
); 
CREATE TABLE Elec_Project(
	ProjID VARCHAR(50)  NOT NULL,
	JctID VARCHAR(50)   NULL,
	LayProjID VARCHAR(50)   NULL,
	ProjName VARCHAR(100)   NULL,
	ProjState VARCHAR(10)   NULL,
	ProjType VARCHAR(50)   NULL,
	PlanInvest NUMERIC(20, 2) NULL,
	MainContent VARCHAR(100)  NULL,
	BuildDate DATETIME NULL,
	IsYanShou VARCHAR(10)   NULL,
	Cycle VARCHAR(50)  NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	YanShouDate DATETIME NULL,
	ProjSize VARCHAR(50)  NULL
); 

CREATE TABLE Elec_Project_Declare(
	SeqID INT NOT NULL,
	ProjPlanID VARCHAR(50)   NULL,
	DeclareYear VARCHAR(10)   NULL,
	DeclareState VARCHAR(10)   NULL
);
CREATE TABLE Elec_Project_Layout(
	LayProjID VARCHAR(50)  NOT NULL,
	ProjName VARCHAR(100)   NULL,
	SeqID INT  NULL,
	ProjGrade INT  NULL,
	ParentProjID VARCHAR(50)   NULL,
	Property VARCHAR(10)   NULL,
	Size VARCHAR(50)  NULL,
	Adress VARCHAR(50)  NULL,
	StartTime DATETIME NULL,
	EndTime DATETIME NULL,
	PlanStartTime DATETIME NULL,
	PlanInvest NUMERIC(20, 2) NULL,
	MainContent VARCHAR(500)  NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	VarSeqId VARCHAR(50)  NULL
); 

CREATE TABLE Elec_Project_Plan(
	ProjPlanID VARCHAR(50)  NOT NULL,
	JctID VARCHAR(50)   NULL,
	LayProjID VARCHAR(50)   NULL,
	ProjName VARCHAR(100)   NULL,
	ProjState VARCHAR(10)   NULL,
	ProjType VARCHAR(10)   NULL,
	DeclareDate DATETIME NULL,
	PlanInvest NUMERIC(20, 2) NULL,
	KeYan VARCHAR(10)   NULL,
	ChuShe VARCHAR(10)   NULL,
	KeYanInvest NUMERIC(20, 2) NULL,
	ChuSheInvest NUMERIC(20, 2) NULL,
	IsDeclare VARCHAR(10)   NULL,
	IsApprove VARCHAR(10)   NULL,
	Gist VARCHAR(100)  NULL,
	MainContent VARCHAR(500)  NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	ProjSize VARCHAR(50)  NULL
);

 
CREATE TABLE Elec_Station(
	StationID VARCHAR(50)  NOT NULL,
	JctID VARCHAR(50)   NULL,
	StationCode VARCHAR(50)   NULL,
	StationName VARCHAR(50)   NULL,
	JCFrequency VARCHAR(100)  NULL,
	ProduceHome VARCHAR(50)  NULL,
	ContactType VARCHAR(50)  NULL,
	UseStartDate DATETIME NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	StationType VARCHAR(50)   NULL,
	AttributionGround VARCHAR(50)  NULL,
	period VARCHAR(50)  NULL
);
CREATE TABLE Elec_StationBug(
	BugID INT  NOT NULL,
	StationID VARCHAR(50)   NULL,
	JctID VARCHAR(50)   NULL,
	SbMonth VARCHAR(50)   NULL,
	BugType VARCHAR(10)   NULL,
	OccurDate VARCHAR(50)   NULL,
	LauncherName VARCHAR(50)  NULL,
	BugDescribe VARCHAR(500)  NULL,
	ResolveDate VARCHAR(50)  NULL,
	ResolveMethod VARCHAR(500)  NULL,
	BugReason VARCHAR(500)  NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL
);
CREATE TABLE Elec_SubEngineering(
	SubEngineID VARCHAR(50)  NOT NULL,
	ProjID VARCHAR(50)   NULL,
	EngineID VARCHAR(50)   NULL,
	SubEngineName VARCHAR(100)   NULL,
	SubEngineState VARCHAR(10)   NULL,
	UnitPrice NUMERIC(20, 2) NULL,
	Quality INT NULL,
	PlanInvest NUMERIC(20, 2) NULL,
	InvestMonth VARCHAR(50)  NULL,
	ActualInvest NUMERIC(20, 2) NULL,
	TiaoGaiInvest NUMERIC(20, 2) NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL
);
CREATE TABLE Elec_SubEngineering_Plan(
	SubEngineID VARCHAR(50)  NOT NULL,
	ProjPlanID VARCHAR(50)   NULL,
	EnginePlanID VARCHAR(50)   NULL,
	SubEngineName VARCHAR(100)   NULL,
	UnitPrice NUMERIC(20, 2) NULL,
	Quality INT NULL,
	PlanInvest NUMERIC(20, 2) NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL
); 
CREATE TABLE Elec_SubEngineering_Plan_History(
	SsepId VARCHAR(50)  NOT NULL,
	SubEngineID VARCHAR(50)   NULL,
	ProjPlanID VARCHAR(50)   NULL,
	EnginePlanID VARCHAR(50)   NULL,
	SubEngineName VARCHAR(100)   NULL,
	UnitPrice NUMERIC(20, 2) NULL,
	Quality INT NULL,
	PlanInvest NUMERIC(20, 2) NULL,
	COMMENT VARCHAR(500)  NULL,
	IsDelete VARCHAR(10)   NULL,
	CreateEmpID VARCHAR(50)  NULL,
	CreateDate DATETIME NULL,
	LastEmpID VARCHAR(50)  NULL,
	LastDate DATETIME NULL,
	DeclareYear VARCHAR(50)   NULL
); 

CREATE TABLE Elec_ExportFields(
	belongTo VARCHAR(10)  NOT NULL primary key,        
	expNameList VARCHAR(5000)  NULL,         
	expFieldName VARCHAR(5000)  NULL,        
	noExpNameList VARCHAR(5000)  NULL,       
	noExpFieldName VARCHAR(5000)  NULL      
);



CREATE TABLE Elec_CommonMsg(
	comID VARCHAR(50) NOT NULL primary key,   
	stationRun VARCHAR(5000)  NULL, 
	devRun VARCHAR(5000)  NULL,    
	createDate DATETIME NULL,       
	createEmpCode VARCHAR(50)  NULL
); 


CREATE TABLE Elec_SystemDDL(
	seqID INT(10) NOT NULL primary key,
	keyword VARCHAR(20) NULL,
	ddlCode INT  NULL,
	ddlName VARCHAR(50)  NULL
); 

CREATE TABLE Elec_User(
	userID VARCHAR(50)  NOT NULL primary key, 
	jctID VARCHAR(50)   NULL,    
	userName VARCHAR(50)   NULL,
	logonName VARCHAR(50)   NULL, 
	logonPwd VARCHAR(50)  NULL,  
	sexID VARCHAR(50)  NULL,     
	birthday DATETIME NULL,     
	address VARCHAR(100)  NULL,   
	contactTel VARCHAR(50)  NULL, 
	email VARCHAR(100)  NULL,     
	mobile VARCHAR(50)  NULL,     
	isDuty VARCHAR(50)  NULL,     
	postID VARCHAR(50)  NULL,     
	onDutyDate DATETIME NULL,     
	offDutyDate DATETIME NULL,    
	remark VARCHAR(500)  NULL,   
	isDelete VARCHAR(10)   NULL, 
	createEmpID VARCHAR(50)  NULL,
	createDate DATETIME NULL,    
	lastEmpID VARCHAR(50)  NULL, 
	lastDate DATETIME NULL       
); 

CREATE TABLE Elec_Popedom(
	MID VARCHAR(32)  NOT NULL,      			
	pid VARCHAR(32)   NOT NULL,          		
	NAME VARCHAR(500)  NULL,     				
	url VARCHAR(5000)  NULL,     				
	icon VARCHAR(5000)   NULL,           		
	target VARCHAR(500)  NULL,   				
	isParent BOOLEAN NULL,       				
	isMenu BOOLEAN NULL,          				
	PRIMARY KEY(MID,pid)                        
);


CREATE TABLE Elec_Role(
	roleID VARCHAR(32)  NOT NULL primary key,   
	roleName VARCHAR(500)                    	
);


CREATE TABLE Elec_Role_Popedom(
	roleID VARCHAR(32)  NOT NULL,      			
	mid VARCHAR(32)   NOT NULL,          		
	pid VARCHAR(32)  NOT NULL,     				
	PRIMARY KEY(roleID,MID,pid)                 
);


CREATE TABLE Elec_Log(
	logID varchar(50) not null primary key,
	ipAddress varchar(50),		
	opeName varchar(50),			
	opeTime DATETIME,						
	details varchar(500)       
);


CREATE TABLE Elec_Text(
	textID varchar(50) not null primary key,
	textName varchar(50),
	textDate datetime,
	textRemark varchar(500)
);





CREATE TABLE Elec_Application_Template (
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR(500),
	processDefinitionKey VARCHAR(500),
	path VARCHAR(5000)
);


CREATE TABLE Elec_Application (
	applicationID INT NOT NULL PRIMARY KEY,
	applicationTemplateID INT,
	applicationUserID VARCHAR(50),
	title VARCHAR(100),
	path VARCHAR(5000),
	applyTime TIMESTAMP,
	status VARCHAR(10), 
	processInstanceID VARCHAR(100),
	CONSTRAINT FOREIGN KEY(applicationTemplateID) REFERENCES Elec_Application_Template(id),
	CONSTRAINT FOREIGN KEY(applicationUserID) REFERENCES Elec_User(userID)
);


CREATE TABLE Elec_ApproveInfo (
	approveID INT NOT NULL PRIMARY KEY,
	applicationID INT,
	comment VARCHAR(5000),
	approval BOOLEAN, 
	approveUserID VARCHAR(50),
	approveTime TIMESTAMP, 
	CONSTRAINT FOREIGN KEY(applicationID) REFERENCES Elec_Application(applicationID),
	CONSTRAINT FOREIGN KEY(approveUserID) REFERENCES Elec_User(userID)
);




