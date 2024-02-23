USE [master]
GO
/****** Object:  Database [OpenDest]    Script Date: 3/11/2021 11:53:26 PM ******/
CREATE DATABASE [OpenDest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OpenDest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OpenDest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OpenDest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OpenDest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OpenDest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OpenDest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OpenDest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OpenDest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OpenDest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OpenDest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OpenDest] SET ARITHABORT OFF 
GO
ALTER DATABASE [OpenDest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OpenDest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OpenDest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OpenDest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OpenDest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OpenDest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OpenDest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OpenDest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OpenDest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OpenDest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OpenDest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OpenDest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OpenDest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OpenDest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OpenDest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OpenDest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OpenDest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OpenDest] SET RECOVERY FULL 
GO
ALTER DATABASE [OpenDest] SET  MULTI_USER 
GO
ALTER DATABASE [OpenDest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OpenDest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OpenDest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OpenDest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OpenDest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OpenDest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OpenDest', N'ON'
GO
ALTER DATABASE [OpenDest] SET QUERY_STORE = OFF
GO
USE [OpenDest]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/11/2021 11:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[createdon] [datetime] NULL,
	[createdby] [varchar](128) NULL,
	[updatedon] [datetime] NULL,
	[updatedby] [varchar](128) NULL,
	[isactive] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productrating]    Script Date: 3/11/2021 11:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productrating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[rate] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[createdon] [datetime] NOT NULL,
	[createdby] [varchar](128) NOT NULL,
	[isactive] [bit] NULL,
 CONSTRAINT [PK_productrating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/11/2021 11:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[unitprice] [decimal](8, 0) NOT NULL,
	[companyid] [int] NOT NULL,
	[createdon] [datetime] NULL,
	[createdby] [varchar](128) NULL,
	[updatedon] [datetime] NULL,
	[updatedby] [varchar](128) NULL,
	[isactive] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSales]    Script Date: 3/11/2021 11:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NOT NULL,
	[qtysold] [int] NOT NULL,
	[unitprice] [decimal](8, 2) NOT NULL,
	[createdon] [datetime] NULL,
	[createdby] [varchar](128) NULL,
	[updatedon] [datetime] NULL,
	[updatedby] [varchar](128) NULL,
	[isactive] [bit] NULL,
 CONSTRAINT [PK_ProductSales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[productrating]  WITH CHECK ADD  CONSTRAINT [FK_productrating_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[productrating] CHECK CONSTRAINT [FK_productrating_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brand] FOREIGN KEY([companyid])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brand]
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductSales_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductSales] CHECK CONSTRAINT [FK_ProductSales_Products]
GO
ALTER TABLE [dbo].[productrating]  WITH CHECK ADD  CONSTRAINT [chk_Ratings] CHECK  (([rate]>=(0) AND [rate]<=(5)))
GO
ALTER TABLE [dbo].[productrating] CHECK CONSTRAINT [chk_Ratings]
GO
USE [master]
GO
ALTER DATABASE [OpenDest] SET  READ_WRITE 
GO