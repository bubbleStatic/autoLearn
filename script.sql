USE [master]
GO
/****** Object:  Database [autolearn]    Script Date: 11.06.2024 0:17:49 ******/
CREATE DATABASE [autolearn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'autolearn', FILENAME = N'C:\Users\xbox0\Desktop\diplom\db\autolearn.mdf' , SIZE = 204800KB , MAXSIZE = 1048576KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'autolearnlog', FILENAME = N'C:\Users\xbox0\Desktop\diplom\db\autolearnlog.ldf' , SIZE = 204800KB , MAXSIZE = 1048576KB , FILEGROWTH = 10240KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [autolearn] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [autolearn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [autolearn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [autolearn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [autolearn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [autolearn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [autolearn] SET ARITHABORT OFF 
GO
ALTER DATABASE [autolearn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [autolearn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [autolearn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [autolearn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [autolearn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [autolearn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [autolearn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [autolearn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [autolearn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [autolearn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [autolearn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [autolearn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [autolearn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [autolearn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [autolearn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [autolearn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [autolearn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [autolearn] SET RECOVERY FULL 
GO
ALTER DATABASE [autolearn] SET  MULTI_USER 
GO
ALTER DATABASE [autolearn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [autolearn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [autolearn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [autolearn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [autolearn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [autolearn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [autolearn] SET QUERY_STORE = ON
GO
ALTER DATABASE [autolearn] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [autolearn]
GO
/****** Object:  User [autolearn]    Script Date: 11.06.2024 0:17:50 ******/
CREATE USER [autolearn] FOR LOGIN [autolearn] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [autolearn]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [autolearn]
GO
/****** Object:  Table [dbo].[auth]    Script Date: 11.06.2024 0:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[passwordHash] [varchar](max) NOT NULL,
	[EMAIL] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUEEMAIL] UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chunk]    Script Date: 11.06.2024 0:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chunk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chunkData] [varchar](max) NULL,
	[chunkImage] [varbinary](max) NULL,
	[isPassed] [bit] NOT NULL,
	[courceFK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 11.06.2024 0:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [varchar](max) NOT NULL,
	[isEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courseToOperator]    Script Date: 11.06.2024 0:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courseToOperator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseIdFK] [int] NULL,
	[operatorIdFK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mark]    Script Date: 11.06.2024 0:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mark](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateOfMark] [date] NOT NULL,
	[mark] [int] NOT NULL,
	[chunkFK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[chunkFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operator]    Script Date: 11.06.2024 0:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[operatorName] [varchar](max) NOT NULL,
	[authFK] [int] NOT NULL,
	[operatorRole] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[authFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[secretQuestion]    Script Date: 11.06.2024 0:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secretQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](max) NOT NULL,
	[authFK] [int] NOT NULL,
	[answerHash] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[course] ADD  DEFAULT ((1)) FOR [isEnabled]
GO
ALTER TABLE [dbo].[chunk]  WITH CHECK ADD  CONSTRAINT [chunkToCourseFkConstraint] FOREIGN KEY([courceFK])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[chunk] CHECK CONSTRAINT [chunkToCourseFkConstraint]
GO
ALTER TABLE [dbo].[courseToOperator]  WITH CHECK ADD  CONSTRAINT [courseToOperatorToCourseFkConstraint] FOREIGN KEY([courseIdFK])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[courseToOperator] CHECK CONSTRAINT [courseToOperatorToCourseFkConstraint]
GO
ALTER TABLE [dbo].[courseToOperator]  WITH CHECK ADD  CONSTRAINT [courseToOperatorToOperatorFkConstraint] FOREIGN KEY([operatorIdFK])
REFERENCES [dbo].[Operator] ([id])
GO
ALTER TABLE [dbo].[courseToOperator] CHECK CONSTRAINT [courseToOperatorToOperatorFkConstraint]
GO
ALTER TABLE [dbo].[mark]  WITH CHECK ADD  CONSTRAINT [markToChunkFkConstraint] FOREIGN KEY([chunkFK])
REFERENCES [dbo].[chunk] ([id])
GO
ALTER TABLE [dbo].[mark] CHECK CONSTRAINT [markToChunkFkConstraint]
GO
ALTER TABLE [dbo].[Operator]  WITH CHECK ADD FOREIGN KEY([authFK])
REFERENCES [dbo].[auth] ([id])
GO
ALTER TABLE [dbo].[secretQuestion]  WITH CHECK ADD FOREIGN KEY([authFK])
REFERENCES [dbo].[auth] ([id])
GO
USE [master]
GO
ALTER DATABASE [autolearn] SET  READ_WRITE 
GO
