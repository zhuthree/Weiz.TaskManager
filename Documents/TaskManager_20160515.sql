USE [master]
GO
/****** Object:  Database [TaskManager]    Script Date: 03/29/2017 15:45:46 ******/
CREATE DATABASE [TaskManager] ON  PRIMARY 
( NAME = N'TaskManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\TaskManager.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TaskManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\TaskManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TaskManager] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskManager] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TaskManager] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TaskManager] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TaskManager] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TaskManager] SET ARITHABORT OFF
GO
ALTER DATABASE [TaskManager] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TaskManager] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TaskManager] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TaskManager] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TaskManager] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TaskManager] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TaskManager] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TaskManager] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TaskManager] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TaskManager] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TaskManager] SET  DISABLE_BROKER
GO
ALTER DATABASE [TaskManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TaskManager] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TaskManager] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TaskManager] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TaskManager] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TaskManager] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TaskManager] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TaskManager] SET  READ_WRITE
GO
ALTER DATABASE [TaskManager] SET RECOVERY FULL
GO
ALTER DATABASE [TaskManager] SET  MULTI_USER
GO
ALTER DATABASE [TaskManager] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TaskManager] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TaskManager', N'ON'
GO
USE [TaskManager]
GO
/****** Object:  Table [dbo].[p_User]    Script Date: 03/29/2017 15:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[p_User](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[PassWord] [varchar](50) NULL,
	[TrueName] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[PhoneNum] [varchar](30) NULL,
	[IsAdmin] [int] NULL,
	[Status] [int] NULL,
	[CreateTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
 CONSTRAINT [PK_p_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[p_User] ([UserId], [UserName], [PassWord], [TrueName], [UserEmail], [PhoneNum], [IsAdmin], [Status], [CreateTime], [LastLoginTime]) VALUES (1, N'admin', N'zdYqbXkNc1iKJ6s2NRB+9w==', N'admin', N'417114764@qq.com', N'18618243664', 1, 1, CAST(0x0000A5E900000000 AS DateTime), CAST(0x0000A5E900000000 AS DateTime))
/****** Object:  Table [dbo].[p_Task]    Script Date: 03/29/2017 15:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[p_Task](
	[TaskID] [uniqueidentifier] NOT NULL,
	[TaskName] [nvarchar](300) NULL,
	[TaskParam] [nvarchar](max) NULL,
	[CronExpressionString] [nvarchar](200) NULL,
	[AssemblyName] [nvarchar](150) NULL,
	[ClassName] [nvarchar](150) NULL,
	[Status] [int] NULL,
	[IsDelete] [int] NULL,
	[CreatedTime] [datetime] NULL,
	[ModifyTime] [datetime] NULL,
	[RecentRunTime] [datetime] NULL,
	[NextFireTime] [datetime] NULL,
	[CronRemark] [nvarchar](300) NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK__p_Task__7C6949D12F10007B] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'TaskID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'TaskName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'TaskParam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务运行Cron表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'CronExpressionString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程序集名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'AssemblyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务所在类包含命名空间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务运行状态    1:运行 0:停止 -1 删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近运行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'RecentRunTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下次运行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'NextFireTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表达式中文说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'CronRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'p_Task'
GO
INSERT [dbo].[p_Task] ([TaskID], [TaskName], [TaskParam], [CronExpressionString], [AssemblyName], [ClassName], [Status], [IsDelete], [CreatedTime], [ModifyTime], [RecentRunTime], [NextFireTime], [CronRemark], [Remark]) VALUES (N'5fbaa648-d1e8-e511-b79d-54ee75868d11', N'自动增加Job', N'', N'0/10 * * * * ?', N'Weiz.TaskManager.TaskSet', N'Weiz.TaskManager.TaskSet.AutoAddJob', 1, 0, CAST(0x0000A5F300F9CD76 AS DateTime), CAST(0x0000A65F01268671 AS DateTime), CAST(0x0000A65F01268670 AS DateTime), CAST(0x0000A65F01269228 AS DateTime), N'每10秒运行一次，将后台添加的job 增加到quartz 服务中,请勿删除 ', NULL)
INSERT [dbo].[p_Task] ([TaskID], [TaskName], [TaskParam], [CronExpressionString], [AssemblyName], [ClassName], [Status], [IsDelete], [CreatedTime], [ModifyTime], [RecentRunTime], [NextFireTime], [CronRemark], [Remark]) VALUES (N'5fbaa648-d1e8-e511-b79d-54ee75868db0', N'取消超时订单', N'', N'0/20 * * * * ?', N'Weiz.TaskManager.TaskSet', N'Weiz.TaskManager.TaskSet.OrderCancel', 1, 0, CAST(0x0000A5F300F9CD76 AS DateTime), CAST(0x0000A65F01268671 AS DateTime), CAST(0x0000A65F01268670 AS DateTime), CAST(0x0000A65F01269228 AS DateTime), N'每10秒运行一次', NULL)
INSERT [dbo].[p_Task] ([TaskID], [TaskName], [TaskParam], [CronExpressionString], [AssemblyName], [ClassName], [Status], [IsDelete], [CreatedTime], [ModifyTime], [RecentRunTime], [NextFireTime], [CronRemark], [Remark]) VALUES (N'5fbaa648-d1e8-e511-b79d-54ee75868db1', N'测试任务,输出当前时间', N'', N'0/10 * * * * ?', N'Weiz.TaskManager.TaskSet', N'Weiz.TaskManager.TaskSet.TestJob', 1, 0, CAST(0x0000A5F300F9CD76 AS DateTime), CAST(0x0000A65F01268671 AS DateTime), CAST(0x0000A65F01268670 AS DateTime), CAST(0x0000A65F01269228 AS DateTime), N'每10秒运行一次', NULL)
/****** Object:  Table [dbo].[p_RunningLog]    Script Date: 03/29/2017 15:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[p_RunningLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskID] [uniqueidentifier] NULL,
	[Remark] [varchar](500) NULL,
	[Description] [varchar](1000) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_p_TaskRunLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[p_ErrorLog]    Script Date: 03/29/2017 15:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[p_ErrorLog](
	[nId] [bigint] IDENTITY(1,1) NOT NULL,
	[dtDate] [datetime] NULL,
	[sThread] [varchar](100) NULL,
	[sLevel] [varchar](100) NULL,
	[sLogger] [varchar](3000) NULL,
	[sMessage] [varchar](8000) NULL,
	[sException] [varchar](8000) NULL,
	[sName] [varchar](200) NULL,
 CONSTRAINT [PK_p_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[nId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__p_Task__TaskID__30F848ED]    Script Date: 03/29/2017 15:45:46 ******/
ALTER TABLE [dbo].[p_Task] ADD  CONSTRAINT [DF__p_Task__TaskID__30F848ED]  DEFAULT (newsequentialid()) FOR [TaskID]
GO
/****** Object:  Default [DF__p_Task__Status__31EC6D26]    Script Date: 03/29/2017 15:45:46 ******/
ALTER TABLE [dbo].[p_Task] ADD  CONSTRAINT [DF__p_Task__Status__31EC6D26]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__p_Task__CreatedO__32E0915F]    Script Date: 03/29/2017 15:45:46 ******/
ALTER TABLE [dbo].[p_Task] ADD  CONSTRAINT [DF__p_Task__CreatedO__32E0915F]  DEFAULT (getdate()) FOR [CreatedTime]
GO
