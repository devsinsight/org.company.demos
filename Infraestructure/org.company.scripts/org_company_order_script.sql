USE [master]
GO
/****** Object:  Database [DbOrder]    Script Date: 3/22/2018 10:01:48 AM ******/
CREATE DATABASE [DbOrder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbOrder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DbOrder_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbOrder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DbOrder_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DbOrder] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbOrder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbOrder] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [DbOrder] SET ANSI_NULLS ON 
GO
ALTER DATABASE [DbOrder] SET ANSI_PADDING ON 
GO
ALTER DATABASE [DbOrder] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [DbOrder] SET ARITHABORT ON 
GO
ALTER DATABASE [DbOrder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbOrder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbOrder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbOrder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbOrder] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [DbOrder] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [DbOrder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbOrder] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [DbOrder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbOrder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbOrder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbOrder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbOrder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbOrder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbOrder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbOrder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbOrder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbOrder] SET RECOVERY FULL 
GO
ALTER DATABASE [DbOrder] SET  MULTI_USER 
GO
ALTER DATABASE [DbOrder] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [DbOrder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbOrder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbOrder] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DbOrder] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbOrder', N'ON'
GO
ALTER DATABASE [DbOrder] SET QUERY_STORE = OFF
GO
USE [DbOrder]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DbOrder]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/22/2018 10:01:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [uniqueidentifier] NULL,
	[StatusId] [int] NOT NULL,
	[Number] [varchar](25) NULL,
	[OrderDate] [datetime2](7) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK__Order__C3905BCF1B6A3198] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/22/2018 10:01:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/22/2018 10:01:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerId], [StatusId], [Number], [OrderDate], [Active]) VALUES (11, N'7be5101b-9566-4e1f-48bc-08d4f34137e8', 1, N'7BE5101B-9517090322442811', CAST(N'2017-09-03T22:44:28.1199839' AS DateTime2), 1)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [StatusId], [Number], [OrderDate], [Active]) VALUES (12, N'7be5101b-9566-4e1f-48bc-08d4f34137e8', 1, N'7BE5101B-9518032013090739', CAST(N'2018-03-20T13:09:07.3940041' AS DateTime2), 1)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [StatusId], [Number], [OrderDate], [Active]) VALUES (13, N'7be5101b-9566-4e1f-48bc-08d4f34137e8', 1, N'7BE5101B-9518032015452639', CAST(N'2018-03-20T15:45:26.3967714' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (11, 5, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (11, 2, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (11, 4, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (11, 6, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (12, 5, 6)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (12, 2, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (13, 2, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (13, 1, 10)
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [Name], [Active]) VALUES (1, N'Created', 1)
INSERT [dbo].[Status] ([StatusId], [Name], [Active]) VALUES (2, N'Completed', 1)
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__5CA1C101] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__5CA1C101]
GO
USE [master]
GO
ALTER DATABASE [DbOrder] SET  READ_WRITE 
GO
