USE [master]
GO
/****** Object:  Database [SaleDB]    Script Date: 04/09/19 21:37:52 ******/
CREATE DATABASE [SaleDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaleDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SaleDB.mdf' , SIZE = 23744KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaleDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SaleDB_log.ldf' , SIZE = 434944KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SaleDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SaleDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SaleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaleDB] SET  MULTI_USER 
GO
ALTER DATABASE [SaleDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SaleDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SaleDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](250) NOT NULL,
	[role] [int] NULL,
 CONSTRAINT [PK__Account__F3DBC5735B4E5FDD] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [varchar](50) NOT NULL,
	[firstName] [varchar](20) NOT NULL,
	[middleName] [varchar](30) NOT NULL,
	[lastName] [varchar](20) NOT NULL,
	[address] [varchar](250) NOT NULL,
	[phone] [varchar](11) NULL,
	[cusLevel] [int] NULL,
	[sex] [bit] NULL,
	[avatar] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[quantity] [int] NULL,
	[unitPrice] [decimal](18, 0) NULL,
	[total] [decimal](18, 0) NULL,
	[orderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetailsProduct]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetailsProduct](
	[productID] [varchar](50) NOT NULL,
	[orderDetailID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [datetime] NULL,
	[customerID] [varchar](50) NULL,
	[total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
	[unitPrice] [decimal](18, 0) NULL,
	[image] [varchar](300) NULL,
	[details] [varchar](300) NULL,
	[categoryId] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__Product__3213E83F58447982] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductSize](
	[productID] [varchar](50) NOT NULL,
	[sizeID] [varchar](3) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [varchar](3) NOT NULL,
	[sizes] [varchar](3) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'admin', N'c4ca4238a0b923820dcc509a6f75849b', 3)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'giau', N'c4ca4238a0b923820dcc509a6f75849b', 2)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'han', N'c4ca4238a0b923820dcc509a6f75849b', 3)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'khanh', N'c4ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[Category] ([id], [name]) VALUES (N'C001', N'Clothes')
INSERT [dbo].[Category] ([id], [name]) VALUES (N'C002', N'Shirt')
INSERT [dbo].[Category] ([id], [name]) VALUES (N'C003', N'top')
INSERT [dbo].[Category] ([id], [name]) VALUES (N'C004', N'boxer shorts')
INSERT [dbo].[Category] ([id], [name]) VALUES (N'C005', N'jacket')
INSERT [dbo].[Category] ([id], [name]) VALUES (N'C006', N'short')
INSERT [dbo].[Category] ([id], [name]) VALUES (N'C007', N'shoe')
INSERT [dbo].[Customer] ([id], [firstName], [middleName], [lastName], [address], [phone], [cusLevel], [sex], [avatar]) VALUES (N'giau', N'Giau', N'Thi Ngoc', N'Tran', N'Xuan Loc - Dong Nai', N'123456789', 2, 0, N'img/avatar.jpg')
INSERT [dbo].[Customer] ([id], [firstName], [middleName], [lastName], [address], [phone], [cusLevel], [sex], [avatar]) VALUES (N'han', N'Han', N'Hoang Khanh', N'Tran', N'Xuan Loc - Dong Nai', N'123456789', 3, 0, N'img/avatar.jpg')
INSERT [dbo].[Customer] ([id], [firstName], [middleName], [lastName], [address], [phone], [cusLevel], [sex], [avatar]) VALUES (N'khanh', N'Khanh', N'Hoang Ba', N'Nguyen', N'Xuan Loc - Dong Nai', N'123456789', 1, 1, N'img/avatar.jpg')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (16, N'P002', 1, CAST(467823 AS Decimal(18, 0)), CAST(467823 AS Decimal(18, 0)), 14)
INSERT [dbo].[OrderDetails] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (17, N'P006', 5, CAST(21701 AS Decimal(18, 0)), CAST(108505 AS Decimal(18, 0)), 15)
INSERT [dbo].[OrderDetails] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (18, N'P003', 3, CAST(344092 AS Decimal(18, 0)), CAST(1032276 AS Decimal(18, 0)), 15)
INSERT [dbo].[OrderDetails] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (19, N'P005', 1, CAST(301474 AS Decimal(18, 0)), CAST(301474 AS Decimal(18, 0)), 16)
INSERT [dbo].[OrderDetails] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (20, N'P004', 1, CAST(122252 AS Decimal(18, 0)), CAST(122252 AS Decimal(18, 0)), 16)
INSERT [dbo].[OrderDetails] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (21, N'P022', 2, CAST(344624 AS Decimal(18, 0)), CAST(689248 AS Decimal(18, 0)), 17)
INSERT [dbo].[OrderDetails] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (22, N'P004', 1, CAST(122252 AS Decimal(18, 0)), CAST(122252 AS Decimal(18, 0)), 17)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (10, CAST(N'2019-03-16 00:00:00.000' AS DateTime), N'han', CAST(37547 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (11, CAST(N'2019-03-16 00:00:00.000' AS DateTime), N'han', CAST(145560 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (12, CAST(N'2019-03-16 00:00:00.000' AS DateTime), N'han', CAST(4203 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (13, CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'han', CAST(9906 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (14, CAST(N'2019-03-18 00:00:00.000' AS DateTime), N'han', CAST(467823 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (15, CAST(N'2019-03-18 00:00:00.000' AS DateTime), N'han', CAST(1140781 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (16, CAST(N'2019-03-19 00:00:00.000' AS DateTime), N'han', CAST(423726 AS Decimal(18, 0)))
INSERT [dbo].[Orders] ([id], [orderDate], [customerID], [total]) VALUES (17, CAST(N'2019-03-25 00:00:00.000' AS DateTime), N'han', CAST(811500 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P001', N'T-Shirt 1', CAST(29717 AS Decimal(18, 0)), N'img/1.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P002', N'T-Shirt 2', CAST(467823 AS Decimal(18, 0)), N'img/2.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P003', N'T-Shirt 3', CAST(344092 AS Decimal(18, 0)), N'img/3.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P004', N'T-Shirt 4', CAST(122252 AS Decimal(18, 0)), N'img/4.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P005', N'T-Shirt 5', CAST(301474 AS Decimal(18, 0)), N'img/5.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P006', N'T-Shirt 6', CAST(21701 AS Decimal(18, 0)), N'img/6.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P007', N'T-Shirt 7', CAST(208426 AS Decimal(18, 0)), N'img/7.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P008', N'T-Shirt 8', CAST(146714 AS Decimal(18, 0)), N'img/8.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P009', N'T-Shirt 9', CAST(461861 AS Decimal(18, 0)), N'img/9.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P010', N'T-Shirt 10', CAST(360584 AS Decimal(18, 0)), N'img/10.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P011', N'T-Shirt 11', CAST(316946 AS Decimal(18, 0)), N'img/11.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P012', N'T-Shirt 12', CAST(123122 AS Decimal(18, 0)), N'img/12.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P013', N'T-Shirt 13', CAST(92926 AS Decimal(18, 0)), N'img/13.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P014', N'T-Shirt 14', CAST(412914 AS Decimal(18, 0)), N'img/14.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P015', N'T-Shirt 15', CAST(187173 AS Decimal(18, 0)), N'img/15.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P016', N'T-Shirt 16', CAST(174251 AS Decimal(18, 0)), N'img/16.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P017', N'T-Shirt 17', CAST(2614 AS Decimal(18, 0)), N'img/17.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P018', N'T-Shirt 18', CAST(453099 AS Decimal(18, 0)), N'img/18.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P019', N'T-Shirt 19', CAST(100748 AS Decimal(18, 0)), N'img/19.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P020', N'T-Shirt 20', CAST(34664 AS Decimal(18, 0)), N'img/20.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P021', N'T-Shirt 21', CAST(36671 AS Decimal(18, 0)), N'img/21.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P022', N'T-Shirt 22', CAST(344624 AS Decimal(18, 0)), N'img/22.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P023', N'T-Shirt 23', CAST(336721 AS Decimal(18, 0)), N'img/23.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P024', N'T-Shirt 24', CAST(348625 AS Decimal(18, 0)), N'img/24.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P025', N'T-Shirt 25', CAST(22599 AS Decimal(18, 0)), N'img/25.jpg', N'Cool', N'C004', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P026', N'T-Shirt 26', CAST(113094 AS Decimal(18, 0)), N'img/26.jpg', N'Cool', N'C004', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P027', N'T-Shirt 27', CAST(364836 AS Decimal(18, 0)), N'img/27.jpg', N'Cool', N'C004', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P028', N'T-Shirt 28', CAST(29472 AS Decimal(18, 0)), N'img/28.jpg', N'Cool', N'C004', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P029', N'T-Shirt 29', CAST(164942 AS Decimal(18, 0)), N'img/29.jpg', N'Cool', N'C004', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P030', N'T-Shirt 30', CAST(370495 AS Decimal(18, 0)), N'img/30.jpg', N'Cool', N'C004', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P031', N'T-Shirt 31', CAST(98198 AS Decimal(18, 0)), N'img/31.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P032', N'T-Shirt 32', CAST(325011 AS Decimal(18, 0)), N'img/32.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P033', N'T-Shirt 33', CAST(356185 AS Decimal(18, 0)), N'img/33.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P034', N'T-Shirt 34', CAST(247297 AS Decimal(18, 0)), N'img/34.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P035', N'T-Shirt 35', CAST(22139 AS Decimal(18, 0)), N'img/35.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P036', N'T-Shirt 36', CAST(247630 AS Decimal(18, 0)), N'img/36.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P037', N'T-Shirt 37', CAST(493575 AS Decimal(18, 0)), N'img/37.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P038', N'T-Shirt 38', CAST(257326 AS Decimal(18, 0)), N'img/38.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P039', N'T-Shirt 39', CAST(273026 AS Decimal(18, 0)), N'img/39.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P040', N'T-Shirt 40', CAST(432551 AS Decimal(18, 0)), N'img/40.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P041', N'T-Shirt 41', CAST(485790 AS Decimal(18, 0)), N'img/41.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P042', N'T-Shirt 42', CAST(125931 AS Decimal(18, 0)), N'img/42.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P043', N'T-Shirt 43', CAST(334293 AS Decimal(18, 0)), N'img/43.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P044', N'T-Shirt 44', CAST(343287 AS Decimal(18, 0)), N'img/44.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P045', N'T-Shirt 45', CAST(487061 AS Decimal(18, 0)), N'img/45.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P046', N'T-Shirt 46', CAST(188272 AS Decimal(18, 0)), N'img/46.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P047', N'T-Shirt 47', CAST(109486 AS Decimal(18, 0)), N'img/47.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P048', N'T-Shirt 48', CAST(179444 AS Decimal(18, 0)), N'img/48.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P049', N'T-Shirt 49', CAST(448239 AS Decimal(18, 0)), N'img/49.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P050', N'T-Shirt 50', CAST(475325 AS Decimal(18, 0)), N'img/50.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P051', N'T-Shirt 51', CAST(89972 AS Decimal(18, 0)), N'img/51.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P052', N'T-Shirt 52', CAST(191734 AS Decimal(18, 0)), N'img/52.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P053', N'T-Shirt 53', CAST(314143 AS Decimal(18, 0)), N'img/53.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P054', N'T-Shirt 54', CAST(366920 AS Decimal(18, 0)), N'img/54.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P055', N'T-Shirt 55', CAST(96055 AS Decimal(18, 0)), N'img/55.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P056', N'T-Shirt 56', CAST(328346 AS Decimal(18, 0)), N'img/56.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P057', N'T-Shirt 57', CAST(86696 AS Decimal(18, 0)), N'img/57.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P058', N'T-Shirt 58', CAST(120290 AS Decimal(18, 0)), N'img/58.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P059', N'T-Shirt 59', CAST(256648 AS Decimal(18, 0)), N'img/59.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P060', N'T-Shirt 60', CAST(6181 AS Decimal(18, 0)), N'img/60.jpg', N'Cool', N'C005', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P061', N'T-Shirt 61', CAST(484894 AS Decimal(18, 0)), N'img/61.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P062', N'T-Shirt 62', CAST(415949 AS Decimal(18, 0)), N'img/62.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P063', N'T-Shirt 63', CAST(86588 AS Decimal(18, 0)), N'img/63.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P064', N'T-Shirt 64', CAST(117078 AS Decimal(18, 0)), N'img/64.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P065', N'T-Shirt 65', CAST(168918 AS Decimal(18, 0)), N'img/65.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P066', N'T-Shirt 66', CAST(171674 AS Decimal(18, 0)), N'img/66.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P067', N'T-Shirt 67', CAST(209890 AS Decimal(18, 0)), N'img/67.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P068', N'T-Shirt 68', CAST(462052 AS Decimal(18, 0)), N'img/68.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P069', N'T-Shirt 69', CAST(62767 AS Decimal(18, 0)), N'img/69.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P070', N'T-Shirt 70', CAST(189293 AS Decimal(18, 0)), N'img/70.jpg', N'Cool', N'C003', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P071', N'T-Shirt 71', CAST(108140 AS Decimal(18, 0)), N'img/71.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P072', N'T-Shirt 72', CAST(134959 AS Decimal(18, 0)), N'img/72.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P073', N'T-Shirt 73', CAST(469445 AS Decimal(18, 0)), N'img/73.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P074', N'T-Shirt 74', CAST(239373 AS Decimal(18, 0)), N'img/74.jpg', N'Cool', N'C001', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P075', N'T-Shirt 75', CAST(262324 AS Decimal(18, 0)), N'img/75.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P076', N'T-Shirt 76', CAST(462514 AS Decimal(18, 0)), N'img/76.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P077', N'T-Shirt 77', CAST(40570 AS Decimal(18, 0)), N'img/77.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P078', N'T-Shirt 78', CAST(39473 AS Decimal(18, 0)), N'img/78.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P079', N'T-Shirt 79', CAST(367896 AS Decimal(18, 0)), N'img/79.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P080', N'T-Shirt 80', CAST(118483 AS Decimal(18, 0)), N'img/80.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P081', N'T-Shirt 81', CAST(400264 AS Decimal(18, 0)), N'img/81.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P082', N'T-Shirt 82', CAST(426719 AS Decimal(18, 0)), N'img/82.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P083', N'T-Shirt 83', CAST(369859 AS Decimal(18, 0)), N'img/83.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P084', N'T-Shirt 84', CAST(351747 AS Decimal(18, 0)), N'img/84.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P085', N'T-Shirt 85', CAST(335919 AS Decimal(18, 0)), N'img/85.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P086', N'T-Shirt 86', CAST(242980 AS Decimal(18, 0)), N'img/86.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P087', N'T-Shirt 87', CAST(358940 AS Decimal(18, 0)), N'img/87.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P088', N'T-Shirt 88', CAST(437897 AS Decimal(18, 0)), N'img/88.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P089', N'T-Shirt 89', CAST(463073 AS Decimal(18, 0)), N'img/89.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P090', N'T-Shirt 90', CAST(189806 AS Decimal(18, 0)), N'img/90.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P091', N'T-Shirt 91', CAST(156843 AS Decimal(18, 0)), N'img/91.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P092', N'T-Shirt 92', CAST(481967 AS Decimal(18, 0)), N'img/92.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P093', N'T-Shirt 93', CAST(186581 AS Decimal(18, 0)), N'img/93.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P094', N'T-Shirt 94', CAST(170710 AS Decimal(18, 0)), N'img/94.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P095', N'T-Shirt 95', CAST(99612 AS Decimal(18, 0)), N'img/95.jpg', N'Cool', N'C006', N'KOREA', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P096', N'T-Shirt 96', CAST(76161 AS Decimal(18, 0)), N'img/96.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P097', N'T-Shirt 97', CAST(472303 AS Decimal(18, 0)), N'img/97.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P098', N'T-Shirt 98', CAST(224101 AS Decimal(18, 0)), N'img/98.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[Product] ([id], [name], [unitPrice], [image], [details], [categoryId], [country], [status]) VALUES (N'P099', N'T-Shirt 99', CAST(88851 AS Decimal(18, 0)), N'img/99.jpg', N'Cool', N'C002', N'UK', 0)
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P001', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P002', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P003', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P004', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P005', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P006', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P007', N'S04')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P008', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P008', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P009', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P010', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P001', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P001', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P001', N'S04')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P001', N'S05')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P001', N'S06')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P011', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P012', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P013', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P014', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P015', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P016', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P017', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P018', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P019', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P020', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P021', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P022', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P023', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P024', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P025', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P026', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P027', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P028', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P029', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P030', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P031', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P032', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P033', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P034', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P035', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P036', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P037', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P038', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P039', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P040', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P041', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P042', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P043', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P044', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P045', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P046', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P047', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P048', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P049', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P050', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P051', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P052', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P053', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P054', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P055', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P056', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P057', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P058', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P059', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P060', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P061', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P062', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P063', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P064', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P065', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P066', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P067', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P068', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P069', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P070', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P071', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P072', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P073', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P074', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P075', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P076', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P077', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P078', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P079', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P080', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P081', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P082', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P083', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P084', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P085', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P086', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P087', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P088', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P089', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P090', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P091', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P092', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P093', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P094', N'S01')
GO
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P095', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P096', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P097', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P098', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P099', N'S01')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P011', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P012', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P013', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P014', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P015', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P016', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P017', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P018', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P019', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P020', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P021', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P022', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P023', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P024', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P025', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P026', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P027', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P028', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P029', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P030', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P031', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P032', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P033', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P034', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P035', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P036', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P037', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P038', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P039', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P040', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P041', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P042', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P043', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P044', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P045', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P046', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P047', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P048', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P049', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P050', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P051', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P052', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P053', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P054', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P055', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P056', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P057', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P058', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P059', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P060', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P061', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P062', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P063', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P064', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P065', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P066', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P067', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P068', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P069', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P070', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P071', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P072', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P073', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P074', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P075', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P076', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P077', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P078', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P079', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P080', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P081', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P082', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P083', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P084', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P085', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P086', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P087', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P088', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P089', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P090', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P091', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P092', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P093', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P094', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P095', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P096', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P097', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P098', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P099', N'S02')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P011', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P012', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P013', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P014', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P015', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P016', N'S03')
GO
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P017', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P018', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P019', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P020', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P021', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P022', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P023', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P024', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P025', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P026', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P027', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P028', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P029', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P030', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P031', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P032', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P033', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P034', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P035', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P036', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P037', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P038', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P039', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P040', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P041', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P042', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P043', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P044', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P045', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P046', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P047', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P048', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P049', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P050', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P051', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P052', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P053', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P054', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P055', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P056', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P057', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P058', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P059', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P060', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P061', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P062', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P063', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P064', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P065', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P066', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P067', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P068', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P069', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P070', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P071', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P072', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P073', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P074', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P075', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P076', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P077', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P078', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P079', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P080', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P081', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P082', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P083', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P084', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P085', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P086', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P087', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P088', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P089', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P090', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P091', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P092', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P093', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P094', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P095', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P096', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P097', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P098', N'S03')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (N'P099', N'S03')
INSERT [dbo].[Sizes] ([Id], [sizes], [quantity]) VALUES (N'S01', N'XS', 94)
INSERT [dbo].[Sizes] ([Id], [sizes], [quantity]) VALUES (N'S02', N'S', 93)
INSERT [dbo].[Sizes] ([Id], [sizes], [quantity]) VALUES (N'S03', N'M', 92)
INSERT [dbo].[Sizes] ([Id], [sizes], [quantity]) VALUES (N'S04', N'L', 2)
INSERT [dbo].[Sizes] ([Id], [sizes], [quantity]) VALUES (N'S05', N'XL', 1)
INSERT [dbo].[Sizes] ([Id], [sizes], [quantity]) VALUES (N'S06', N'XXL', 1)
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[OrderDetailsProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsProduct_OrderDetails] FOREIGN KEY([orderDetailID])
REFERENCES [dbo].[OrderDetails] ([id])
GO
ALTER TABLE [dbo].[OrderDetailsProduct] CHECK CONSTRAINT [FK_OrderDetailsProduct_OrderDetails]
GO
ALTER TABLE [dbo].[OrderDetailsProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsProduct_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetailsProduct] CHECK CONSTRAINT [FK_OrderDetailsProduct_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_Product]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Sizes] FOREIGN KEY([sizeID])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_Sizes]
GO
/****** Object:  StoredProcedure [dbo].[USP_AddOrderDetails]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_AddOrderDetails]
@productID varchar(50), @quantity int, @unitPrice decimal(18, 0), @total decimal(18, 0), @orderID int
as
begin
	Insert into OrderDetails(productID, quantity, unitPrice, total, orderID) values(@productID, @quantity, @unitPrice, @total, @orderID)
end

GO
/****** Object:  StoredProcedure [dbo].[USP_CheckLogin]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_CheckLogin]
@Username varchar(50),
@Password varchar(250)
AS
BEGIN
	Select * from Account Where username = @Username and password = @password
END

GO
/****** Object:  StoredProcedure [dbo].[USP_CreateProduct]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_CreateProduct]
@ID varchar(50),
@Name varchar(50),
@Price decimal(18, 0),
@Image varchar(300),
@Details varchar(300),
@CategoryID varchar(50),
@state bit
as
begin
	Insert into Product(id, name, unitPrice, image, details, categoryId, state) 
	values(@ID, @Name, @Price, @Image, @Details, @CategoryID, @state)
end

GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteAccount]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_DeleteAccount]
@username varchar(50)
as
begin
	delete account where username = @username
end

GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteCustomer]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_DeleteCustomer]
@id varchar(50)
as
begin
	Delete Customer Where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteProduct]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_DeleteProduct]
@id varchar(50)
as
begin
	update Product set status = 1 where id = @id;
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountById]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[USP_GetAccountById]
@username varchar(50)
as
begin
	Select username, password, role From Account Where username = @username
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetCategoryById]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetCategoryById]
@Id varchar(50)
as
begin
	Select * From Category where Id = @Id
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetCategoryIDByName]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetCategoryIDByName]
@Name varchar(50)
as
begin
	select id from Category where name = @Name
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetCategoryNameById]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetCategoryNameById]
@ID varchar(50)
as
begin 
	select name from Category where id = @ID
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetCountProductsTotal]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetCountProductsTotal]
as
begin
	select count(id) from Product
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetCustomerById]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetCustomerById]
@Username varchar(50)
AS
BEGIN
	Select * From Customer Where id = @Username
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListCategory]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetListCategory]
as
begin
	select * from Category
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListProduct]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetListProduct]
as
begin
	select * from Product where status = 0
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListSize]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[USP_GetListSize]
as
begin
	select * from Sizes
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaxIdOrderTable]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetMaxIdOrderTable]
as
begin
	Select MAX(id) as maxID From Orders
end

GO
/****** Object:  StoredProcedure [dbo].[USP_getProductByID]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_getProductByID]
@id varchar(50)
as
begin
	select * from Product where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetSizeByProductID]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_GetSizeByProductID]
@Id varchar(50)
as
begin
	select Id, sizes, quantity from Sizes Where Id IN (
		select sizeID from ProductSize Where productID = @Id
	)
end

GO
/****** Object:  StoredProcedure [dbo].[USP_LoadListAccount]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_LoadListAccount]
as
begin
	select username, password, role from Account
end

GO
/****** Object:  StoredProcedure [dbo].[USP_LoadListCustomer]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_LoadListCustomer]
as
begin
	SELECT id, firstName, lastName, middleName, address, phone, cusLevel, sex, avatar FROM dbo.Customer
end

GO
/****** Object:  StoredProcedure [dbo].[USP_SearchAccountByUsername]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_SearchAccountByUsername]
@username varchar(50)
as
begin
	select username, password, role from Account WHERE username LIKE @username
end

GO
/****** Object:  StoredProcedure [dbo].[USP_SetStatusProduct]    Script Date: 04/09/19 21:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[USP_SetStatusProduct]
@id varchar(50)
as
begin
	update Product set Status = 0 where id = @id
end

GO
USE [master]
GO
ALTER DATABASE [SaleDB] SET  READ_WRITE 
GO
