USE [master]
GO
/****** Object:  Database [Basecamp]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE DATABASE [Basecamp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Basecamp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Basecamp.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Basecamp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Basecamp_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Basecamp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Basecamp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Basecamp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Basecamp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Basecamp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Basecamp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Basecamp] SET ARITHABORT OFF 
GO
ALTER DATABASE [Basecamp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Basecamp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Basecamp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Basecamp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Basecamp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Basecamp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Basecamp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Basecamp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Basecamp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Basecamp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Basecamp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Basecamp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Basecamp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Basecamp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Basecamp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Basecamp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Basecamp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Basecamp] SET RECOVERY FULL 
GO
ALTER DATABASE [Basecamp] SET  MULTI_USER 
GO
ALTER DATABASE [Basecamp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Basecamp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Basecamp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Basecamp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Basecamp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Basecamp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Basecamp', N'ON'
GO
ALTER DATABASE [Basecamp] SET QUERY_STORE = ON
GO
ALTER DATABASE [Basecamp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Basecamp]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[ScheduleTypeID] [int] NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK__Schedule__3214EC2762E7FFF6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[To_Dos]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[To_Dos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[NoteID] [int] NULL,
	[PublishingInfoID] [int] NOT NULL,
	[ListID] [int] NOT NULL,
	[ScheduleID] [int] NULL,
	[IsPrivate] [bit] NOT NULL,
	[Checked] [bit] NOT NULL,
 CONSTRAINT [PK__To_Dos__3214EC26C2394C40] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_ToDo_ListID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_ToDo_ListID] ON [dbo].[To_Dos]
(
	[ListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublishingInformation]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublishingInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PublishedAt] [datetime] NOT NULL,
	[PublisherID] [int] NOT NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK__Publishi__3214EC27BD43DE5A] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[JobTitle] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](150) NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Users_Password] UNIQUE NONCLUSTERED 
(
	[Password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AdminID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ToDoViewByListID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ToDoViewByListID]
AS
SELECT TD.ID AS ToDoID, TD.ListID, TD.Checked, TD.Text, U.Name, S.FromDate, S.ToDate, TD.IsPrivate
FROM     dbo.To_Dos AS TD INNER JOIN
                  dbo.PublishingInformation AS P ON TD.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID LEFT OUTER JOIN
                  dbo.Schedules AS S ON TD.ScheduleID = S.ID
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[NoteID] [int] NULL,
	[FilePath] [nvarchar](4000) NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK__Document__3214EC26541E7FFA] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_Doc_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_Doc_ProjectID] ON [dbo].[Documents]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](2000) NULL,
	[URLLink] [nvarchar](4000) NULL,
	[PublishingInfoID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK__Notes__3214EC27F61D417A] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_DocumentViewByDocumentID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_DocumentViewByDocumentID]
AS
SELECT D.ID AS DocumentID, D.FilePath, D.Name AS DocName, D.IsPrivate, N.ID AS NoteID, N.Text, N.URLLink, P.PublishedAt, U.Name
FROM     dbo.Documents AS D LEFT OUTER JOIN
                  dbo.Notes AS N ON D.NoteID = N.ID INNER JOIN
                  dbo.PublishingInformation AS P ON D.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  View [dbo].[VW_DocumentViewByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_DocumentViewByProjectID]
AS
SELECT D.ID AS DocID, D.ProjectID, D.FilePath, D.Name AS DocName, N.Text, N.URLLink, P.PublishedAt, D.IsPrivate
FROM     dbo.Documents AS D LEFT OUTER JOIN
                  dbo.Notes AS N ON D.NoteID = N.ID INNER JOIN
                  dbo.PublishingInformation AS P ON D.PublishingInfoID = P.ID
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK__Chats__3214EC26AE6092AA] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [CLI_Chat_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_Chat_ProjectID] ON [dbo].[Chats]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ChatViewByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ChatViewByProjectID]
AS
SELECT C.ProjectID, C.Text, P.PublishedAt, U.Name AS UserName, C.IsPrivate
FROM     dbo.Chats AS C INNER JOIN
                  dbo.PublishingInformation AS P ON C.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  Table [dbo].[Events]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NoteID] [int] NULL,
	[URLLink] [nvarchar](500) NULL,
	[PublishingInfoID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK__Events__3214EC269775F942] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_Event_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_Event_ProjectID] ON [dbo].[Events]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_EventViewByEventID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_EventViewByEventID]
AS
SELECT E.ID AS EventID, E.Name AS EventName, S.FromDate, S.ToDate, E.URLLink AS EventURLLink, E.IsPrivate, N.ID AS NoteID, N.Text, N.URLLink AS NoteURLLink, P.PublishedAt, U.Name AS UserName
FROM     dbo.Events AS E INNER JOIN
                  dbo.Schedules AS S ON E.ScheduleID = S.ID LEFT OUTER JOIN
                  dbo.Notes AS N ON E.NoteID = N.ID INNER JOIN
                  dbo.PublishingInformation AS P ON E.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  Table [dbo].[Lists]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[NoteID] [int] NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK__Lists__3214EC26C1FBE503] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_List_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_List_ProjectID] ON [dbo].[Lists]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Columns]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Columns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK__Columns__3214EC260C54A636] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_Column_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_Column_ProjectID] ON [dbo].[Columns]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ColumnID] [int] NOT NULL,
	[ScheduleID] [int] NULL,
	[NoteID] [int] NULL,
	[PublishingInfoID] [int] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK__Cards__3214EC2672C6834D] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_Card_ColumnID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_Card_ColumnID] ON [dbo].[Cards]
(
	[ColumnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_EventViewByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_EventViewByProjectID]
AS
SELECT TOP (100) PERCENT ProjectID, ItemID, Title, FromDate, ToDate, PublishedAt, IsPrivate
FROM     (SELECT E.ProjectID, E.ID AS ItemID, E.Name AS Title, S.FromDate, S.ToDate, P.PublishedAt, E.IsPrivate
                  FROM      dbo.Events AS E INNER JOIN
                                    dbo.Schedules AS S ON E.ScheduleID = S.ID INNER JOIN
                                    dbo.PublishingInformation AS P ON E.PublishingInfoID = P.ID
                  UNION ALL
                  SELECT L.ProjectID, TD.ID AS ItemID, TD.Text AS Title, S.FromDate, S.ToDate, P.PublishedAt, TD.IsPrivate
                  FROM     dbo.To_Dos AS TD INNER JOIN
                                    dbo.Schedules AS S ON TD.ScheduleID = S.ID INNER JOIN
                                    dbo.Lists AS L ON TD.ListID = L.ID INNER JOIN
                                    dbo.PublishingInformation AS P ON TD.PublishingInfoID = P.ID
                  UNION ALL
                  SELECT Col.ProjectID, C.ID AS ItemID, C.Title, S.FromDate, S.ToDate, P.PublishedAt, C.IsPrivate
                  FROM     dbo.Cards AS C INNER JOIN
                                    dbo.Schedules AS S ON C.ScheduleID = S.ID INNER JOIN
                                    dbo.Columns AS Col ON C.ColumnID = Col.ID INNER JOIN
                                    dbo.PublishingInformation AS P ON C.PublishingInfoID = P.ID) AS ResultTable
WHERE  (ToDate >= CAST(GETDATE() AS DATE))
ORDER BY PublishedAt DESC
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](100) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
 CONSTRAINT [PK__Question__3214EC26F8374085] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_Quest_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_Quest_ProjectID] ON [dbo].[Questions]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_QuestionViewByQuestionID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_QuestionViewByQuestionID] AS SELECT Q.ID AS QuestionID, Q.Text, Q.IsPrivate, S.FromDate, S.ToDate FROM Questions AS Q INNER JOIN Schedules AS S ON Q.ScheduleID = S.ID
GO
/****** Object:  View [dbo].[VW_QuestionViewByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_QuestionViewByProjectID]
AS
SELECT Q.ID AS QuestionID, Q.ProjectID, Q.Text, S.FromDate, S.ToDate, Q.IsPrivate
FROM     dbo.Questions AS Q INNER JOIN
                  dbo.Schedules AS S ON Q.ScheduleID = S.ID
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[AnswerID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_AnswerViewByQuestionID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_AnswerViewByQuestionID]
AS
SELECT A.ID AS AnswerID, A.QuestionID, N.ID AS NoteID, N.Text, N.URLLink, P.PublishedAt, U.Name
FROM     dbo.Answers AS A LEFT OUTER JOIN
                  dbo.Questions AS Q ON A.QuestionID = Q.ID LEFT OUTER JOIN
                  dbo.Notes AS N ON A.AnswerID = N.ID INNER JOIN
                  dbo.PublishingInformation AS P ON N.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  Table [dbo].[Steps]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Steps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CardID] [int] NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
	[IsChecked] [bit] NOT NULL,
 CONSTRAINT [PK__Steps__3214EC267CFDF8B9] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_Step_CardID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_Step_CardID] ON [dbo].[Steps]
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_StepViewByCardID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_StepViewByCardID]
AS
SELECT S.ID AS StepID, C.ID AS CardID, S.Text, S.IsChecked
FROM     dbo.Steps AS S INNER JOIN
                  dbo.Cards AS C ON S.CardID = C.ID
GO
/****** Object:  View [dbo].[VW_CardViewByCardID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CardViewByCardID]
AS
SELECT C.ID AS CardID, Col.Title AS ColumnTitle, C.Title AS CardTitle, N.ID AS NoteID, N.Text AS NoteText, N.URLLink, S.FromDate, S.ToDate, P.PublishedAt, U.Name AS Username
FROM     dbo.Cards AS C INNER JOIN
                  dbo.Columns AS Col ON C.ColumnID = Col.ID LEFT OUTER JOIN
                  dbo.Notes AS N ON C.NoteID = N.ID LEFT OUTER JOIN
                  dbo.Schedules AS S ON C.ScheduleID = S.ID INNER JOIN
                  dbo.PublishingInformation AS P ON C.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  View [dbo].[VW_CardViewByColumnID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CardViewByColumnID]
AS
SELECT C.ID AS CardID, C.ColumnID, C.Title, S.FromDate, S.ToDate, P.PublishedAt, U.Name AS Username, C.IsPrivate
FROM     dbo.Cards AS C LEFT OUTER JOIN
                  dbo.Notes AS N ON C.NoteID = N.ID LEFT OUTER JOIN
                  dbo.Schedules AS S ON C.ScheduleID = S.ID INNER JOIN
                  dbo.PublishingInformation AS P ON C.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  View [dbo].[VW_ColumnViewByColumnID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ColumnViewByColumnID]
AS
SELECT ID AS ColumnID, Title, Description,
                      (SELECT COUNT(*) AS Expr1
                       FROM      dbo.Cards AS C
                       WHERE   (ColumnID = Col.ID)) AS CardsNum
FROM     dbo.Columns AS Col
GO
/****** Object:  View [dbo].[VW_ColumnViewByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ColumnViewByProjectID]
AS
SELECT Col.ProjectID, Col.ID AS ColumnID, Col.Title,
                      (SELECT COUNT(*) AS Expr1
                       FROM      dbo.Cards AS C
                       WHERE   (ColumnID = Col.ID)) AS CardsNum, Col.Description, P.PublishedAt, Col.IsPrivate
FROM     dbo.Columns AS Col INNER JOIN
                  dbo.PublishingInformation AS P ON Col.PublishingInfoID = P.ID
GO
/****** Object:  Table [dbo].[ProjectComments]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectComments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
	[EventID] [int] NULL,
	[To_DoID] [int] NULL,
	[CardID] [int] NULL,
	[StepID] [int] NULL,
	[MessageID] [int] NULL,
	[DocumentID] [int] NULL,
	[ProjectID] [int] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_CommentViewByElementID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CommentViewByElementID]
AS
SELECT PC.ID AS CommentID, PC.MessageID, PC.DocumentID, PC.EventID, PC.To_DoID, PC.CardID, PC.StepID, N.ID AS NoteID, N.Text, N.URLLink, P.PublishedAt, U.Name
FROM     dbo.ProjectComments AS PC INNER JOIN
                  dbo.Notes AS N ON PC.NoteID = N.ID INNER JOIN
                  dbo.PublishingInformation AS P ON PC.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[EventID] [int] NULL,
	[To_DoID] [int] NULL,
	[StepID] [int] NULL,
	[QuestionID] [int] NULL,
	[CardID] [int] NULL,
	[ClientID] [int] NULL,
	[CommentID] [int] NULL,
 CONSTRAINT [PK__Assignme__3214EC27CEA234D5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_AssignmentViewByElementID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_AssignmentViewByElementID] AS SELECT A.QuestionID, A.EventID, A.To_DoID, A.CardID, A.StepID, U.Name FROM Assignments AS A INNER JOIN Members AS M ON A.MemberID = M.ID INNER JOIN Users AS U ON M.UserID = U.ID
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[ProjectID] [int] NULL,
	[EventID] [int] NULL,
	[To_DoID] [int] NULL,
	[CommentID] [int] NULL,
	[CardID] [int] NULL,
	[StepID] [int] NULL,
	[MessageID] [int] NULL,
	[DocumentID] [int] NULL,
	[PublishingInfoID] [int] NOT NULL,
	[ChatID] [int] NULL,
	[QuestionID] [int] NULL,
	[AnswerID] [int] NULL,
 CONSTRAINT [PK__Activiti__3214EC262FA175F4] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ActivityViewByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ActivityViewByProjectID] AS SELECT A.ProjectID, A.Text, A.AnswerID, A.CardID, A.ChatID, A.CommentID, A.DocumentID, A.EventID, A.MessageID, P.PublishedAt FROM Activities AS A INNER JOIN PublishingInformation AS P ON A.PublishingInfoID = P.ID
GO
/****** Object:  Table [dbo].[Files]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](4000) NOT NULL,
	[Caption] [nvarchar](200) NULL,
	[NoteID] [int] NOT NULL,
 CONSTRAINT [PK__Files__3214EC27106EF2CE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_FileByNoteID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_FileByNoteID]
AS
SELECT ID AS FileID, NoteID, FilePath, Caption
FROM     dbo.Files AS F
GO
/****** Object:  View [dbo].[VW_AssignmentByElementID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_AssignmentByElementID]
AS
SELECT A.QuestionID, A.EventID, A.To_DoID, A.CardID, A.StepID, A.CommentID, U.Name AS MemberName
FROM     dbo.Assignments AS A INNER JOIN
                  dbo.Members AS M ON A.MemberID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  View [dbo].[VW_ActivityByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ActivityByProjectID]
AS
SELECT A.ProjectID, A.Text, A.AnswerID, A.CardID, A.ChatID, A.CommentID, A.DocumentID, A.To_DoID, A.EventID, A.MessageID, A.StepID, A.QuestionID, P.PublishedAt
FROM     dbo.Activities AS A INNER JOIN
                  dbo.PublishingInformation AS P ON A.PublishingInfoID = P.ID
GO
/****** Object:  Table [dbo].[Invitations]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invitations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TheInvitedName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Text] [nvarchar](500) NULL,
	[JobTitle] [nvarchar](100) NULL,
	[CompanyName] [nvarchar](100) NULL,
	[PublishingInfoID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[MemberOrClient] [bit] NOT NULL,
 CONSTRAINT [PK__Invitati__3214EC27B2EC39F5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvitationStatuses]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvitationStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_InvitationStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_InvitationProject]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Invitations, Teem Members, Clients VIEWS

-- Invitation VIEWS
-- 1:
CREATE VIEW [dbo].[VW_InvitationProject] AS
SELECT 
I.ID AS InvitationID,
I.TheInvitedName,
P.PublishedAt,
InvitStat.Name,
I.ProjectID

FROM Invitations AS I
INNER JOIN
PublishingInformation AS P ON I.PublishingInfoID = P.ID
INNER JOIN 
InvitationStatuses AS InvitStat ON I.StatusID = InvitStat.ID
GO
/****** Object:  View [dbo].[VW_Invitation]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 2:
CREATE VIEW [dbo].[VW_Invitation] AS
SELECT 
I.ID AS InvitationID,
I.TheInvitedName,
I.Email,
I.Text,
I.JobTitle,
I.CompanyName,
P.PublishedAt,
U.Name AS InviterName,
InvitStat.Name

FROM Invitations AS I
INNER JOIN
PublishingInformation AS P ON I.PublishingInfoID = P.ID
INNER JOIN 
InvitationStatuses AS InvitStat ON I.StatusID = InvitStat.ID
INNER JOIN 
Members AS M ON P.PublisherID = M.ID
INNER JOIN
Users AS U ON M.UserID = U.ID
GO
/****** Object:  View [dbo].[VW_MemberProject]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Member VIEWS
 1:*/
CREATE VIEW [dbo].[VW_MemberProject]
AS
SELECT DISTINCT M.ID AS MemberID, U.Name AS MemberName, U.CompanyName, U.JobTitle, A.ProjectID
FROM     dbo.Members AS M INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID INNER JOIN
                  dbo.Assignments AS A ON M.ID = A.MemberID
GO
/****** Object:  View [dbo].[VW_Member]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 2:*/
CREATE VIEW [dbo].[VW_Member]
AS
SELECT M.ID AS MemberID, U.Name AS MemberName, U.CompanyName, U.JobTitle
FROM     dbo.Members AS M INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ClientProject]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Client VIEWS
-- 1:

CREATE VIEW [dbo].[VW_ClientProject] AS
SELECT
C.ID AS ClientID,
U.Name AS ClientName,
U.CompanyName,
A.ProjectID

FROM Clients AS C
INNER JOIN
Users AS U ON C.UserID = U.ID
INNER JOIN
Assignments AS A ON C.ID = A.ClientID

GO
/****** Object:  View [dbo].[VW_Client]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 2:

CREATE VIEW [dbo].[VW_Client] AS
SELECT
C.ID AS ClientID,
U.Name AS ClientName,
U.CompanyName,
U.JobTitle,
U.Email


FROM Clients AS C
INNER JOIN
Users AS U ON C.UserID = U.ID
INNER JOIN
Assignments AS A ON C.ID = A.ClientID
GO
/****** Object:  Table [dbo].[MessageBoards]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageBoards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[IsPrivate] [bit] NOT NULL,
	[PublishingInfoID] [int] NOT NULL,
	[NoteID] [int] NOT NULL,
 CONSTRAINT [PK__MessageB__3214EC2619ACF91F] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CLI_MsgBoard_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE CLUSTERED INDEX [CLI_MsgBoard_ProjectID] ON [dbo].[MessageBoards]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_MessageBoardByMessageID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_MessageBoardByMessageID]
AS
SELECT M.ID AS MessageID, M.Title, MN.ID AS NoteID, MN.Text, MN.URLLink, MP.PublishedAt, MPMU.Name
FROM     dbo.MessageBoards AS M LEFT OUTER JOIN
                  dbo.Notes AS MN ON M.NoteID = MN.ID LEFT OUTER JOIN
                  dbo.PublishingInformation AS MP ON M.PublishingInfoID = MP.ID LEFT OUTER JOIN
                  dbo.Members AS MPM ON MP.PublisherID = MPM.ID LEFT OUTER JOIN
                  dbo.Users AS MPMU ON MPM.UserID = MPMU.ID
GO
/****** Object:  View [dbo].[VW_MessageBoardByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_MessageBoardByProjectID]
AS
SELECT TOP (100) PERCENT MB.ID AS MessageID, MB.Title, U.Name, P.PublishedAt, N.Text, N.URLLink, MB.ProjectID, MB.IsPrivate
FROM     dbo.MessageBoards AS MB LEFT OUTER JOIN
                  dbo.Notes AS N ON MB.NoteID = N.ID INNER JOIN
                  dbo.PublishingInformation AS P ON MB.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  View [dbo].[VW_ListViewByListID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ListViewByListID]
AS
SELECT L.ID AS ListID, L.Title, L.IsPrivate, N.ID AS NoteID, N.Text, N.URLLink
FROM     dbo.Lists AS L LEFT OUTER JOIN
                  dbo.Notes AS N ON L.NoteID = N.ID
GO
/****** Object:  View [dbo].[VW_ListViewByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ListViewByProjectID]
AS
SELECT L.ProjectID, L.Title, N.Text, N.URLLink, F.Caption, L.IsPrivate
FROM     dbo.Lists AS L LEFT OUTER JOIN
                  dbo.Notes AS N ON L.NoteID = N.ID LEFT OUTER JOIN
                  dbo.Files AS F ON N.ID = F.NoteID
GO
/****** Object:  View [dbo].[VW_ToDoViewByToDoID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ToDoViewByToDoID]
AS
SELECT TD.ID AS To_DoID, TD.Text, TD.Checked, TD.IsPrivate, N.ID AS NoteID, N.Text AS NoteText, N.URLLink, P.PublishedAt, U.Name
FROM     dbo.To_Dos AS TD LEFT OUTER JOIN
                  dbo.Notes AS N ON TD.NoteID = N.ID INNER JOIN
                  dbo.PublishingInformation AS P ON TD.PublishingInfoID = P.ID INNER JOIN
                  dbo.Members AS M ON P.PublisherID = M.ID INNER JOIN
                  dbo.Users AS U ON M.UserID = U.ID
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PublishingInfoID] [int] NULL,
 CONSTRAINT [PK__Projects__3214EC27201DD682] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleTypes]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Chat_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Chat_PubInfoID] ON [dbo].[Chats]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Column_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Column_PubInfoID] ON [dbo].[Columns]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Doc_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Doc_PubInfoID] ON [dbo].[Documents]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Event_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Event_PubInfoID] ON [dbo].[Events]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Invt_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Invt_ProjectID] ON [dbo].[Invitations]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_List_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_List_PubInfoID] ON [dbo].[Lists]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Note_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Note_PubInfoID] ON [dbo].[Notes]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Comment_CardID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Comment_CardID] ON [dbo].[ProjectComments]
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Comment_DocumentID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Comment_DocumentID] ON [dbo].[ProjectComments]
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Comment_EventID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Comment_EventID] ON [dbo].[ProjectComments]
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Comment_MessageID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Comment_MessageID] ON [dbo].[ProjectComments]
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Comment_ProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Comment_ProjectID] ON [dbo].[ProjectComments]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Comment_StepID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Comment_StepID] ON [dbo].[ProjectComments]
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Comment_ToDoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Comment_ToDoID] ON [dbo].[ProjectComments]
(
	[To_DoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Schedule_TypeID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Schedule_TypeID] ON [dbo].[Schedules]
(
	[ScheduleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Step_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Step_PubInfoID] ON [dbo].[Steps]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_ToDo_PubInfoID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_ToDo_PubInfoID] ON [dbo].[To_Dos]
(
	[PublishingInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [NCI_ToDo_ScheduleID]    Script Date: 2/3/2026 12:28:17 AM ******/
CREATE NONCLUSTERED INDEX [NCI_ToDo_ScheduleID] ON [dbo].[To_Dos]
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cards] ADD  DEFAULT ((1)) FOR [IsPrivate]
GO
ALTER TABLE [dbo].[PublishingInformation] ADD  CONSTRAINT [DF__Publishin__Publi__6166761E]  DEFAULT (getdate()) FOR [PublishedAt]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__CardI__6CD828CA] FOREIGN KEY([CardID])
REFERENCES [dbo].[Cards] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__CardI__6CD828CA]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__ChatI__7EC1CEDB] FOREIGN KEY([ChatID])
REFERENCES [dbo].[Chats] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__ChatI__7EC1CEDB]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__Docum__6EC0713C] FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Documents] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__Docum__6EC0713C]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__Event__6AEFE058] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__Event__6AEFE058]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__Messa__6DCC4D03] FOREIGN KEY([MessageID])
REFERENCES [dbo].[MessageBoards] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__Messa__6DCC4D03]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__Proje__69FBBC1F] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__Proje__69FBBC1F]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__Publi__6BAEFA67] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__Publi__6BAEFA67]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__StepI__6FB49575] FOREIGN KEY([StepID])
REFERENCES [dbo].[Steps] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__StepI__6FB49575]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK__Activitie__To_Do__6BE40491] FOREIGN KEY([To_DoID])
REFERENCES [dbo].[To_Dos] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK__Activitie__To_Do__6BE40491]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activ_QuestID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activ_QuestID]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activit_AnswerID] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answers] ([ID])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activit_AnswerID]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK__Answers__Project__3AD6B8E2] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK__Answers__Project__3AD6B8E2]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK__Answers__Project__3CBF0154] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK__Answers__Project__3CBF0154]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK__Answers__Publish__3F9B6DFF] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK__Answers__Publish__3F9B6DFF]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Note] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answer_Note]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [Assign_ClientID] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [Assign_ClientID]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [ComID_AssinID] FOREIGN KEY([CommentID])
REFERENCES [dbo].[ProjectComments] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [ComID_AssinID]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK__Assignmen__Membe__7E37BEF6] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK__Assignmen__Membe__7E37BEF6]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK__Assignmen__Proje__7F2BE32F] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK__Assignmen__Proje__7F2BE32F]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK__Assignmen__Quest__7755B73D] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK__Assignmen__Quest__7755B73D]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK__Assignmen__Quest__7A3223E8] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK__Assignmen__Quest__7A3223E8]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK__Assignmen__StepI__793DFFAF] FOREIGN KEY([StepID])
REFERENCES [dbo].[Steps] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK__Assignmen__StepI__793DFFAF]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK__Assignmen__To_Do__7849DB76] FOREIGN KEY([To_DoID])
REFERENCES [dbo].[To_Dos] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK__Assignmen__To_Do__7849DB76]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assign_CardID] FOREIGN KEY([CardID])
REFERENCES [dbo].[Cards] ([ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assign_CardID]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK__Chats__ProjectID__14270015] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK__Chats__ProjectID__14270015]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_chats_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_chats_PubInfoID]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Columns]  WITH CHECK ADD  CONSTRAINT [FK__Columns__Project__17F790F9] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Columns] CHECK CONSTRAINT [FK__Columns__Project__17F790F9]
GO
ALTER TABLE [dbo].[Columns]  WITH CHECK ADD  CONSTRAINT [FK_Column_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Columns] CHECK CONSTRAINT [FK_Column_PubInfoID]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK__Documents__Proje__40F9A68C] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK__Documents__Proje__40F9A68C]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Docs_Comment] FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Docs_Comment]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Docs_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Docs_PubInfoID]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK__Events__ProjectI__2A164134] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK__Events__ProjectI__2A164134]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Event_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Event_PubInfoID]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Event_Schedules] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedules] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Event_Schedules]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Comment] FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Comment]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK__Files__NoteID__08B54D69] FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK__Files__NoteID__08B54D69]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK__Invitatio__Proje__7E02B4CC] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK__Invitatio__Proje__7E02B4CC]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Invit_IntStatID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[InvitationStatuses] ([ID])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Invit_IntStatID]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Invit_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Invit_PubInfoID]
GO
ALTER TABLE [dbo].[Lists]  WITH CHECK ADD  CONSTRAINT [FK_List_Note] FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[Lists] CHECK CONSTRAINT [FK_List_Note]
GO
ALTER TABLE [dbo].[Lists]  WITH CHECK ADD  CONSTRAINT [FK_List_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Lists] CHECK CONSTRAINT [FK_List_PubInfoID]
GO
ALTER TABLE [dbo].[Lists]  WITH CHECK ADD  CONSTRAINT [FK_Proj_PubInfo] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Lists] CHECK CONSTRAINT [FK_Proj_PubInfo]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Members] ([ID])
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[MessageBoards]  WITH CHECK ADD  CONSTRAINT [FK_MessageBoards_Note] FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[MessageBoards] CHECK CONSTRAINT [FK_MessageBoards_Note]
GO
ALTER TABLE [dbo].[MessageBoards]  WITH CHECK ADD  CONSTRAINT [FK_MessageBoards_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[MessageBoards] CHECK CONSTRAINT [FK_MessageBoards_Project]
GO
ALTER TABLE [dbo].[MessageBoards]  WITH CHECK ADD  CONSTRAINT [FK_MessageBoards_PublishingInfo] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[MessageBoards] CHECK CONSTRAINT [FK_MessageBoards_PublishingInfo]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK__Notes__Publishin__05D8E0BE] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK__Notes__Publishin__05D8E0BE]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Project]
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__CardID__3F6663D5] FOREIGN KEY([CardID])
REFERENCES [dbo].[Cards] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments] CHECK CONSTRAINT [FK__Comments__CardID__3F6663D5]
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Documents] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD FOREIGN KEY([MessageID])
REFERENCES [dbo].[MessageBoards] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__Projec__3C89F72A] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments] CHECK CONSTRAINT [FK__Comments__Projec__3C89F72A]
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__StepID__4242D080] FOREIGN KEY([StepID])
REFERENCES [dbo].[Steps] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments] CHECK CONSTRAINT [FK__Comments__StepID__4242D080]
GO
ALTER TABLE [dbo].[ProjectComments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__To_DoI__3E723F9C] FOREIGN KEY([To_DoID])
REFERENCES [dbo].[To_Dos] ([ID])
GO
ALTER TABLE [dbo].[ProjectComments] CHECK CONSTRAINT [FK__Comments__To_DoI__3E723F9C]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Proj_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Proj_PubInfoID]
GO
ALTER TABLE [dbo].[PublishingInformation]  WITH CHECK ADD  CONSTRAINT [FK__Publishin__Proje__1F2E9E6D] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[PublishingInformation] CHECK CONSTRAINT [FK__Publishin__Proje__1F2E9E6D]
GO
ALTER TABLE [dbo].[PublishingInformation]  WITH CHECK ADD  CONSTRAINT [FK__Publishin__Publi__787EE5A0] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Members] ([ID])
GO
ALTER TABLE [dbo].[PublishingInformation] CHECK CONSTRAINT [FK__Publishin__Publi__787EE5A0]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__Proje__45BE5BA9] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__Proje__45BE5BA9]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__Sched__47A6A41B] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedules] ([ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__Sched__47A6A41B]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK__Schedules__Proje__27F8EE98] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK__Schedules__Proje__27F8EE98]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK__Schedules__Sched__114A936A] FOREIGN KEY([ScheduleTypeID])
REFERENCES [dbo].[ScheduleTypes] ([ID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK__Schedules__Sched__114A936A]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK__Steps__CardID__236943A5] FOREIGN KEY([CardID])
REFERENCES [dbo].[Cards] ([ID])
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK__Steps__CardID__236943A5]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Step_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Step_PubInfoID]
GO
ALTER TABLE [dbo].[To_Dos]  WITH CHECK ADD  CONSTRAINT [FK__To_Dos__ListID__3864608B] FOREIGN KEY([ListID])
REFERENCES [dbo].[Lists] ([ID])
GO
ALTER TABLE [dbo].[To_Dos] CHECK CONSTRAINT [FK__To_Dos__ListID__3864608B]
GO
ALTER TABLE [dbo].[To_Dos]  WITH CHECK ADD  CONSTRAINT [FK__To_Dos__Schedule__3587F3E0] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedules] ([ID])
GO
ALTER TABLE [dbo].[To_Dos] CHECK CONSTRAINT [FK__To_Dos__Schedule__3587F3E0]
GO
ALTER TABLE [dbo].[To_Dos]  WITH CHECK ADD  CONSTRAINT [FK_To_Dos_Note] FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[To_Dos] CHECK CONSTRAINT [FK_To_Dos_Note]
GO
ALTER TABLE [dbo].[To_Dos]  WITH CHECK ADD  CONSTRAINT [FK_ToDo_Note] FOREIGN KEY([NoteID])
REFERENCES [dbo].[Notes] ([ID])
GO
ALTER TABLE [dbo].[To_Dos] CHECK CONSTRAINT [FK_ToDo_Note]
GO
ALTER TABLE [dbo].[To_Dos]  WITH CHECK ADD  CONSTRAINT [FK_ToDo_PubInfoID] FOREIGN KEY([PublishingInfoID])
REFERENCES [dbo].[PublishingInformation] ([ID])
GO
ALTER TABLE [dbo].[To_Dos] CHECK CONSTRAINT [FK_ToDo_PubInfoID]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddAnswer]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_AddAnswer]
    @MemberID INT,
    @QuestionID INT,
    @ProjectID INT,
    @AnswerText NVARCHAR(2000) = NULL,
    @URLLink NVARCHAR(4000) = NULL
   
       
    
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PubInfoID INT;
    DECLARE @NewNoteID INT;



    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        
        IF @QuestionID IS NULL
        BEGIN
            RAISERROR('QuestionID is required.', 16, 1);
        END

      

        IF  @AnswerText IS NULL AND @URLLink IS NULL 
        BEGIN
            RAISERROR('Answer is required.', 16, 1);
        END


        IF @MemberID IS NULL
        BEGIN
            RAISERROR('The respondent ID is required.', 16, 1);
        END

        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
       
        
    
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Column does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
        -- Verify QuestionID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Questions WHERE ID = @QuestionID)
        BEGIN
            RAISERROR('Invalid QuestionID. Column does not exist.', 16, 1);
        END
      
        
        -- Step 1: ALTER PublishingInformation record
        INSERT INTO dbo.PublishingInformation ( PublisherID)
        VALUES (@MemberID);
        
        SET @PubInfoID = SCOPE_IDENTITY();
        
       

            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@AnswerText, @URLLink, @PubInfoID, @ProjectID);
            
            SET @NewNoteID = SCOPE_IDENTITY();
          
        

        INSERT INTO Answers(QuestionID, AnswerID, ProjectID, PublishingInfoID)
        VALUES (@QuestionID, @NewNoteID, @ProjectID, @PubInfoID)
       
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddAssignment]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_AddAssignment]
    @MemberID INT,
    @EventID INT = NULL,
    @To_DoID INT = NULL,
    @CardID INT = NULL,
    @StepID INT = NULL,
    @QuestionID INT = NULL,
    @CommentID INT = NULL,
    @ProjectID INT
       
    
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @NoteID INT;



    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        
        IF  @CommentID IS NULL AND @EventID IS NULL AND @To_DoID IS NULL AND  @StepID IS NULL AND @QuestionID IS NULL AND @CardID IS NULL
        BEGIN
            RAISERROR('Element is required.', 16, 1);
        END


        IF @MemberID IS NULL
        BEGIN
            RAISERROR('MemberID is required.', 16, 1);
        END

        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
       
        

        IF  @EventID IS NULL AND @To_DoID IS NULL AND  @StepID IS NULL AND @QuestionID IS NULL AND @CardID IS NULL
        BEGIN
            -- Verify ProjectID exists
            IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
            BEGIN
                RAISERROR('Invalid ProjectID. Column does not exist.', 16, 1);
            END
            
            -- Verify PublisherID exists
            IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
            BEGIN
                RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
            END
            
            -- Verify EventID exists
            IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE ID = @EventID)
            BEGIN
                RAISERROR('Invalid EventID. Column does not exist.', 16, 1);
            END

            -- Verify To_DoID exists
            IF NOT EXISTS (SELECT 1 FROM dbo.To_Dos WHERE ID = @To_DoID)
            BEGIN
                RAISERROR('Invalid To_DoID. Column does not exist.', 16, 1);
            END

            -- Verify CardID exists
            IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID)
            BEGIN
                RAISERROR('Invalid CardID. Column does not exist.', 16, 1);
            END
 
            -- Verify StepID exists
            IF NOT EXISTS (SELECT 1 FROM dbo.Steps WHERE ID = @StepID)
            BEGIN
                RAISERROR('Invalid StepID. Column does not exist.', 16, 1);
            END

            -- Verify CommentID exists
            IF NOT EXISTS (SELECT 1 FROM dbo.ProjectComments WHERE ID = @CommentID)
            BEGIN
                RAISERROR('Invalid CommentID. Comment does not exist.', 16, 1);
            END
        END

        -- Validate that the member is part of the project

         IF NOT EXISTS (SELECT 1 FROM Assignments WHERE MemberID = @MemberID AND ProjectID = @ProjectID)
    BEGIN
        RAISERROR('The specified member is not a part of this project.', 16, 1); 
        
    END
        
       
       
        INSERT INTO Assignments(ProjectID, MemberID, EventID, To_DoID, CardID, StepID, QuestionID,CommentID)
        VALUES (@ProjectID, @MemberID, @EventID, @To_DoID,@CardID, @StepID, @QuestionID, @CommentID)
       
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_AddCardToColumn]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddCardToColumn]
    @MemberID INT,
    @ProjectID INT,
    @Title NVARCHAR(50),
    @FromDate DATETIME = NULL,
    @ToDate DATETIME = NULL,
    @ColumnID INT,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL
        
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @NoteID INT;
    DECLARE @ScheduleID INT;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        IF @ColumnID IS NULL
        BEGIN
            RAISERROR('ColumnID is required.', 16, 1);
        END
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END
        
       
        

        -- Verify ColumnID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Columns WHERE ID = @ColumnID)
        BEGIN
            RAISERROR('Invalid ColumnID. Column does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
      
        
        -- Add PublishingInformation record
        INSERT INTO dbo.PublishingInformation ( PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
        --  Add Note record if note text is provided
        IF @NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL
        BEGIN
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PublishingInfoID, @ProjectID);
            
            SET @NoteID = SCOPE_IDENTITY();
                        
        END

          --  Add Schedule record if dates are provided
          IF @FromDate IS NOT NULL AND @ToDate IS NOT NULL
        BEGIN
            INSERT INTO Schedules(FromDate,ToDate, ProjectID)
            VALUES (@FromDate, @ToDate, @ProjectID)

            SET @ScheduleID = SCOPE_IDENTITY();

        END
        
        --  Add Card record
        INSERT INTO dbo.Cards(Title, ColumnID, NoteID, PublishingInfoID,ScheduleID)
        VALUES (@Title, @ColumnID, @NoteID, @PublishingInfoID,@ScheduleID);
        
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddColumn]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddColumn]
    @MemberID INT,
    @Title NVARCHAR(50),
    @Description NVARCHAR(2000),
    @ProjectID INT,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        IF @Title IS NULL
        BEGIN
            RAISERROR('Title is required.', 16, 1);
        END

        IF @Description IS NULL
        BEGIN
            RAISERROR('Description is required.', 16, 1);
        END
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END
        
        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        


        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1);
        END
        
        -- Step 1: ALTER PublishingInformation record
        INSERT INTO dbo.PublishingInformation ( PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
        
        -- Step 2: ALTER Column record
        INSERT INTO dbo.Columns (Title, Description, PublishingInfoID, ProjectID, IsPrivate)
        VALUES (@Title, @Description, @PublishingInfoID, @ProjectID, @IsPrivate);
        
        
        COMMIT TRANSACTION;
            
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddComment]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddComment]
    @MemberID      INT,
    @EventID       INT = NULL,
    @To_DoID       INT = NULL,
    @CardID        INT = NULL,
    @StepID        INT = NULL,
    @MessageID     INT = NULL,
    @DocumentID    INT = NULL,
    @ProjectID     INT,
    @NoteText      NVARCHAR(2000) ,
    @URLLink       NVARCHAR(4000) = NULL
   
       
    
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @NoteID INT;



    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        
        IF  @EventID IS NULL AND @To_DoID IS NULL AND  @CardID  IS NULL AND  @StepID IS NULL AND @MessageID IS NULL AND @DocumentID IS NULL 
        BEGIN
            RAISERROR('Element is required.', 16, 1);
        END

        IF @NoteText IS NULL AND @URLLink IS NULL 
        BEGIN
            RAISERROR('Comment is required.', 16, 1);
        END


        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END

        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
       
        

        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Column does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
        -- Verify EventID exists
        IF @EventID IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE ID = @EventID)
            BEGIN
                RAISERROR('Invalid EventID. Column does not exist.', 16, 1);
            END
        END

        -- Verify To_DoID exists
        IF @To_DoID IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM dbo.To_Dos WHERE ID = @To_DoID)
            BEGIN
                RAISERROR('Invalid To_DoID. Column does not exist.', 16, 1);
            END
        END

        -- Verify CardID exists
        IF @CardID IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID)
            BEGIN
                RAISERROR('Invalid CardID. Column does not exist.', 16, 1);
            END
        END

        -- Verify StepID exists
        IF @StepID IS NOT NULL
            BEGIN
            IF NOT EXISTS (SELECT 1 FROM dbo.Steps WHERE ID = @StepID)
            BEGIN
                RAISERROR('Invalid StepID. Column does not exist.', 16, 1);
            END
        END

        -- Verify MessageID exists
        IF @MessageID IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM dbo.MessageBoards WHERE ID = @MessageID)
            BEGIN
                RAISERROR('Invalid MessageID. Column does not exist.', 16, 1);
            END
        END

        -- Verify DocumentID exists
        IF @DocumentID IS NOT NULL
            BEGIN
            IF NOT EXISTS (SELECT 1 FROM dbo.Documents WHERE ID = @DocumentID)
            BEGIN
                RAISERROR('Invalid DocumentID. Column does not exist.', 16, 1);
            END
        END
        
        
        -- Add PublishingInformation record
        INSERT INTO dbo.PublishingInformation (PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
       
        -- Add Note record

        IF @NoteText IS NOT NULL OR  @URLLink IS NOT NULL
        BEGIN
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @URLLink, @PublishingInfoID, @ProjectID);
            
            SET @NoteID = SCOPE_IDENTITY();
            
           
        END
        
        -- Add Comment record

        INSERT INTO ProjectComments(NoteID, EventID, To_DoID, CardID, StepID, MessageID, DocumentID, ProjectID,PublishingInfoID)
        VALUES (@NoteID, @EventID, @To_DoID, @CardID, @StepID, @MessageID, @DocumentID, @ProjectID, @PublishingInfoID)
       
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddDocument]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddDocument]
    @Name NVARCHAR(100) = NULL,
    @FilePath NVARCHAR(4000),
    @ProjectID INT,
    @MemberID INT,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @NoteID INT = NULL;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        
        IF @FilePath IS NULL OR @FilePath = ''
        BEGIN
            RAISERROR('FileExtension is required for Document.', 16, 1);
        END
        
        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END
        
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
        -- Add PublishingInformation record
        INSERT INTO dbo.PublishingInformation (PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
        -- Add Note record if note text is provided
        IF @NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL
        BEGIN
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PublishingInfoID, @ProjectID);
            
            SET @NoteID = SCOPE_IDENTITY();
            
        END
        
        -- Add Document record
        INSERT INTO dbo.Documents (Name, NoteID, FilePath, PublishingInfoID, ProjectID, IsPrivate)
        VALUES (@Name, @NoteID, @FilePath, @PublishingInfoID, @ProjectID, @IsPrivate);
        
        
        COMMIT TRANSACTION;
        
       
            
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddEvent]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddEvent]
    @Name NVARCHAR(50),
    @ProjectID INT,
    @FromDate DATETIME,
    @ToDate DATETIME,
    @MemberID INT,
    @URLLink NVARCHAR(500) = NULL,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @NoteID INT = NULL;
    DECLARE @ScheduleID INT;

    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
        IF @Name IS NULL OR @Name = ''
        BEGIN
            RAISERROR('Name is required for Event.', 16, 1);
        END
        
        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END

        IF @FromDate IS NULL OR @ToDate IS NULL
        BEGIN
            RAISERROR('Start/End date are required.', 16, 1);
        END
                
        
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
        -- Add PublishingInformation record
        INSERT INTO dbo.PublishingInformation ( PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
        -- Add Note record if note text is provided
        IF @NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL
        BEGIN
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PublishingInfoID, @ProjectID);
            
            SET @NoteID = SCOPE_IDENTITY();       
        END


        -- Add Schedule record

        INSERT INTO Schedules(FromDate,ToDate,ProjectID)
        VALUES (@FromDate, @ToDate, @ProjectID)

        SET @ScheduleID = SCOPE_IDENTITY();

        
        
        -- Add Event record
        INSERT INTO dbo.Events (Name, NoteID, URLLink, PublishingInfoID, ScheduleID, ProjectID, IsPrivate)
        VALUES (@Name, @NoteID, @URLLink, @PublishingInfoID, @ScheduleID, @ProjectID, @IsPrivate);
       
        COMMIT TRANSACTION;
               
            
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddFileToNote]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddFileToNote]
@NoteID INT,
@FilePath NVARCHAR(MAX),
@FileCaption NVARCHAR(100)

AS 

BEGIN

SET NOCOUNT ON;

	DECLARE @ErrorMessage VARCHAR(4000);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;

	BEGIN TRY
		BEGIN TRANSACTION;

		IF @NoteID IS NULL
		BEGIN
			RAISERROR('NoteID is required!', 16, 1)
		END

		IF (SELECT ID FROM Notes WHERE ID = @NoteID) IS NULL
		BEGIN
			RAISERROR('Note does not exist!', 16, 1)
		END

		INSERT INTO Files (NoteID, FilePath, Caption)
		VALUES(@NoteID, @FilePath, @FileCaption)




		COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddInvitation]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_AddInvitation]
    @SenderMemberID      INT,
    @TheInvitedPersonName NVARCHAR(100),
    @MemberOrClient BIT,
    @EmailAddress NVARCHAR(255),
    @JobTitle NVARCHAR(500) = NULL,
    @CompanyName NVARCHAR(500) = NULL,
    @Password NVARCHAR(255),
    @Note NVARCHAR(2000) = NULL,
    @ProjectID INT
       
    
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;   



    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Column does not exist.', 16, 1);
        END



        INSERT INTO PublishingInformation
        ( PublisherID )
        VALUES
        ( @SenderMemberID );

        DECLARE @PublishingInfoID INT = SCOPE_IDENTITY();

        INSERT INTO Invitations
        (
            TheInvitedName,
            Email,
            Text,
            JobTitle,
            CompanyName,
            PublishingInfoID,
            ProjectID,
            Password,
            MemberOrClient,
            StatusID
        )
        VALUES
        (
            
            @TheInvitedPersonName,
            @EmailAddress,
            @Note,
            @JobTitle,
            @CompanyName,
            @PublishingInfoID,
            @ProjectID,
            @Password,
            @MemberOrClient,
            3
        );              
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_AddList]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddList]
@MemberID INT,
@ProjectID INT,
@Title NVARCHAR(50),
@NoteText NVARCHAR(2000) = NULL,
@URLLink NVARCHAR(2000) = NULL,
@IsPrivate BIT

AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NewPubInfoID INT;
    DECLARE @NewNoteID INT;
    BEGIN TRANSACTION
        BEGIN TRY


        IF @ProjectID IS NULL
        BEGIN
             RAISERROR('ProjectID is required', 16, 1)
        END

        IF @MemberID IS NULL
        BEGIN
             RAISERROR('MemberID is required', 16, 1)
        END

        IF @IsPrivate IS NULL
        BEGIN
             RAISERROR('Privacy is required', 16, 1)
        END

        IF NOT EXISTS (SELECT ID FROM Projects WHERE ID = @ProjectID) 
        BEGIN
             RAISERROR('Project does not exist', 16, 1)
        END

        IF NOT EXISTS (SELECT MemberID FROM Assignments WHERE MemberID = @MemberID)
        BEGIN
             RAISERROR('Member does not exist in the project', 16, 1)
        END

        INSERT INTO PublishingInformation(PublisherID)
        VALUES (@MemberID)

            SET @NewPubInfoID = SCOPE_IDENTITY();

        IF @NoteText IS NOT NULL OR @URLLink IS NOT NULL
        BEGIN
             INSERT INTO Notes(Text, URLLink, ProjectID, PublishingInfoID)
             VALUES (@NoteText, @URLLink,@ProjectID,@NewPubInfoID)
             SET @NewNoteID = SCOPE_IDENTITY();
        END


            INSERT INTO Lists(PublishingInfoID, ProjectID, Title, NoteID, IsPrivate)
            VALUES (@NewPubInfoID, @ProjectID, @Title, @NewNoteID, @IsPrivate)

            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH

            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION

                    SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

        END CATCH
            

    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddMember]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddMember]
    @Name NVARCHAR(100),
    @ProjectID INT,
    @Email NVARCHAR(300),
    @Password NVARCHAR(50), 
    @JobTitle NVARCHAR(50) = NULL,
    @CompanyName NVARCHAR(150) = NULL,
    @AdminID INT = NULL 
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check 1 and 2 remain outside the transaction; if they fail, we exit early
    -- without starting the costly transaction.

    -- 1. Check if the email already exists
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        RAISERROR('User email already exists.', 16, 1)
        RETURN
    END

    -- 2. Check if the password already exists (PREVENTS DUPLICATION)
    IF EXISTS (SELECT 1 FROM Users WHERE Password = @Password)
    BEGIN
        RAISERROR('This password is not valid.', 16, 1)
        RETURN
    END

    -------------------------------------------------------------------------
    -- TRANSACTIONAL BLOCK: Ensures both inserts succeed or fail together
    -------------------------------------------------------------------------
    BEGIN TRY
        -- Start the transaction
        BEGIN TRANSACTION;

        -- 3. Insert into Users table
        INSERT INTO Users (Name, Email, Password, JobTitle, CompanyName)
        VALUES (@Name, @Email, @Password, @JobTitle, @CompanyName);

        -- Get the ID of the newly ALTERd User
        DECLARE @NewUserID INT = SCOPE_IDENTITY();

        -- 4. Insert into Members table
        INSERT INTO Members (UserID, AdminID)
        VALUES (@NewUserID, @AdminID)
        DECLARE @NewMemberID INT = SCOPE_IDENTITY();

        -- 4. Insert into Assignment table to join the team
        INSERT INTO Assignments (MemberID,ProjectID)
        VALUES (@NewMemberID,@ProjectID)

        -- Commit the transaction if both inserts were successful
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Check if any transaction is active (due to an error)
        IF @@TRANCOUNT > 0
        BEGIN
            -- Rollback the transaction to undo any changes (e.g., the User insert)
            ROLLBACK TRANSACTION;
        END

        
    END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddMessageToBoard]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddMessageToBoard]
    @ProjectID INT,
    @Title NVARCHAR(50) = NULL,
    @MemberID INT,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @NoteID INT;
   
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END

        IF @NoteText IS NULL OR @NoteURLLink IS NULL
        BEGIN
            RAISERROR('Message content is required.', 16, 1);
        END
        
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
        -- Add PublishingInformation record
        INSERT INTO dbo.PublishingInformation (PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
        -- Add Note record if note text is provided
        IF @NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL
        BEGIN
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PublishingInfoID, @ProjectID);
            
            SET @NoteID = SCOPE_IDENTITY();
            
           
        END
        
        -- Add MessageBoard record
        INSERT INTO dbo.MessageBoards (PublishingInfoID, ProjectID, NoteID, Title, IsPrivate)
        VALUES (@PublishingInfoID, @ProjectID, @NoteID, @Title, @IsPrivate);
        
        
        COMMIT TRANSACTION;
        
       
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddMessageToChat]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddMessageToChat]
    @Text NVARCHAR(4000),
    @ProjectID INT,
    @MemberID INT, -- The user/member publishing the chat
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @PubInfoID INT;
        
        BEGIN TRANSACTION
            BEGIN TRY

                -- 1. Insert into PublishingInformation
                INSERT INTO PublishingInformation(PublisherID)
                VALUES (@MemberID)

                -- Get the ID of the new PublishingInformation record
                SET @PubInfoID  = SCOPE_IDENTITY();

                -- 2. Insert into Chats
                INSERT INTO Chats(Text, ProjectID, PublishingInfoID, IsPrivate)
                VALUES (@Text, @ProjectID, @PubInfoID, @IsPrivate)
        
                COMMIT TRANSACTION
            END TRY

            BEGIN CATCH

            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
                
                SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

            
            END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddProject]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddProject]
    @Name NVARCHAR(100),
    @MemberID INT
AS
BEGIN
    SET NOCOUNT ON;


    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @PubInfo INT;
    DECLARE @NewProjectID INT;
    -- Start the transaction
    BEGIN TRANSACTION
    
    BEGIN TRY
        -- 1. Insert into PublishingInformation
        INSERT INTO PublishingInformation(PublisherID)
        VALUES (@MemberID)

        -- Get the newly generated ID
        SET @PubInfo  = SCOPE_IDENTITY();

        -- 2. Insert into Projects
        INSERT INTO Projects(Name,PublishingInfoID)
        VALUES(@Name,@PubInfo)

        -- Get the newly generated ID
        SET @NewProjectID  = SCOPE_IDENTITY();

        -- 3. Insert into Enrollments
        INSERT INTO Assignments(ProjectID, MemberID)
        VALUES(@NewProjectID, @MemberID);

        -- If all statements succeed, commit the transaction
        COMMIT TRANSACTION
    
    END TRY
    BEGIN CATCH
        -- If any error occurred, check if the transaction is still active
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION   
            
            SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

   
        
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddQuestion]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddQuestion]
    @MemberID INT,
    @ProjectID INT,
    @Text NVARCHAR(2000) = NULL,
    @FromDate DATETIME,
    @ToDate DATETIME,
    @IsPrivate BIT
       
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @ScheduleID INT;

    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END

        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
       
        

        -- Verify ColumnID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Column does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
      
        
        -- Step 1: ALTER PublishingInformation record
        INSERT INTO dbo.PublishingInformation ( PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
       
        -- Step 2: ALTER Schedule record

        INSERT INTO Schedules(FromDate,ToDate,ProjectID)
        VALUES (@FromDate, @ToDate, @ProjectID)

        SET @ScheduleID = SCOPE_IDENTITY();
        
        -- Step 3: ALTER Question record

        INSERT INTO Questions(Text, ScheduleID, ProjectID, PublishingInfoID, IsPrivate)
        VALUES (@Text, @ScheduleID, @ProjectID, @PublishingInfoID, @IsPrivate)
       
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddStepToCard]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddStepToCard]
    @MemberID INT,
    @CardID INT,
    @ProjectID INT,
    @Text NVARCHAR(2000)

        
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
       
        IF @CardID IS NULL
        BEGIN
            RAISERROR('CardID is required.', 16, 1);
        END
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END
        
       
        

        -- Verify ColumnID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID)
        BEGIN
            RAISERROR('Invalid CardID. Column does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
      
        
        -- Step 1: ALTER PublishingInformation record
        INSERT INTO dbo.PublishingInformation ( PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
       
        
        -- Step 2: ALTER Step record
        INSERT INTO dbo.Steps(CardID, Text, PublishingInfoID, IsChecked)
        VALUES (@CardID, @Text, @PublishingInfoID,0);
        
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddTo_DoToList]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddTo_DoToList]
    @Text NVARCHAR(500),
    @ListID INT,
    @MemberID INT,
    @ProjectID INT,
    @FromDate DATETIME = NULL,
    @ToDate DATETIME = NULL,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT
    
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @PublishingInfoID INT;
    DECLARE @NoteID INT = NULL;
    DECLARE @ScheduleID INT = NULL;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
        IF @Text IS NULL OR @Text = ''
        BEGIN
            RAISERROR('Text is required for To_Do.', 16, 1);
        END
        
        IF @ListID IS NULL
        BEGIN
            RAISERROR('ListID is required.', 16, 1);
        END
        
        IF @MemberID IS NULL
        BEGIN
            RAISERROR('PublisherID is required.', 16, 1);
        END
        
        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
        -- Verify ListID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Lists WHERE ID = @ListID)
        BEGIN
            RAISERROR('Invalid ListID. List does not exist.', 16, 1);
        END
        
        -- Verify PublisherID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Members WHERE ID = @MemberID)
        BEGIN
            RAISERROR('Invalid PublisherID. Member does not exist.', 16, 1);
        END
        
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1);
        END
        
        
        
        -- Add PublishingInformation record
        INSERT INTO dbo.PublishingInformation (PublisherID)
        VALUES (@MemberID);
        
        SET @PublishingInfoID = SCOPE_IDENTITY();
        
        -- Add Note record if note text is provided
        IF @NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL
        BEGIN
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PublishingInfoID, @ProjectID);
            
            SET @NoteID = SCOPE_IDENTITY();
           
        END

        -- Add Shedule record if dates were provided
        IF @FromDate IS NOT NULL AND @ToDate IS NOT NULL
        BEGIN
            INSERT INTO Schedules(FromDate,ToDate, ProjectID)
            VALUES (@FromDate, @ToDate, @ProjectID)

            SET @ScheduleID = SCOPE_IDENTITY();

        END
        
        -- Add To_Do record
        INSERT INTO dbo.To_Dos (Text, NoteID, ListID,PublishingInfoID,Checked, ScheduleID, IsPrivate)
        VALUES (@Text, @NoteID, @ListID, @PublishingInfoID, 0, @ScheduleID, @IsPrivate);
        
        
        COMMIT TRANSACTION;
        
        
            
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AnsweringInvitation]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_AnsweringInvitation]
    @InvitationID INT,
    @NewStatusID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NewClientID INT;
    DECLARE @NewUserID INT;
    DECLARE @AdminID INT;
        
    -- 1. Check if the Invitation ID is valid
    IF NOT EXISTS (SELECT 1 FROM Invitations WHERE ID = @InvitationID)
    BEGIN
        RAISERROR('Invitation ID is invalid.', 16, 1);
        RETURN;
    END

    -- 2. Begin the Transaction
    BEGIN TRANSACTION
        BEGIN TRY
            -- Check for StatusID = 1 (Assuming 1 means Accepted)
            IF @NewStatusID = 1
            BEGIN
               
                INSERT INTO Users
                (
                    Name,
                    Email,
                    JobTitle,
                    CompanyName,
                    Password
                )
                SELECT
                    TheInvitedName, 
                    Email,
                    JobTitle,
                    CompanyName,
                    Password
                FROM
                    Invitations
                WHERE
                    ID = @InvitationID; 
                
                SET @NewUserID = SCOPE_IDENTITY();

                -- 2.2. Get the AdminID from the Invitations/PublishingInformation tables
                SELECT 
                    @AdminID = PI.PublisherID 
                FROM 
                    Invitations I
                INNER JOIN 
                    PublishingInformation PI ON I.PublishingInfoID = PI.ID -- Assuming a table named 'PublishingInformation'
                WHERE 
                    I.ID = @InvitationID;

                -- 2.3. Check if the user is a Member (1) or Client (other)
                IF (SELECT MemberOrClient FROM Invitations WHERE ID = @InvitationID) = 1
                BEGIN
                    -- INSERT into Members table
                    INSERT INTO Members
                    ( 
                        UserID, 
                        AdminID 
                    )
                    VALUES
                    ( 
                        @NewUserID, 
                        @AdminID -- Use the variable set in the previous step
                    );
                END
                ELSE
                BEGIN
                    -- INSERT into Clients table
                    INSERT INTO Clients
                    ( UserID )
                    VALUES
                    ( @NewUserID );
                    SET @NewClientID = SCOPE_IDENTITY()

                   INSERT INTO Assignments (ProjectID, ClientID)
                   SELECT ProjectID, @NewClientID
                   FROM Invitations
                   WHERE ID = @InvitationID;

                END
            END
            
            -- 2.4. Finally, update the status on the main invitation record (Crucial Step!)
            UPDATE Invitations
            SET StatusID = @NewStatusID
            WHERE ID = @InvitationID;
        
            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            -- Handle Errors
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            -- Re-raise the error to the calling application
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteAnswer]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================

-- ALTER date: 2025-11-19
-- Description: Deletes an Answer and its associated Note, Files, and Metadata.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteAnswer]
    @AnswerID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NoteID INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. VALIDATION
        IF @AnswerID IS NULL
            RAISERROR('AnswerID is required.', 16, 1);

        IF NOT EXISTS (SELECT 1 FROM dbo.Answers WHERE ID = @AnswerID)
            RAISERROR('Invalid AnswerID. Answer does not exist.', 16, 1);


        -- 2. GATHER ALL IDs (Answer and Note PubInfo)

        DECLARE @AllPubInfoIDs TABLE (ID INT);

        SELECT @NoteID = AnswerID 
        FROM Answers 
        WHERE ID  = @AnswerID

        INSERT INTO @AllPubInfoIDs (ID)
        SELECT PublishingInfoID FROM dbo.Answers WHERE ID = @AnswerID;
        INSERT INTO @AllPubInfoIDs (ID) (SELECT PublishingInfoID FROM Notes WHERE ID = (SELECT AnswerID FROM Answers WHERE ID = @AnswerID))

        -- 3. DELETE DEPENDENCIES (Children)
        -- Delete activities referencing this answer
        DELETE FROM Activities WHERE AnswerID = @AnswerID;
        
        -- Delete files referencing the Note (AnswerID)
        DELETE FROM dbo.Files WHERE NoteID = @NoteID;

        -- 4. DELETE PRIMARY RECORDS
        -- Delete the Answer record first
        DELETE FROM dbo.Answers WHERE ID = @AnswerID;

        -- 5. DELETE THE NOTE

        DELETE FROM dbo.Notes WHERE ID = @NoteID;

        -- 6. FINAL METADATA CLEANUP

        DELETE FROM PublishingInformation 
        WHERE ID IN (SELECT DISTINCT ID FROM @AllPubInfoIDs);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteAssignment]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================

-- ALTER date: 2025-11-19
-- Description: Deletes an Assignment.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteAssignment]
    @AssignmentID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @AssignmentID IS NULL
        BEGIN
            RAISERROR('AssignmentID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Assignments WHERE ID = @AssignmentID)
        BEGIN
            RAISERROR('Invalid AssignmentID. Assignment does not exist.', 16, 1);
        END

        DELETE FROM dbo.Assignments
        WHERE ID = @AssignmentID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCard]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteCard]
    @CardID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NoteIDToDelete INT;
    DECLARE @ScheduleIDToDelete INT;
    DECLARE @CardPubInfoIDToDelete INT;
    DECLARE @NotePubInfoIDToDelete INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Validation
        IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID)
        BEGIN
            RAISERROR('Invalid CardID. Card does not exist.', 16, 1);
        END

        -- 2. Gathering all IDs
        SELECT 
            @NoteIDToDelete = NoteID, 
            @ScheduleIDToDelete = ScheduleID,
            @CardPubInfoIDToDelete = PublishingInfoID
        FROM dbo.Cards
        WHERE ID = @CardID;

        IF @NoteIDToDelete IS NOT NULL
        BEGIN
            SELECT @NotePubInfoIDToDelete = PublishingInfoID
            FROM dbo.Notes
            WHERE ID = @NoteIDToDelete;
        END


        DECLARE @CardsCommentsIDs TABLE (ID INT)
        INSERT INTO @CardsCommentsIDs (ID)  (SELECT ID FROM ProjectComments WHERE CardID = @CardID)

        -- 3. Delete Low-Level Dependencies (Children)
        DELETE FROM Activities WHERE CardID = @CardID;
        
        IF (SELECT ID FROM @CardsCommentsIDs) IS NOT NULL
        BEGIN
            DELETE FROM ProjectComments
            WHERE ID IN (SELECT ID FROM @CardsCommentsIDs)
        END

        -- 4. Delete the Card (Breaks links to Note/Schedule/PubInfo)
        DELETE FROM dbo.Cards WHERE ID = @CardID;

        -- 5. Delete the Note and its Files
        IF @NoteIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Files WHERE NoteID = @NoteIDToDelete;
            DELETE FROM dbo.Notes WHERE ID = @NoteIDToDelete;
        END

        -- 6. Clean up Metadata (ONLY if no one else is using them)
        -- Check Card's PubInfo
        IF @CardPubInfoIDToDelete IS NOT NULL
           AND NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE PublishingInfoID = @CardPubInfoIDToDelete)
           AND NOT EXISTS (SELECT 1 FROM dbo.Notes WHERE PublishingInfoID = @CardPubInfoIDToDelete)
        BEGIN
            DELETE FROM PublishingInformation WHERE ID = @CardPubInfoIDToDelete;
        END

        -- Check Note's PubInfo (if different from Card's)
        IF @NotePubInfoIDToDelete IS NOT NULL 
           AND @NotePubInfoIDToDelete <> ISNULL(@CardPubInfoIDToDelete, -1)
           AND NOT EXISTS (SELECT 1 FROM dbo.Notes WHERE PublishingInfoID = @NotePubInfoIDToDelete)
           AND NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE PublishingInfoID = @NotePubInfoIDToDelete)
        BEGIN
            DELETE FROM PublishingInformation WHERE ID = @NotePubInfoIDToDelete;
        END

        -- 7. Delete Schedule (ONLY if no other card is using it)
        IF @ScheduleIDToDelete IS NOT NULL
           AND NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ScheduleID = @ScheduleIDToDelete)
        BEGIN
            DELETE FROM dbo.Schedules WHERE ID = @ScheduleIDToDelete;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteColumn]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================

-- ALTER date: 2025-11-19
-- Description: Deletes a Column.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteColumn]
    @ColumnID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
        BEGIN TRANSACTION;


        DECLARE @ColumnPubInfoID INT ;

        DECLARE @CardPubInfoIDToDelete INT;
        DECLARE @CardNoteIDToDelete INT;
        DECLARE @CardScheduleIDToDelete INT;

        DECLARE @StepPubInfoIDToDelete INT;

        IF @ColumnID IS NULL
        BEGIN
            RAISERROR('ColumnID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Columns WHERE ID = @ColumnID)
        BEGIN
            RAISERROR('Invalid ColumnID. Column does not exist.', 16, 1);
        END
        

         SELECT @ColumnPubInfoID = PublishingInfoID
        FROM Columns
        WHERE ID = @ColumnID;

        -- Gather all related CardIDs with the given Column to delete
        DECLARE @CardIDs TABLE (ID INT);
        INSERT INTO @CardIDs SELECT ID FROM Cards WHERE ColumnID = @ColumnID;


        -- Gather all StepIDs that belong to the related Cards with the given Column to delete
        DECLARE @StepIDs TABLE (ID INT);
        INSERT INTO @StepIDs SELECT ID FROM Steps WHERE CardID IN (SELECT ID FROM @CardIDs);



        DECLARE @NoteIDs TABLE (ID INT);
        INSERT INTO @NoteIDs SELECT NoteID FROM Cards WHERE ID IN (SELECT ID FROM @CardIDs) AND NoteID IS NOT NULL;
        INSERT INTO @NoteIDs SELECT NoteID FROM ProjectComments WHERE CardID IN (SELECT ID FROM @CardIDs);

        -- Gather all Metadata IDs for final cleanup
        DECLARE @PubInfoIDs TABLE (ID INT);
        INSERT INTO @PubInfoIDs SELECT PublishingInfoID FROM Cards   WHERE ID IN (SELECT ID FROM @CardIDs);
        INSERT INTO @PubInfoIDs SELECT PublishingInfoID FROM Steps   WHERE CardID IN (SELECT ID FROM @CardIDs);
        INSERT INTO @PubInfoIDs SELECT PublishingInfoID FROM Notes   WHERE ID IN (SELECT ID FROM @NoteIDs);
        INSERT INTO @PubInfoIDs SELECT PublishingInfoID FROM Columns WHERE ID = @ColumnID;

        INSERT INTO @NoteIDs (ID) (SELECT ID FROM Notes WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs))


        DECLARE @ScheduleIDs TABLE (ID INT);
        INSERT INTO @ScheduleIDs SELECT ScheduleID FROM Cards WHERE ID IN (SELECT ID FROM @CardIDs) AND ScheduleID IS NOT NULL;

        
        -- Delete all cards comments
        DELETE FROM ProjectComments
        WHERE CardID IN (SELECT ID FROM @CardIDs)

        -- Delete all activities 
        DELETE FROM Activities
        WHERE CardID IN (SELECT ID FROM @CardIDs)

        -- Delete all notes files (child table)
        DELETE FROM Files
        WHERE NoteID IN (SELECT ID FROM @NoteIDs)

        -- Delete all Steps
        DELETE FROM Steps
        WHERE ID IN (SELECT ID FROM @StepIDs)
        ----------------------------------------------------------------------------------------------

        -- Cards Deletion Proccess
        
        DELETE FROM Cards 
        WHERE ColumnID = @ColumnID
      
        ----------------------------------------------------------------------------------------------

        -- Column Deletion Process

        DELETE FROM dbo.Columns
        WHERE ID = @ColumnID;

       -- Final Metadata Cleanup
        
        DELETE FROM Notes WHERE ID IN (SELECT ID FROM @NoteIDs);
        DELETE FROM Schedules WHERE ID IN (SELECT ID FROM @ScheduleIDs);
        DELETE FROM PublishingInformation WHERE ID IN (SELECT ID FROM @PubInfoIDs);
      
       
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteComment]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteComment]
    @CommentID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NoteIDToDelete INT;
    DECLARE @PubInfoIDToDelete INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Validation
        IF @CommentID IS NULL
            RAISERROR('CommentID is required.', 16, 1);

        IF NOT EXISTS (SELECT 1 FROM ProjectComments WHERE ID = @CommentID)
            RAISERROR('Invalid CommentID. Comment does not exist.', 16, 1);

        -- 2. Gathering IDs
        SELECT @NoteIDToDelete = NoteID, 
               @PubInfoIDToDelete = PublishingInfoID 
        FROM dbo.ProjectComments
        WHERE ID = @CommentID;

        -- 3. DELETE CHILD RECORDS FIRST
        -- Delete activities that point to this specific comment
        DELETE FROM Activities WHERE CommentID = @CommentID; 

        -- 4. DELETE THE COMMENT
        DELETE FROM dbo.ProjectComments WHERE ID = @CommentID;

        -- 5. DELETE THE NOTE AND FILES
        IF @NoteIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Files WHERE NoteID = @NoteIDToDelete;
            DELETE FROM dbo.Notes WHERE ID = @NoteIDToDelete;
        END

        

            DELETE FROM Activities WHERE PublishingInfoID = @PubInfoIDToDelete;

            DELETE FROM PublishingInformation WHERE ID = @PubInfoIDToDelete;
        

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteDocument]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================

-- ALTER date: 2025-11-19
-- Description: Deletes a Document and its associated Note and Files.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteDocument]
    @DocumentID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NoteIDToDelete INT;
    DECLARE @PubInfoIDToDelete INT;
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @DocumentID IS NULL
        BEGIN
            RAISERROR('DocumentID is required.', 16, 1);
        END

         IF NOT EXISTS (SELECT 1 FROM dbo.Documents WHERE ID = @DocumentID)
        BEGIN
            RAISERROR('Invalid DocumentID. Document does not exist.', 16, 1);
        END

        DECLARE @DocCommentIDs TABLE (ID INT);
        INSERT INTO @DocCommentIDs (ID) (SELECT ID FROM ProjectComments WHERE DocumentID = @DocumentID)
       
        SELECT @NoteIDToDelete = NoteID, @PubInfoIDToDelete = PublishingInfoID
        FROM dbo.Documents
        WHERE ID = @DocumentID;

        DECLARE @PubInfoIDs TABLE (ID INT);
        INSERT INTO @PubInfoIDs (ID) 
        (SELECT PublishingInfoID 
        FROM ProjectComments 
        WHERE DocumentID = @DocumentID)
         
        INSERT INTO @PubInfoIDs (ID) 
        (SELECT PublishingInfoID 
        FROM Notes
        WHERE ID = @NoteIDToDelete)

        INSERT INTO @PubInfoIDs (ID) 
        (SELECT PublishingInfoID 
        FROM ProjectComments
        WHERE ID IN (SELECT ID FROM @DocCommentIDs) )

        INSERT INTO @PubInfoIDs (ID) 
        (SELECT PublishingInfoID 
        FROM Activities
        WHERE DocumentID = @DocumentID )
         

        DELETE FROM Activities
        WHERE DocumentID = @DocumentID

        IF (SELECT ID FROM @DocCommentIDs) IS NOT NULL
        BEGIN
            DELETE FROM ProjectComments
            WHERE ID IN (SELECT ID FROM @DocCommentIDs)
        END

        DELETE FROM dbo.Documents
        WHERE ID = @DocumentID;


        
        

        IF @NoteIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Files WHERE NoteID = @NoteIDToDelete;
            DELETE FROM dbo.Notes WHERE ID = @NoteIDToDelete;
        END

        DELETE FROM PublishingInformation
        Where ID IN (SELECT ID FROM @PubInfoIDs)

        
            
        

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteEvent]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Basecamp Database Team
-- ALTER date: 2025-11-19
-- Description: Deletes an Event and its associated Schedule, Note, and Files.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteEvent]
    @EventID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NoteIDToDelete INT;
    DECLARE @ScheduleIDToDelete INT;
    DECLARE @PubInfoIDToDelete INT;


    BEGIN TRY
        BEGIN TRANSACTION;

        IF @EventID IS NULL
        BEGIN
            RAISERROR('EventID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE ID = @EventID)
        BEGIN
            RAISERROR('Invalid EventID. Event does not exist.', 16, 1);
        END

        SELECT @NoteIDToDelete = NoteID, @ScheduleIDToDelete = ScheduleID, @PubInfoIDToDelete = PublishingInfoID
        FROM dbo.Events
        WHERE ID = @EventID;

        DECLARE @EventCommentIDs TABLE (ID INT);
        INSERT INTO @EventCommentIDs (ID) (SELECT ID FROM ProjectComments WHERE EventID = @EventID)
       

        
        DELETE FROM Activities
        WHERE EventID = @EventID

        IF (SELECT ID FROM @EventCommentIDs) IS NOT NULL
        BEGIN
            DELETE FROM ProjectComments
            WHERE ID IN (SELECT ID FROM @EventCommentIDs)
        END

        DELETE FROM dbo.Events
        WHERE ID = @EventID;

        DELETE FROM PublishingInformation
        Where ID = @PubInfoIDToDelete


        IF @NoteIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Files WHERE NoteID = @NoteIDToDelete;
            DELETE FROM dbo.Notes WHERE ID = @NoteIDToDelete;
        END

        DELETE FROM dbo.Schedules WHERE ID = @ScheduleIDToDelete;

        

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteFileFromNote]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteFileFromNote]
@FileID INT

AS 
BEGIN

SET NOCOUNT ON;

	DECLARE @ErrorMessage VARCHAR(4000);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;

	BEGIN TRY
		BEGIN TRANSACTION;

		IF @FileID IS NULL
		BEGIN
			RAISERROR('FileID is required!', 16, 1)
		END

		IF (SELECT ID FROM Files WHERE ID = @FileID) IS NULL
		BEGIN
			RAISERROR('File does not exist!', 16, 1)
		END

		
		DELETE FROM Files
		WHERE ID = @FileID;
	



		COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteInvitation]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DeleteInvitation]
    @InvitationID INT,
    @ProjectID INT
       
    
AS
BEGIN
    SET NOCOUNT ON;

   
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;   

    DECLARE @PubInfoIDToDelete INT;

    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validate required parameters
        IF @ProjectID IS NULL
        BEGIN
            RAISERROR('ProjectID is required.', 16, 1);
        END
        
        -- Verify ProjectID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID)
        BEGIN
            RAISERROR('Invalid ProjectID. Column does not exist.', 16, 1);
        END

        

        DELETE FROM Invitations
        WHERE ID = @InvitationID AND ProjectID = @ProjectID

        DELETE FROM PublishingInformation
        WHERE ID = (SELECT PublishingInfoID FROM Invitations WHERE ID = @InvitationID)
       
              
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteList]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Basecamp Database Team
-- ALTER date: 2025-11-19
-- Description: Deletes a List and its associated Note and Files.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteList]
    @ListID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @ListNoteIDToDelete INT;
    DECLARE @ListPubInfoIDToDelete INT;

    DECLARE @To_DoNoteIDToDelete INT;
    DECLARE @To_DoPubInfoIDToDelete INT

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @ListID IS NULL
        BEGIN
            RAISERROR('ListID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Lists WHERE ID = @ListID)
        BEGIN
            RAISERROR('Invalid ListID. List does not exist.', 16, 1);
        END

        SELECT @ListNoteIDToDelete = NoteID, @ListPubInfoIDToDelete = PublishingInfoID
        FROM dbo.Lists
        WHERE ID = @ListID;

         


        -- Gather All NoteIDs, PubInfoIDs And ScheduleIDs Of The To_Dos That Belong To The Given List
        -- To Delete Them Once

        DECLARE @To_DoNotesIDs TABLE ( ID INT);
        INSERT INTO @To_DoNotesIDs (ID) SELECT NoteID FROM To_Dos WHERE ListID = @ListID

        DECLARE @To_DoPubInfoIDs TABLE ( ID INT);
        INSERT INTO @To_DoPubInfoIDs (ID) SELECT PublishingInfoID FROM To_Dos WHERE ListID = @ListID

        
        DECLARE @To_DoScheduleIDs TABLE ( ID INT);
        INSERT INTO @To_DoScheduleIDs (ID) SELECT ScheduleID FROM To_Dos WHERE ListID = @ListID

        ----------------------------------------------------------------------------------------------
    
        -- To_Dos Deletion Proccess

        DELETE FROM To_Dos 
        WHERE ListID = @ListID;

        IF (SELECT ID FROM @To_DoNotesIDs) IS NOT NULL
        BEGIN
             DELETE FROM Files
             WHERE NoteID IN ( SELECT ID FROM  @To_DoNotesIDs)
             
             DELETE FROM Notes
             WHERE ID IN ( SELECT ID FROM  @To_DoNotesIDs)
        END

        DELETE FROM PublishingInformation
        WHERE ID IN ( SELECT ID FROM  @To_DoPubInfoIDs)

        DELETE FROM Schedules
        WHERE ID IN ( SELECT ID FROM  @To_DoScheduleIDs)

        ----------------------------------------------------------------------------

        -- List Deletion Proccess
        

        DELETE FROM dbo.Lists
        WHERE ID = @ListID;

        IF @ListNoteIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Files WHERE NoteID = @ListNoteIDToDelete;
            DELETE FROM dbo.Notes WHERE ID = @ListNoteIDToDelete;
        END

        DELETE FROM PublishingInformation
        WHERE ID = @ListPubInfoIDToDelete

   

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteMember]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DeleteMember]
    @MemberID INT,
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;
    SELECT @UserID = UserID FROM Members WHERE ID = @MemberID;

    IF @UserID IS NULL
    BEGIN
        RAISERROR('Member record not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;
        
        
        DECLARE @PubInfoIDs TABLE (ID INT) 
        INSERT INTO @PubInfoIDs (ID) SELECT ID FROM PublishingInformation WHERE PublisherID = @MemberID
        UNION ALL
        SELECT PublishingInfoID FROM Projects 
        INNER JOIN PublishingInformation AS P ON Projects.PublishingInfoID = P.ID
        WHERE P.PublisherID = @MemberID;

        -- Identify Schedules to delete
        DECLARE @ScheduleIDs TABLE (ID INT) 
        INSERT INTO @ScheduleIDs (ID) 
        SELECT ScheduleID FROM Events 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs) 
        
        UNION ALL
        SELECT ScheduleID FROM Questions 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs) 

        UNION ALL
        SELECT ScheduleID FROM To_Dos 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs) AND ScheduleID IS NOT NULL

        UNION ALL
        SELECT ScheduleID FROM Cards 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs) AND ScheduleID IS NOT NULL;

        -- Identify ALL Notes created by this member
        DECLARE @MemberNoteIDs TABLE (ID INT)
        INSERT INTO @MemberNoteIDs (ID) 
        SELECT ID FROM Notes WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        -- CLEANUP CHILD TABLES (Order matters for Foreign Keys)
        
        DELETE FROM Activities
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Assignments WHERE MemberID = @MemberID;

       
        -- Delete Files attached to these Notes
        DELETE FROM Files WHERE NoteID IN (SELECT ID FROM @MemberNoteIDs);

        -- Delete the main entities
        DELETE FROM ProjectComments 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM MessageBoards 
        WHERE NoteID IN (SELECT ID FROM @MemberNoteIDs);

        DELETE FROM Events 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM To_Dos 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Lists 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Answers 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Questions 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Steps 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Cards
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Columns 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Documents 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        DELETE FROM Chats 
        WHERE PublishingInfoID IN (SELECT ID FROM @PubInfoIDs);

        -- DELETE SYSTEM-LEVEL RECORDS
        DELETE FROM Schedules WHERE ID IN (SELECT ID FROM @ScheduleIDs);
        DELETE FROM Notes WHERE ID IN (SELECT ID FROM @MemberNoteIDs);
        
        -- Delete the Member AND PubInfo

        -- Make the PubInfoID Null so we don't need to delete
        -- the record from the Projects table

        UPDATE Projects 
        SET PublishingInfoID = NULL
        WHERE ID = @ProjectID 

        DELETE FROM PublishingInformation 
        WHERE ID IN (SELECT ID FROM @PubInfoIDs) 

        DELETE FROM Members 
        WHERE ID = @MemberID;

        DELETE FROM Users 
        WHERE ID = @UserID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrMsg, 16, 1);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteMessageFromChat]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Basecamp Database Team
-- ALTER date: 2025-11-19
-- Description: Deletes a Chat.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteMessageFromChat]
    @ChatID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @ChatID IS NULL
        BEGIN
            RAISERROR('ChatID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Chats WHERE ID = @ChatID)
        BEGIN
            RAISERROR('Invalid ChatID. Chat does not exist.', 16, 1);
        END

        DELETE FROM Activities
        WHERE @ChatID = @ChatID

        DELETE FROM dbo.Chats
        WHERE ID = @ChatID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteMessageInBoard]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================

-- ALTER date: 2025-11-19
-- Description: Deletes a MessageBoard and its associated Note and Files.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteMessageInBoard]
    @MessageBoardID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NoteIDToDelete INT;
    DECLARE @PubInfoIDToDelete INT;


    BEGIN TRY
        BEGIN TRANSACTION;

        IF @MessageBoardID IS NULL
        BEGIN
            RAISERROR('MessageBoardID is required.', 16, 1);
        END

        -- Check for existence and get the associated NoteID

        IF NOT EXISTS (SELECT 1 FROM dbo.MessageBoards WHERE ID = @MessageBoardID)
        BEGIN
            RAISERROR('Invalid MessageBoardID. MessageBoard does not exist.', 16, 1);
        END


        SELECT @NoteIDToDelete = NoteID, @PubInfoIDToDelete = PublishingInfoID
        FROM dbo.MessageBoards
        WHERE ID = @MessageBoardID;
        
         DECLARE @MessageCommentIDs TABLE (ID INT);
        INSERT INTO @MessageCommentIDs (ID) (SELECT ID FROM ProjectComments WHERE MessageID = @MessageBoardID)
       
        DELETE FROM Activities 
        WHERE MessageID = @MessageBoardID

         IF (SELECT ID FROM @MessageCommentIDs) IS NOT NULL
        BEGIN
            DELETE FROM ProjectComments
            WHERE ID IN (SELECT ID FROM @MessageCommentIDs)
        END

        -- Delete the MessageBoard first
        DELETE FROM dbo.MessageBoards
        WHERE ID = @MessageBoardID;


        


        -- If a Note was associated, delete it and its files
        IF @NoteIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Files WHERE NoteID = @NoteIDToDelete;
            DELETE FROM dbo.Notes WHERE ID = @NoteIDToDelete;
        END

        DELETE FROM PublishingInformation
        Where ID = @PubInfoIDToDelete


        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_DeleteNote]
    @NoteID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @ListNoteIDToDelete INT;
    DECLARE @ListPubInfoIDToDelete INT;

    DECLARE @To_DoNoteIDToDelete INT;
    DECLARE @To_DoPubInfoIDToDelete INT

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @NoteID IS NULL
        BEGIN
            RAISERROR('NoteID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Notes WHERE ID = @NoteID)
        BEGIN
            RAISERROR('Invalid NoteID. Note does not exist.', 16, 1);
        END

        DELETE FROM Files 
        WHERE NoteID = @NoteID

        DELETE FROM Notes
        WHERE ID = @NoteID

         
   

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteProject]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DeleteProject]
    @ProjectID INT
AS
BEGIN

DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    -- Check if the project exists
    IF NOT EXISTS (SELECT 1 FROM Projects WHERE ID = @ProjectID)
    BEGIN
        RAISERROR ('Project with ID %d not found. Nothing deleted.', 16, 1, @ProjectID);
        RETURN;
    END

    -- Start the transaction for atomicity
    BEGIN TRANSACTION
        
    BEGIN TRY
        -- 1. FETCH IDs for Cascading Deletions
        
        DECLARE @ListIDs TABLE (ID INT);
        INSERT INTO @ListIDs (ID) SELECT ID FROM Lists WHERE ProjectID = @ProjectID;

        DECLARE @ColumnIDs TABLE (ID INT);
        INSERT INTO @ColumnIDs (ID) SELECT ID FROM Columns WHERE ProjectID = @ProjectID;

        DECLARE @CardIDs TABLE (ID INT);
        INSERT INTO @CardIDs (ID) SELECT ID FROM Cards WHERE ColumnID IN (SELECT ID FROM @ColumnIDs);

        DECLARE @CommentIDs TABLE (ID INT);
        INSERT INTO @CommentIDs (ID) SELECT ID FROM ProjectComments WHERE ProjectID = @ProjectID;

        
        

        -- Gather all PublishingInfo IDs.
        DECLARE @PubInfoIDs TABLE (ID INT) ;
        INSERT INTO @PubInfoIDs (ID) 
        
        SELECT ID FROM PublishingInformation WHERE ProjectID = @ProjectID;


        -- Gather all Activity IDs
        DECLARE @ActivityIDs TABLE (ID INT)
        INSERT INTO @ActivityIDs (ID)

        SELECT ID FROM Activities WHERE ProjectID = @ProjectID;


        -- Gather all Notes IDs.
        DECLARE @NoteIDs TABLE (ID INT);
        INSERT INTO @NoteIDs (ID) 
        
        SELECT ID FROM Notes WHERE ProjectID = @ProjectID 

        -- Gather all Schedule IDs
        DECLARE @ScheduleIDs TABLE (ID INT)
        INSERT INTO @ScheduleIDs (ID)

        SELECT ID FROM Schedules 
        WHERE ProjectID = @ProjectID;

        ----------------------------------------------------------------------
        -- 2. DEEPEST DEPENDENCIES (Files, Assignments, Steps, Subscriptions)
        ----------------------------------------------------------------------
        

         DELETE FROM Activities
        WHERE ID IN (SELECT ID FROM @ActivityIDs);

        -- Delete from Assignments (linked to Cards, Documents)
        DELETE FROM Assignments
        WHERE ID IN (SELECT ProjectID = @ProjectID);
           
        -- Delete Files based on their direct links AND their link to the project's Notes
        DELETE FROM Files
        WHERE NoteID IN (SELECT ID FROM @NoteIDs); -- Files linked to project Notes

        -- deletion starts with these 4 tables becuase they have 
        -- the child record of the assignments

        -- Delete from To_Dos (Uses the @ListIDs table variable)
        DELETE FROM To_Dos
        WHERE ListID IN (SELECT ID FROM @ListIDs);

        -- Delete from Questions
        DELETE FROM Questions
        WHERE ProjectID = @ProjectID;

        -- Delete from Events
        DELETE FROM Events
        WHERE ProjectID = @ProjectID;

        -- Delete from Steps (linked ONLY to Cards)
        DELETE FROM Steps
        WHERE CardID IN (SELECT ID FROM @CardIDs);

        
        -- Delete Subscriptions linked to Comments
        DELETE FROM CommentSubscriptions
        WHERE CommentID IN (SELECT ID FROM @CommentIDs);

       

        DELETE FROM Invitations 
        WHERE ProjectID = @ProjectID;
        --------------------------------------------------
        -- 3. PROJECT COMPONENTS (Deleting these allows Notes to be deleted next)
        --------------------------------------------------

        -- Delete from Comments
        DELETE FROM ProjectComments
        WHERE ProjectID = @ProjectID;
        
        -- Delete from Cards (Must happen before Columns)
        DELETE FROM Cards
        WHERE ColumnID IN (SELECT ID FROM @ColumnIDs);

        -- Delete from Columns
        DELETE FROM Columns
        WHERE ProjectID = @ProjectID;

        -- Delete from Documents
        DELETE FROM Documents
        WHERE ProjectID = @ProjectID;

        -- Delete from Lists (Must happen after To_Dos)
        DELETE FROM Lists
        WHERE ProjectID = @ProjectID;

        -- Delete from MessageBoards
        DELETE FROM MessageBoards
        WHERE ProjectID = @ProjectID;

        -- Delete from Chats
        DELETE FROM Chats
        WHERE ProjectID = @ProjectID;

        
        -- *** Delete Notes (Now safe, as all referencing components are gone) ***
        DELETE FROM Notes
        WHERE ID IN (SELECT ID FROM @NoteIDs);

        -- Delete Schedules
        DELETE FROM Schedules
        WHERE ID IN (SELECT ID FROM @ScheduleIDs);

       
        -- Delete from Invitations
        DELETE FROM Invitations
        WHERE ProjectID = @ProjectID;

        


        --------------------------------------------------
        -- 4. CORE PROJECT RECORDS
        --------------------------------------------------

        
        -- Delete the project itself
        DELETE FROM Projects
        WHERE ID = @ProjectID;

        -- Delete the associated publishing record
        DELETE FROM PublishingInformation
        WHERE ID IN (SELECT ID FROM @PubInfoIDs);

        -- Commit if everything succeeded
        COMMIT TRANSACTION
    
    END TRY
    BEGIN CATCH
        -- Rollback if an error occurred
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION

            SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteQuestion]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- ALTER date: 2025-11-19
-- Description: Deletes a Question and its associated Schedule.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteQuestion]
    @QuestionID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @ScheduleIDToDelete INT;
    DECLARE @PubInfoIDToDelete INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @QuestionID IS NULL
        BEGIN
            RAISERROR('QuestionID is required.', 16, 1);
        END

        SELECT @ScheduleIDToDelete = ScheduleID, @PubInfoIDToDelete = PublishingInfoID
        FROM dbo.Questions
        WHERE ID = @QuestionID;



        IF @ScheduleIDToDelete IS NULL AND NOT EXISTS (SELECT 1 FROM dbo.Questions WHERE ID = @QuestionID)
        BEGIN
            RAISERROR('Invalid QuestionID. Question does not exist.', 16, 1);
        END


        DELETE FROM Activities
        WHERE QuestionID = @QuestionID

        DELETE FROM dbo.Questions
        WHERE ID = @QuestionID;

        
        DELETE FROM dbo.Schedules 
        WHERE ID = @ScheduleIDToDelete;

        DELETE FROM PublishingInformation 
        WHERE ID = @PubInfoIDToDelete
        

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteStep]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- ALTER date: 2025-11-19
-- Description: Deletes a Step.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteStep]
    @StepID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @PubInfoIDToDelete INT;

    BEGIN TRY
        BEGIN TRANSACTION;


        

        IF @StepID IS NULL
        BEGIN
            RAISERROR('StepID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Steps WHERE ID = @StepID)
        BEGIN
            RAISERROR('Invalid StepID. Step does not exist.', 16, 1);
        END

        SELECT @PubInfoIDToDelete = PublishingInfoID 
        FROM Steps
        WHERE ID = @StepID

         DECLARE @StepCommentIDs TABLE (ID INT);
        INSERT INTO @StepCommentIDs (ID) (SELECT ID FROM ProjectComments WHERE StepID = @StepID)
       

        DELETE FROM Activities
        WHERE StepID = @StepID

        DELETE FROM dbo.Steps
        WHERE ID = @StepID;

        DELETE FROM PublishingInformation
        WHERE ID = @PubInfoIDToDelete

        IF (SELECT ID FROM @StepCommentIDs) IS NULL
        BEGIN
            DELETE FROM ProjectComments
            WHERE ID IN (SELECT ID FROM @StepCommentIDs)
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteTo_Do]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================

-- ALTER date: 2025-11-19
-- Description: Deletes a To_Do and its associated Schedule, Note, and Files.
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteTo_Do]
    @To_DoID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @NoteIDToDelete INT;
    DECLARE @ScheduleIDToDelete INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @To_DoID IS NULL
        BEGIN
            RAISERROR('To_DoID is required.', 16, 1);
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.To_Dos WHERE ID = @To_DoID)
        BEGIN
            RAISERROR('Invalid To_DoID. To_Do does not exist.', 16, 1);
        END

        SELECT @NoteIDToDelete = NoteID, @ScheduleIDToDelete = ScheduleID
        FROM dbo.To_Dos
        WHERE ID = @To_DoID;

        
        DECLARE @To_DoCommentIDs TABLE (ID INT);
        INSERT INTO @To_DoCommentIDs (ID) (SELECT ID FROM ProjectComments WHERE To_DoID = @To_DoID)
        
        DELETE FROM Activities
        WHERE To_DoID = @To_DoID

        IF (SELECT ID FROM @To_DoCommentIDs) IS NOT NULL
        BEGIN
            DELETE FROM ProjectComments
            WHERE ID IN (SELECT ID FROM @To_DoCommentIDs)
        END

        DELETE FROM dbo.To_Dos
        WHERE ID = @To_DoID;

        IF @NoteIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Files WHERE NoteID = @NoteIDToDelete;
            DELETE FROM dbo.Notes WHERE ID = @NoteIDToDelete;
        END

        IF @ScheduleIDToDelete IS NOT NULL
        BEGIN
            DELETE FROM dbo.Schedules WHERE ID = @ScheduleIDToDelete;
        END


        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetActivityByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 17. Get Activity By ProjectID
CREATE PROCEDURE [dbo].[SP_GetActivityByProjectID]
@ProjectID INT
AS 
BEGIN
    SET NOCOUNT ON;

    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) 
    BEGIN 
        RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) 
        RETURN 
    END

    SELECT *, DATENAME(WEEKDAY ,PublishedAt) AS ActivityDay 
    FROM VW_ActivityByProjectID 
    WHERE ProjectID = @ProjectID
    ORDER BY PublishedAt DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetAnswerByQuestionID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 14. Get Answer By QuestionID
CREATE PROCEDURE [dbo].[SP_GetAnswerByQuestionID]
@QuestionID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @QuestionID IS NULL BEGIN RAISERROR('QuestionID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Questions WHERE ID = @QuestionID) BEGIN RAISERROR('Invalid QuestionID. Question does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_AnswerViewByQuestionID 
    WHERE QuestionID = @QuestionID
    ORDER BY PublishedAt DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetAssignmentByElementID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 19. Get Assignment By Mixed ID
CREATE PROCEDURE [dbo].[SP_GetAssignmentByElementID]
@EventID INT = NULL,
@To_DoID INT = NULL,
@StepID INT = NULL,
@QuestionID INT = NULL,
@CardID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @EventID IS NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @QuestionID IS NULL AND @CardID IS NULL
    BEGIN
        RAISERROR('At least one ID parameter is required', 16, 1) 
        RETURN
    END

    IF @CardID IS NOT NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @QuestionID IS NULL AND @EventID IS NULL 
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID) 
      BEGIN 
          RAISERROR('Invalid CardID. Card does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_AssignmentViewByElementID
        WHERE CardID = @CardID
      END
      END

      IF @EventID IS NOT NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @QuestionID IS NULL AND @CardID IS NULL 
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE ID = @EventID) 
      BEGIN 
          RAISERROR('Invalid EventID. Event does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_AssignmentViewByElementID
        WHERE EventID = @EventID
      END
      END

      IF @To_DoID IS NOT NULL AND @CardID IS NULL AND @StepID IS NULL AND @QuestionID IS NULL AND @EventID IS NULL 
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.To_Dos WHERE ID = @To_DoID) 
      BEGIN 
          RAISERROR('Invalid To_DoID. To_Do does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_AssignmentViewByElementID
        WHERE To_DoID = @To_DoID
      END
      END

      IF @StepID IS NOT NULL AND @To_DoID IS NULL AND @CardID IS NULL AND @QuestionID IS NULL AND @EventID IS NULL
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.Steps WHERE ID = @StepID) 
      BEGIN 
          RAISERROR('Invalid StepID. Step does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_AssignmentViewByElementID
        WHERE StepID = @StepID
      END
      END

      

      IF @QuestionID IS NOT NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @CardID IS NULL AND @EventID IS NULL
      BEGIN

      IF NOT EXISTS (SELECT 1 FROM dbo.Questions WHERE ID = @QuestionID) 
      BEGIN 
          RAISERROR('Invalid QuestionID. Question does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_AssignmentViewByElementID
        WHERE @QuestionID = @QuestionID
      END
      END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetCardByCardID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 16. Get Card By CardID
CREATE PROCEDURE [dbo].[SP_GetCardByCardID]
@CardID INT
AS 
BEGIN
    SET NOCOUNT ON;
    IF @CardID IS NULL BEGIN RAISERROR('CardID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID) BEGIN RAISERROR('Invalid CardID. Card does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_CardViewByCardID WHERE CardID = @CardID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetCardsByColumnID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCardsByColumnID]
    @ColumnID INT,
    @MemberOrClient BIT
AS 
BEGIN
    SET NOCOUNT ON;
    IF @ColumnID IS NULL 
    BEGIN 
        RAISERROR('ColumnID is required', 16, 1) 
        RETURN 
    END
    IF NOT EXISTS (SELECT 1 FROM dbo.Columns WHERE ID = @ColumnID) 
    BEGIN 
        RAISERROR('Invalid ColumnID. Column does not exist.', 16, 1) 
        RETURN 
    END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_CardViewByColumnID 
        WHERE ColumnID = @ColumnID
        ORDER BY PublishedAt DESC
    END
    ELSE
    BEGIN
        SELECT * FROM VW_CardViewByColumnID 
        WHERE ColumnID = @ColumnID AND IsPrivate = 0
        ORDER BY PublishedAt DESC
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetChatByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 9. Get Chat By ProjectID
CREATE PROCEDURE [dbo].[SP_GetChatByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_ChatViewByProjectID 
        WHERE ProjectID = @ProjectID
        ORDER BY PublishedAt DESC
    END
    ELSE
    BEGIN
        SELECT * FROM VW_ChatViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
        ORDER BY PublishedAt DESC
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetClientByClientID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetClientByClientID]
    @ClientID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

   
        
    IF NOT EXISTS (SELECT 1 FROM Members WHERE ID = @ClientID)
    BEGIN
        RAISERROR('Member ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_Client
        WHERE ClientID = @ClientID

            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetColumnByColumnID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetColumnByColumnID]
    @ColumnID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ColumnID IS NULL 
    BEGIN 
    RAISERROR('ProjectID is required', 16, 1) 
    RETURN 
    END

    IF NOT EXISTS (SELECT 1 FROM dbo.Columns WHERE ID = @ColumnID) 
    BEGIN 
    RAISERROR('Invalid ColumnID. Project does not exist.', 16, 1) RETURN END

 
        SELECT * FROM VW_ColumnViewByColumnID 
        WHERE ColumnID = @ColumnID
  
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetColumnByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetColumnByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL 
    BEGIN 
    RAISERROR('ProjectID is required', 16, 1) 
    RETURN 
    END

    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) 
    BEGIN 
    RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_ColumnViewByProjectID 
        WHERE ProjectID = @ProjectID
        ORDER BY PublishedAt DESC
        
    END
    ELSE
    BEGIN
        SELECT * FROM VW_ColumnViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
        ORDER BY PublishedAt DESC
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetCommentByElementID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 20. Get Comment By NoteID
CREATE PROCEDURE [dbo].[SP_GetCommentByElementID]
@EventID INT = NULL,
@To_DoID INT = NULL,
@StepID INT = NULL,
@MessageID INT = NULL,
@DocumentID INT = NULL,
@CardID INT = NULL
AS 
BEGIN
    SET NOCOUNT ON;

    IF @EventID IS NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @DocumentID IS NULL AND @CardID IS NULL AND @MessageID IS NULL
    BEGIN
        RAISERROR('At least one ID parameter is required', 16, 1) 
        RETURN
    END
    

      IF @CardID IS NOT NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @DocumentID IS NULL AND @EventID IS NULL AND @MessageID IS NULL
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID) 
      BEGIN 
          RAISERROR('Invalid CardID. Card does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_CommentViewByElementID
        WHERE CardID = @CardID
        ORDER BY PublishedAt DESC
      END
      END

      IF @EventID IS NOT NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @DocumentID IS NULL AND @CardID IS NULL AND @MessageID IS NULL
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE ID = @EventID) 
      BEGIN 
          RAISERROR('Invalid EventID. Event does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_CommentViewByElementID
        WHERE EventID = @EventID
        ORDER BY PublishedAt DESC
      END
      END

      IF @To_DoID IS NOT NULL AND @CardID IS NULL AND @StepID IS NULL AND @DocumentID IS NULL AND @EventID IS NULL AND @MessageID IS NULL
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.To_Dos WHERE ID = @To_DoID) 
      BEGIN 
          RAISERROR('Invalid To_DoID. To_Do does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_CommentViewByElementID
        WHERE To_DoID = @To_DoID
        ORDER BY PublishedAt DESC
      END
      END

      IF @StepID IS NOT NULL AND @To_DoID IS NULL AND @CardID IS NULL AND @DocumentID IS NULL AND @EventID IS NULL AND @MessageID IS NULL
      BEGIN
      IF NOT EXISTS (SELECT 1 FROM dbo.Steps WHERE ID = @StepID) 
      BEGIN 
          RAISERROR('Invalid StepID. Step does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_CommentViewByElementID
        WHERE StepID = @StepID
        ORDER BY PublishedAt DESC
      END
      END

      IF @MessageID IS NOT NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @DocumentID IS NULL AND @EventID IS NULL AND @CardID IS NULL
      BEGIN
        
        IF NOT EXISTS (SELECT 1 FROM dbo.MessageBoards WHERE ID = @MessageID) 
        BEGIN 
            RAISERROR('Invalid MessageID. Message does not exist.', 16, 1) 
        RETURN 
        END

        ELSE
        BEGIN
            SELECT * FROM VW_CommentViewByElementID
            WHERE MessageID = @MessageID
            ORDER BY PublishedAt DESC
        END
      END

      IF @DocumentID IS NOT NULL AND @To_DoID IS NULL AND @StepID IS NULL AND @CardID IS NULL AND @EventID IS NULL AND @MessageID IS NULL
      BEGIN

      IF NOT EXISTS (SELECT 1 FROM dbo.Documents WHERE ID = @DocumentID) 
      BEGIN 
          RAISERROR('Invalid DocumentID. Document does not exist.', 16, 1) 
      RETURN 
      END

      ELSE
      BEGIN
        SELECT * FROM VW_CommentViewByElementID
        WHERE DocumentID = @DocumentID
        ORDER BY PublishedAt DESC
      END
      END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetCommentSubscribers]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get Comment Subscribers by CommentID
CREATE PROCEDURE [dbo].[SP_GetCommentSubscribers]
    @CommentID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Validation: Check if CommentID is provided
    IF @CommentID IS NULL 
    BEGIN 
        RAISERROR('CommentID is required', 16, 1) 
        RETURN 
    END

    -- 2. Validation: Check if the Comment exists in the base table (assuming dbo.Comments)
    IF NOT EXISTS (SELECT 1 FROM dbo.ProjectComments WHERE ID = @CommentID) 
    BEGIN 
        RAISERROR('Invalid CommentID. Comment does not exist.', 16, 1) 
        RETURN 
    END

    
        SELECT * FROM VW_GetCommentSubscripers 
        WHERE CommentID = @CommentID 
          
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDocumentByDocumentID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 7. Get Document By DocumentID
CREATE PROCEDURE [dbo].[SP_GetDocumentByDocumentID]
@DocumentID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @DocumentID IS NULL BEGIN RAISERROR('DocumentID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Documents WHERE ID = @DocumentID) BEGIN RAISERROR('Invalid DocumentID. Document does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_DocumentViewByDocumentID WHERE DocumentID = @DocumentID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetDocumentByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 8. Get Document By ProjectID
CREATE PROCEDURE [dbo].[SP_GetDocumentByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_DocumentViewByProjectID 
        WHERE ProjectID = @ProjectID
    END
    ELSE
    BEGIN
        SELECT * FROM VW_DocumentViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetEventByEventID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 10. Get Event By EventID
CREATE PROCEDURE [dbo].[SP_GetEventByEventID]
@EventID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @EventID IS NULL BEGIN RAISERROR('EventID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE ID = @EventID) BEGIN RAISERROR('Invalid EventID. Event does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_EventViewByEventID WHERE EventID = @EventID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetEventByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 11. Get Event By ProjectID
CREATE PROCEDURE [dbo].[SP_GetEventByProjectID]
@ProjectID INT,
@MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL 
    BEGIN 
        RAISERROR('ProjectID is required', 16, 1) 
    RETURN 
    END

    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) 
    BEGIN 
        RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) 
    RETURN 
    END
    IF @MemberOrClient = 1
    BEGIN
        SELECT *
        FROM VW_EventViewByProjectID 
        WHERE ProjectID = @ProjectID
    END

    ELSE
    BEGIN
        -- Client Only See Public Events Where IsPrivate = 0
        SELECT *
        FROM VW_EventViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetFilesByNoteID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetFilesByNoteID]
    @NoteID INT

AS
BEGIN
    SET NOCOUNT ON;
    IF @NoteID IS NULL 
    BEGIN 
        RAISERROR('NoteID is required', 16, 1) 
        RETURN 
    END
    IF NOT EXISTS (SELECT 1 FROM dbo.Notes WHERE ID = @NoteID) 
    BEGIN 
        RAISERROR('Invalid NoteID. Note does not exist.', 16, 1) 
        RETURN 
    END

        SELECT * FROM VW_FileByNoteID 
        WHERE NoteID = @NoteID
   
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvitationsByInvitationID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetInvitationsByInvitationID]
    @InvitationID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

   
        
    IF NOT EXISTS (SELECT 1 FROM Invitations WHERE ID = @InvitationID)
    BEGIN
        RAISERROR('Project ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_Invitation
        WHERE InvitationID = @InvitationID

            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvitationsByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetInvitationsByProjectID]
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

  
        
    IF NOT EXISTS (SELECT 1 FROM Projects WHERE ID = @ProjectID)
    BEGIN
        RAISERROR('Project ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_InvitationProject
        WHERE ProjectID = @ProjectID
        ORDER BY PublishedAt DESC
            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetListByListID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 3. Get List By ListID
CREATE PROCEDURE [dbo].[SP_GetListByListID]
@ListID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ListID IS NULL BEGIN RAISERROR('ListID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Lists WHERE ID = @ListID) BEGIN RAISERROR('Invalid ListID. List does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_ListViewByListID WHERE ListID = @ListID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetListByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 4. Get List By ProjectID
CREATE PROCEDURE [dbo].[SP_GetListByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_ListViewByProjectID 
        WHERE ProjectID = @ProjectID
    END
    ELSE
    BEGIN
        SELECT * FROM VW_ListViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetMessageBoardByMessageID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 1. Get MessageBoard By MessageID
CREATE PROCEDURE [dbo].[SP_GetMessageBoardByMessageID]
@MessageID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @MessageID IS NULL BEGIN RAISERROR('MessageID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.MessageBoards WHERE ID = @MessageID) BEGIN RAISERROR('Invalid MessageID. Message does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_MessageBoardByMessageID WHERE MessageID = @MessageID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetMessageBoardByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 2. Get MessageBoard By ProjectID
CREATE PROCEDURE [dbo].[SP_GetMessageBoardByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_MessageBoardByProjectID 
        WHERE ProjectID = @ProjectID
        ORDER BY PublishedAt DESC
    END
    ELSE
    BEGIN
        SELECT * FROM VW_MessageBoardByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
        ORDER BY PublishedAt DESC
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetQuestionByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 13. Get Question By ProjectID
CREATE PROCEDURE [dbo].[SP_GetQuestionByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_QuestionViewByProjectID 
        WHERE ProjectID = @ProjectID
    END
    ELSE
    BEGIN
        SELECT * FROM VW_QuestionViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetQuestionByQuestionID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 12. Get Question By QuestionID
CREATE PROCEDURE [dbo].[SP_GetQuestionByQuestionID]
@QuestionID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @QuestionID IS NULL BEGIN RAISERROR('QuestionID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Questions WHERE ID = @QuestionID) BEGIN RAISERROR('Invalid QuestionID. Question does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_QuestionViewByQuestionID WHERE QuestionID = @QuestionID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetStepByCardID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 15. Get Step By CardID
CREATE PROCEDURE [dbo].[SP_GetStepByCardID]
@CardID INT
AS 
BEGIN
    SET NOCOUNT ON;
    IF @CardID IS NULL BEGIN RAISERROR('CardID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID) BEGIN RAISERROR('Invalid CardID. Card does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_StepViewByCardID 
    WHERE CardID = @CardID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetTeamMemberByMemberID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetTeamMemberByMemberID]
    @MemberID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

   
        
    IF NOT EXISTS (SELECT 1 FROM Members WHERE ID = @MemberID)
    BEGIN
        RAISERROR('Member ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_Member
        WHERE MemberID = @MemberID

            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetTeamMembersByProjectID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetTeamMembersByProjectID]
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

  
        
    IF NOT EXISTS (SELECT 1 FROM Projects WHERE ID = @ProjectID)
    BEGIN
        RAISERROR('Project ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_MemberProject
        WHERE ProjectID = @ProjectID
        
            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetToDoByListID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 6. Get ToDo By ListID
CREATE PROCEDURE [dbo].[SP_GetToDoByListID]
@ListID INT,
@IsClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ListID IS NULL BEGIN RAISERROR('ListID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Lists WHERE ID = @ListID) BEGIN RAISERROR('Invalid ListID. List does not exist.', 16, 1) RETURN END

    IF @IsClient = 1
    BEGIN
        SELECT * FROM VW_ToDoViewByListID 
        WHERE ListID = @ListID
    END

    ELSE
    BEGIN
        SELECT * FROM VW_ToDoViewByListID 
        WHERE ListID = @ListID AND IsPrivate = 0
    END

   
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetToDoByToDoID]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 5. Get ToDo By ToDoID
CREATE PROCEDURE [dbo].[SP_GetToDoByToDoID]
@To_DoID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @To_DoID IS NULL BEGIN RAISERROR('To_DoID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.To_Dos WHERE ID = @To_DoID) BEGIN RAISERROR('Invalid To_DoID. To-Do does not exist.', 16, 1) RETURN END

    SELECT * FROM VW_ToDoViewByToDoID WHERE To_DoID = @To_DoID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateAnswer]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update Answer - allows updating answer text and files (NOT MemberID, ProjectID, or QuestionID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateAnswer]

    @AnswerID INT,
    @AnswerText NVARCHAR(2000) = NULL,
    @URLLink NVARCHAR(4000) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @NoteID INT;
    DECLARE @ProjectID INT;
    DECLARE @QusID INT;


    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF @AnswerID IS NULL
        BEGIN
            RAISERROR('AnswerID is required.', 16, 1);
        END
        
         
        IF NOT EXISTS (SELECT 1 FROM dbo.Answers WHERE ID = @AnswerID)
        BEGIN
            RAISERROR('Invalid AnswerID. Answer does not exist.', 16, 1);
        END
        
        SELECT @NoteID = AnswerID
        FROM Answers
        WHERE ID = @AnswerID
        

        UPDATE Notes
        SET 
           Text = @AnswerText,
           URLLink = @URLLink
           WHERE ID = @NoteID


      
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCard]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update Card - allows updating Dates, Private, and Notes/Files (NOT MemberID, ProjectID, or ColumnID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateCard]
    @CardID INT,
    @Title NVARCHAR(50),
    @FromDate DATETIME = NULL,
    @ToDate DATETIME = NULL,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @ExistingNoteID INT = NULL;
    DECLARE @NewNoteID INT = NULL;
    DECLARE @ScheduleID INT;
    DECLARE @ProjectID INT;
    DECLARE @PublisherID INT;
    DECLARE @PubInfoID INT;    
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF @CardID IS NULL
        BEGIN
            RAISERROR('CardID is required.', 16, 1);
        END
        
        
        
        IF NOT EXISTS (SELECT 1 FROM dbo.Cards WHERE ID = @CardID)
        BEGIN
            RAISERROR('Invalid CardID. Card does not exist.', 16, 1);
        END
        
        SELECT @ExistingNoteID = NoteID, @ScheduleID = ScheduleID
        FROM dbo.Cards
        WHERE ID = @CardID;
        
         SELECT @PublisherID = PublisherID 
         FROM PublishingInformation 
         WHERE ID = 
         (SELECT PublishingInfoID FROM Cards WHERE ID = @CardID)

        SELECT @ProjectID = Col.ProjectID FROM Cards 
        INNER JOIN
        Columns AS Col ON Cards.ColumnID = Col.ID

        IF @ScheduleID IS NOT NULL
        BEGIN

            UPDATE dbo.Schedules
            SET FromDate = @FromDate,
                ToDate = @ToDate
            WHERE ID = @ScheduleID;
        END

        ELSE IF @FromDate IS NOT NULL AND @ToDate IS NOT NULL
        BEGIN 
            INSERT INTO Schedules(FromDate,ToDate, ProjectID)
            VALUES (@FromDate, @ToDate, @ProjectID)

            DECLARE @NewScheduleID INT = SCOPE_IDENTITY();
            
            UPDATE  Cards
            SET 
                ScheduleID = @NewScheduleID
            WHERE ID = @CardID
        END
        
        IF EXISTS (SELECT NoteID FROM Cards WHERE ID = @CardID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN
            UPDATE Notes
            SET 
                Text = @NoteText,
                URLLink = @NoteURLLink
            WHERE ID = @ExistingNoteID;
        END

        ELSE IF NOT EXISTS (SELECT NoteID FROM Cards WHERE ID = @CardID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN

            INSERT INTO PublishingInformation(PublisherID)
            VALUES (@PublisherID)

            SET @PubInfoID = SCOPE_IDENTITY();

            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PubInfoID, @ProjectID);

            SET @NewNoteID = SCOPE_IDENTITY();

            UPDATE dbo.Cards
            SET 
                
                NoteID = @NewNoteID
            
            WHERE ID = @CardID;
        END
        
        UPDATE dbo.Cards
            SET 
                Title = @Title,
                IsPrivate = @IsPrivate
            
            WHERE ID = @CardID;
        
        COMMIT TRANSACTION;
        
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateChat]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update Chat - allows updating Text and Private (NOT MemberID or ProjectID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateChat]
    @ChatID INT,
    @Text NVARCHAR(4000),
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
        
    BEGIN TRANSACTION
        BEGIN TRY

            IF @ChatID IS NULL
            BEGIN
                RAISERROR('ChatID is required.', 16, 1);
            END
            
            IF NOT EXISTS (SELECT 1 FROM dbo.Chats WHERE ID = @ChatID)
            BEGIN
                RAISERROR('Invalid ChatID. Chat does not exist.', 16, 1);
            END

            UPDATE Chats
            SET 
                Text = @Text
            WHERE ID = @ChatID 

            UPDATE Chats
            SET 
                IsPrivate = @IsPrivate
            WHERE ProjectID = (SELECT ProjectID FROM Chats WHERE ID = @ChatID)
    
            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH

            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateColumn]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update Column - allows updating Title, Description, and Private (NOT MemberID or ProjectID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateColumn]
    @ColumnID INT,
    @Title NVARCHAR(50) = NULL,
    @Description NVARCHAR(1000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF @ColumnID IS NULL
        BEGIN
            RAISERROR('ColumnID is required.', 16, 1);
        END
        
      
        
        IF NOT EXISTS (SELECT 1 FROM dbo.Columns WHERE ID = @ColumnID)
        BEGIN
            RAISERROR('Invalid ColumnID. Column does not exist.', 16, 1);
        END
        
        UPDATE dbo.Columns
        SET 
            Title = @Title,
            Description = @Description,
            IsPrivate = @IsPrivate
        WHERE ID = @ColumnID;
        
        COMMIT TRANSACTION;
            
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateComment]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- ALTER date: 2025-11-19

-- Description: Update Comment - allows updating comment text and files (NOT MemberID, ProjectID, or linked element IDs)

-- =============================================

CREATE PROCEDURE [dbo].[SP_UpdateComment]

    @CommentID INT,

    @NoteText NVARCHAR(2000) = NULL,

    @URLLink NVARCHAR(4000) = NULL
AS

BEGIN

    SET NOCOUNT ON;

    

    DECLARE @ErrorMessage NVARCHAR(4000);

    DECLARE @ErrorSeverity INT;

    DECLARE @ErrorState INT;

    DECLARE @NoteID INT;



    BEGIN TRY

        BEGIN TRANSACTION;

        

        --  Check if RequiredIDs are provided

        IF @CommentID IS NULL

        BEGIN

            RAISERROR('CommentID is required.', 16, 1);

        END


        


        IF NOT EXISTS (SELECT 1 FROM ProjectComments WHERE ID = @CommentID) 

        BEGIN

            RAISERROR('Invalid CommentID. Comment does not exist.', 16, 1);

        END


        --  Fetch the NoteID once at the start. 

        SELECT @NoteID = NoteID FROM dbo.ProjectComments WHERE ID = @CommentID;


        -- Update the Notes table

        UPDATE Notes

        SET 

            Text = @NoteText,

            URLLink = @URLLink

        WHERE ID = @NoteID;



        COMMIT TRANSACTION;

            

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0

            ROLLBACK TRANSACTION;

            

        SELECT @ErrorMessage = ERROR_MESSAGE(),

               @ErrorSeverity = ERROR_SEVERITY(),

               @ErrorState = ERROR_STATE();

               

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

    END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateDocument]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update Document - allows updating Name, FilePath, Private, and Notes/Files (NOT MemberID or ProjectID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateDocument]
    @DocumentID INT,
    @Name NVARCHAR(100) = NULL,
    @FilePath NVARCHAR(4000) = NULL,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @ExistingNoteID INT = NULL;
    DECLARE @NewNoteID INT = NULL;
    DECLARE @ProjectID INT;
    DECLARE @PublisherID INT;
    DECLARE @PubInfoID INT;    

    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF @DocumentID IS NULL
        BEGIN
            RAISERROR('DocumentID is required.', 16, 1);
        END
        
       
        
        IF NOT EXISTS (SELECT 1 FROM dbo.Documents WHERE ID = @DocumentID)
        BEGIN
            RAISERROR('Invalid DocumentID. Document does not exist.', 16, 1);
        END


         SELECT  @PublisherID = PublisherID 
         FROM PublishingInformation 
         WHERE ID = 
         (SELECT PublishingInfoID FROM Documents WHERE ID = @DocumentID)


        SELECT @ExistingNoteID = NoteID, @ProjectID = ProjectID
        FROM dbo.Documents
        WHERE ID = @DocumentID;
        
         IF EXISTS (SELECT NoteID FROM Documents WHERE ID = @DocumentID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN
            UPDATE Notes
            SET 
                Text = @NoteText,
                URLLink = @NoteURLLink
            WHERE ID = @ExistingNoteID;
        END

        ELSE IF NOT EXISTS (SELECT NoteID FROM Documents WHERE ID = @DocumentID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN

            
             INSERT INTO PublishingInformation(PublisherID)
            VALUES (@PublisherID)

            SET @PubInfoID = SCOPE_IDENTITY();

            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PubInfoID, @ProjectID);

            SET @NewNoteID = SCOPE_IDENTITY();

            UPDATE dbo.Documents
            SET 
                
                NoteID = @NewNoteID
            
            WHERE ID = @DocumentID;
        END
        
        UPDATE dbo.Documents
        SET 
            dbo.Documents.Name = @Name,
            FilePath = @FilePath,
            IsPrivate = @IsPrivate
        WHERE ID = @DocumentID;
        
        COMMIT TRANSACTION;
        
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateEvent]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateEvent]
    @EventID INT,
    @Name NVARCHAR(50),
    @FromDate DATETIME,
    @ToDate DATETIME,
    @URLLink NVARCHAR(500) = NULL,
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @ExistingNoteID INT = NULL;
    DECLARE @ScheduleID INT;
    DECLARE @NewNoteID INT = NULL;
    DECLARE @ProjectID INT;
    DECLARE @PublisherID INT;
    DECLARE @PubInfoID INT;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validation checks
        IF @EventID IS NULL
        BEGIN
            RAISERROR('EventID is required.', 16, 1);
        END
        
        IF @Name IS NULL OR @Name = ''
        BEGIN
            RAISERROR('Name is required for Event.', 16, 1);
        END
        
        IF @FromDate IS NULL OR @ToDate IS NULL
        BEGIN
            RAISERROR('Start/End date are required.', 16, 1);
        END
        
        SELECT @PublisherID = PublisherID 
         FROM PublishingInformation 
         WHERE ID = 
         (SELECT PublishingInfoID FROM Events WHERE ID = @EventID)

        -- Pulling existing data and verifying existence
        SELECT @ExistingNoteID = NoteID, 
               @ScheduleID = ScheduleID,
               @ProjectID = ProjectID
        FROM dbo.Events
        WHERE ID = @EventID;

      

        -- Update the linked Schedule
        UPDATE dbo.Schedules
        SET FromDate = @FromDate,
            ToDate = @ToDate
        WHERE ID = @ScheduleID;
        
       IF EXISTS (SELECT NoteID FROM Events WHERE ID = @EventID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN
            UPDATE Notes
            SET 
                Text = @NoteText,
                URLLink = @NoteURLLink
            WHERE ID = @ExistingNoteID;
        END

        ELSE IF NOT EXISTS (SELECT NoteID FROM Events WHERE ID = @EventID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN

             INSERT INTO PublishingInformation(PublisherID)
            VALUES (@PublisherID)

            SET @PubInfoID = SCOPE_IDENTITY();

            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PubInfoID, @ProjectID);

            SET @NewNoteID = SCOPE_IDENTITY();

            UPDATE dbo.Events
            SET 
                
                NoteID = @NewNoteID
            
            WHERE ID = @EventID;
        END
        
        
        -- Final update to the Event record
        UPDATE dbo.Events
        SET 
            Name = @Name,
            URLLink = @URLLink,
            NoteID = ISNULL(@NewNoteID, @ExistingNoteID),
            IsPrivate = @IsPrivate
        WHERE ID = @EventID;
        
        COMMIT TRANSACTION;
        
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateFileInNote]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateFileInNote]
@FileID INT,
@FilePath NVARCHAR(MAX),
@FileCaption NVARCHAR(100)

AS 
BEGIN

SET NOCOUNT ON;

	DECLARE @ErrorMessage VARCHAR(4000);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;

	BEGIN TRY
		BEGIN TRANSACTION;

		IF @FileID IS NULL
		BEGIN
			RAISERROR('FileID is required!', 16, 1)
		END

		IF (SELECT ID FROM Files WHERE ID = @FileID) IS NULL
		BEGIN
			RAISERROR('File does not exist!', 16, 1)
		END

		IF @FileCaption IS NOT NULL AND @FilePath IS NOT NULL
		BEGIN
			UPDATE Files
			SET
				FilePath = @FilePath,
				Caption = @FileCaption
			WHERE ID = @FileID;
		END



		COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateInvitation]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdateInvitation]
    @InvitationID INT,
    @JobTitle NVARCHAR(500) = NULL,
    @CompanyName NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @InvitationID IS NULL
        BEGIN
            RAISERROR('The InvitationID Is Required.', 16, 1);
        END

        -- Validate InvitationID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Invitations WHERE ID = @InvitationID)
        BEGIN
            RAISERROR('Invalid InvitationID. Invitation does not exist.', 16, 1);
        END

        -- Update the invitation details
        UPDATE dbo.Invitations
        SET
            JobTitle = ISNULL(@JobTitle, JobTitle),
            CompanyName = ISNULL(@CompanyName, CompanyName)
        WHERE
            ID = @InvitationID;

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateList]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update List - allows updating Title, Private, and Notes/Files (NOT MemberID or ProjectID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateList]
    @ListID INT,
    @Title NVARCHAR(50),
    @NoteText NVARCHAR(2000) = NULL,
    @URLLink NVARCHAR(2000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @ExistingNoteID INT = NULL;
    DECLARE @NewNoteID INT = NULL;
    DECLARE @ProjectID INT;
    DECLARE @PublisherID INT;
    DECLARE @PubInfoID INT;

    BEGIN TRANSACTION
        
        BEGIN TRY
        
        IF @ListID IS NULL
        BEGIN
            RAISERROR('ListID is required.', 16, 1);
        END
        
        IF NOT EXISTS (SELECT 1 FROM dbo.Lists WHERE ID = @ListID)
        BEGIN
            RAISERROR('Invalid ListID. List does not exist.', 16, 1);
        END


        SELECT @PublisherID = PublisherID 
         FROM PublishingInformation 
         WHERE ID = 
         (SELECT PublishingInfoID FROM Lists WHERE ID = @ListID)


        SELECT @ExistingNoteID = NoteID, @ProjectID = ProjectID
        FROM dbo.Lists
        WHERE ID = @ListID;
        
        IF EXISTS (SELECT NoteID FROM Lists WHERE ID = @ListID) AND (@NoteText IS NOT NULL OR @URLLink IS NOT NULL)
        BEGIN
            UPDATE Notes
            SET 
                Text = @NoteText,
                URLLink = @URLLink
            WHERE ID = @ExistingNoteID;
        END

        ELSE IF NOT EXISTS (SELECT NoteID FROM Lists WHERE ID = @ListID) AND (@NoteText IS NOT NULL OR @URLLink IS NOT NULL)
        BEGIN

            INSERT INTO PublishingInformation(PublisherID)
            VALUES (@PublisherID)

            SET @PubInfoID = SCOPE_IDENTITY();

            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @URLLink, @PubInfoID, @ProjectID);

            SET @NewNoteID = SCOPE_IDENTITY();

            UPDATE dbo.Lists
            SET 
                NoteID = @NewNoteID
            WHERE ID = @ListID;
        END

        UPDATE Lists
        SET 
            Title = @Title,
            IsPrivate = @IsPrivate
        WHERE ID = @ListID

        COMMIT TRANSACTION
        
        END TRY

        BEGIN CATCH

            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION

            SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

        END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateMember]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdateMember]
    @MemberID INT,             
    @JobTitle NVARCHAR(50) = NULL,
    @CompanyName NVARCHAR(150) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @UserID INT;

    -- 1. Identify the UserID associated with this MemberID
    SELECT @UserID = UserID FROM Members WHERE ID = @MemberID;

    IF @UserID IS NULL
    BEGIN
        RAISERROR('Member not found.', 16, 1);
        RETURN;
    END

    

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 2. Update the Users table
        UPDATE Users
        SET 
            JobTitle = @JobTitle,
            CompanyName = @CompanyName
        WHERE ID = @UserID;

       

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrMsg, 16, 1);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateMessageInBoard]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- ALTER date: 2025-12-22
-- Description: Updates a message board entry, its associated note, and handles file attachments.
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateMessageInBoard]
    @MessagID INT,
    @Title NVARCHAR(50),
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @IsPrivate BIT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @ExistingNoteID INT = NULL;
    DECLARE @NewNoteID INT = NULL;
    DECLARE @ProjectID INT;
    DECLARE @PublisherID INT;
    DECLARE @PubInfoID INT;



    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Validation: Check if required MessageBoardID is provided
        IF @MessagID IS NULL
        BEGIN
            RAISERROR('MessageBoardID is required.', 16, 1);
        END

       

         SELECT @PublisherID = PublisherID 
         FROM PublishingInformation 
         WHERE ID = 
         (SELECT PublishingInfoID FROM MessageBoards WHERE ID = @MessagID)

         SELECT @ExistingNoteID = NoteID ,@ProjectID = ProjectID
        FROM dbo.MessageBoards 
        WHERE ID = @MessagID;

        IF EXISTS (SELECT NoteID FROM MessageBoards WHERE ID = @MessagID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN
            UPDATE Notes
            SET 
                Text = @NoteText,
                URLLink = @NoteURLLink
            WHERE ID = @ExistingNoteID;
        END

        ELSE IF NOT EXISTS (SELECT NoteID FROM MessageBoards WHERE ID = @MessagID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN
            
            INSERT INTO PublishingInformation(PublisherID)
            VALUES (@PublisherID)

            SET @PubInfoID = SCOPE_IDENTITY();

             
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PubInfoID, @ProjectID);

            SET @NewNoteID = SCOPE_IDENTITY();

            UPDATE dbo.Lists
            SET 
                NoteID = @NewNoteID
            WHERE ID = @MessagID;
        END


        --  Update the Message Board entry itself
        UPDATE dbo.MessageBoards
        SET 
            Title = @Title,
            IsPrivate = @IsPrivate
        WHERE ID = @MessagID;

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        -- Rollback if there is an active transaction
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Capture and re-raise error information
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateProject]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateProject]
@ProjectID INT,
@NewName NVARCHAR(50),
@MemberID INT

AS
BEGIN

	DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

	DECLARE @NewPubInfoID INT;
	BEGIN TRANSACTION

	IF @ProjectID =NULL
		RAISERROR('ProjectID is required', 16, 1)



	IF NOT EXISTS (SELECT Name FROM Projects WHERE ID = @ProjectID)
		RAISERROR('ProjectID is invalid', 16, 1)

		BEGIN TRY

	INSERT INTO PublishingInformation(PublisherID)
	VALUES (@MemberID)

	SET @NewPubInfoID  = SCOPE_IDENTITY();

	UPDATE Projects
	SET Name = @NewName
	WHERE ID = @ProjectID

	-- If all statements succeed, commit the transaction
	COMMIT TRANSACTION

		END TRY

		BEGIN CATCH
			-- If any error occurred, check if the transaction is still active
			IF @@TRANCOUNT > 0 
				ROLLBACK TRANSACTION

				SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

		END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateQuestion]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update Question - allows updating Text, Dates, and IsChecked (NOT MemberID or ProjectID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateQuestion]
    @QuestionID INT,
    @Text NVARCHAR(2000) = NULL,
    @IsPrivate BIT,
    @FromDate DATETIME,
    @ToDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @ScheduleID INT;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF @QuestionID IS NULL
        BEGIN
            RAISERROR('QuestionID is required.', 16, 1);
        END
        
        IF NOT EXISTS (SELECT 1 FROM dbo.Questions WHERE ID = @QuestionID)
        BEGIN
            RAISERROR('Invalid QuestionID. Question does not exist.', 16, 1);
        END
        
        SELECT @ScheduleID = ScheduleID
        FROM dbo.Questions
        WHERE ID = @QuestionID;
        
        UPDATE Schedules
        SET FromDate = @FromDate,
            ToDate = @ToDate
        WHERE ID = @ScheduleID;
        
        UPDATE Questions
        SET Text = @Text,
            IsPrivate = @IsPrivate
        WHERE ID = @QuestionID;
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStep]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update Step - allows updating Text and IsChecked (NOT MemberID, ProjectID, or CardID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateStep]
    @StepID INT,
    @Text NVARCHAR(2000) = NULL,
    @IsChecked BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF @StepID IS NULL
        BEGIN
            RAISERROR('StepID is required.', 16, 1);
        END
        
        IF NOT EXISTS (SELECT 1 FROM dbo.Steps WHERE ID = @StepID)
        BEGIN
            RAISERROR('Invalid StepID. Step does not exist.', 16, 1);
        END
        
        UPDATE dbo.Steps
        SET 
            Text = @Text,
            IsChecked = @IsChecked
        WHERE ID = @StepID;
        
        COMMIT TRANSACTION;
            
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateTo_Do]    Script Date: 2/3/2026 12:28:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- ALTER date: 2025-11-19
-- Description: Update To_Do - allows updating Text and Notes/Files (NOT MemberID, ProjectID, or ListID)
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateTo_Do]
    @To_DoID INT,
    @Text NVARCHAR(500),
    @NoteText NVARCHAR(2000) = NULL,
    @NoteURLLink NVARCHAR(4000) = NULL,
    @FromDate DATETIME,
    @ToDate DATETIME,
    @IsPrivate BIT,
    @Checked BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    
    DECLARE @ExistingNoteID INT = NULL;
    DECLARE @NewNoteID INT = NULL;
    DECLARE @ListID INT;
    DECLARE @PublisherID INT;
    DECLARE @NewPubInfoID INT;
    DECLARE @ScheduleID INT;
    DECLARE @ProjectID INT;
    DECLARE @PubInfoID INT;


    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF @To_DoID IS NULL
        BEGIN
            RAISERROR('To_DoID is required.', 16, 1);
        END
        
        IF @Text IS NULL OR @Text = ''
        BEGIN
            RAISERROR('Text is required for To_Do.', 16, 1);
        END
        
        IF NOT EXISTS (SELECT 1 FROM dbo.To_Dos WHERE ID = @To_DoID)
        BEGIN
            RAISERROR('Invalid To_DoID. To_Do does not exist.', 16, 1);
        END

       
        
        SELECT @ExistingNoteID = NoteID, @ListID = ListID
        FROM dbo.To_Dos
        WHERE ID = @To_DoID;


        SELECT @PublisherID = PublisherID 
        FROM PublishingInformation 
        WHERE ID = (SELECT PublishingInfoID FROM To_Dos WHERE ID = @To_DoID)

        SELECT @ProjectID = ProjectID
        FROM dbo.Lists
        WHERE ID = @ListID;
        
        IF EXISTS (SELECT NoteID FROM To_Dos WHERE ID = @To_DoID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN
            UPDATE Notes
            SET 
                Text = @NoteText,
                URLLink = @NoteURLLink
            WHERE ID = @ExistingNoteID;
        END

        ELSE IF NOT EXISTS (SELECT NoteID FROM To_Dos WHERE ID = @To_DoID) AND (@NoteText IS NOT NULL OR @NoteURLLink IS NOT NULL)
        BEGIN
            
            INSERT INTO PublishingInformation(PublisherID)
            VALUES (@PublisherID)

            SET @PubInfoID = SCOPE_IDENTITY();

             
            INSERT INTO dbo.Notes (Text, URLLink, PublishingInfoID, ProjectID)
            VALUES (@NoteText, @NoteURLLink, @PubInfoID, @ProjectID);

            SET @NewNoteID = SCOPE_IDENTITY();

            UPDATE dbo.Lists
            SET 
                NoteID = @NewNoteID
            WHERE ID = @To_DoID;
        END

        SELECT @ScheduleID = ScheduleID
        FROM To_Dos 
        WHERE ID = @To_DoID

        IF EXISTS (SELECT ID FROM Schedules WHERE ID = @ScheduleID)
        BEGIN
            UPDATE Schedules 
            SET 
                FromDate = @FromDate,
                ToDate = @ToDate    
            WHERE ID = @ScheduleID
        END
        


        UPDATE dbo.To_Dos
        SET 
            Text = @Text,
            IsPrivate = @IsPrivate,
            Checked = @Checked
        WHERE ID = @To_DoID;
        
        COMMIT TRANSACTION;
        
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
               
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 337
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ActivityByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ActivityByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[25] 3[25] 2) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -120
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Q"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 322
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 679
               Left = 48
               Bottom = 820
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 826
               Left = 48
               Bottom = 989
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_AnswerViewByQuestionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_AnswerViewByQuestionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_AnswerViewByQuestionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 316
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 322
               Left = 48
               Bottom = 485
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_AssignmentByElementID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_AssignmentByElementID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Col"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 679
               Left = 48
               Bottom = 842
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 847
               Left = 48
               Bottom = 988
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 994
               Left = 48
               Bottom = 1157
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CardViewByCardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CardViewByCardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CardViewByCardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 679
               Left = 48
               Bottom = 820
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 826
               Left = 48
               Bottom = 989
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CardViewByColumnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CardViewByColumnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CardViewByColumnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 484
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 490
               Left = 48
               Bottom = 653
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ChatViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ChatViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Col"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ColumnViewByColumnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ColumnViewByColumnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Col"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 241
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 7
               Left = 300
               Bottom = 175
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ColumnViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ColumnViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PC"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 652
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CommentViewByElementID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CommentViewByElementID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "D"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 652
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_DocumentViewByDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_DocumentViewByDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "D"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_DocumentViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_DocumentViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "E"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 679
               Left = 48
               Bottom = 820
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 826
               Left = 48
               Bottom = 989
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EventViewByEventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EventViewByEventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EventViewByEventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ResultTable"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EventViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EventViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "F"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_FileByNoteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_FileByNoteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "L"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ListViewByListID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ListViewByListID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "L"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ListViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ListViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "M"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 154
               Left = 48
               Bottom = 317
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Member'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Member'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "M"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 154
               Left = 48
               Bottom = 317
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 322
               Left = 48
               Bottom = 485
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_MemberProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_MemberProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "M"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MN"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MP"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MPM"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 652
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MPMU"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_MessageBoardByMessageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_MessageBoardByMessageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_MessageBoardByMessageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MB"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 652
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_MessageBoardByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_MessageBoardByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Q"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_QuestionViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_QuestionViewByProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "S"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_StepViewByCardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_StepViewByCardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TD"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 484
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 490
               Left = 48
               Bottom = 653
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ToDoViewByListID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ToDoViewByListID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TD"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 652
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ToDoViewByToDoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ToDoViewByToDoID'
GO
USE [master]
GO
ALTER DATABASE [Basecamp] SET  READ_WRITE 
GO
