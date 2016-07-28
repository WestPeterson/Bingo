USE [master]
GO
CREATE DATABASE [Bingo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bingo', FILENAME = N'D:\Default\Bingo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bingo_log', FILENAME = N'D:\Default\Bingo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bingo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bingo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bingo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bingo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bingo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bingo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bingo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bingo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bingo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Bingo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bingo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bingo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bingo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bingo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bingo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bingo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bingo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bingo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bingo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bingo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bingo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bingo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bingo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bingo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bingo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bingo] SET RECOVERY FULL 
GO
ALTER DATABASE [Bingo] SET  MULTI_USER 
GO
ALTER DATABASE [Bingo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bingo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bingo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bingo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bingo', N'ON'
GO
USE [Bingo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWords]
AS
	SELECT TOP 25 Word FROM Bingo ORDER BY NewID()

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bingo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](100) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_Bingo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueWord] ON [dbo].[Bingo]
(
	[Word] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bingo] ADD  CONSTRAINT [DF_Bingo_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
USE [master]
GO
ALTER DATABASE [Bingo] SET  READ_WRITE 
GO
