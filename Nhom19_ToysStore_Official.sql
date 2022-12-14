USE [master]
GO
/****** Object:  Database [Nhom19_ToysStore]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE DATABASE [Nhom19_ToysStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nhom19_ToysStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Nhom19_ToysStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nhom19_ToysStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Nhom19_ToysStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nhom19_ToysStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nhom19_ToysStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nhom19_ToysStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nhom19_ToysStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nhom19_ToysStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nhom19_ToysStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nhom19_ToysStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET RECOVERY FULL 
GO
ALTER DATABASE [Nhom19_ToysStore] SET  MULTI_USER 
GO
ALTER DATABASE [Nhom19_ToysStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nhom19_ToysStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nhom19_ToysStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nhom19_ToysStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nhom19_ToysStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nhom19_ToysStore', N'ON'
GO
ALTER DATABASE [Nhom19_ToysStore] SET QUERY_STORE = OFF
GO
USE [Nhom19_ToysStore]
GO
/****** Object:  User [hanh]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE USER [hanh] FOR LOGIN [hanh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [cus]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE USER [cus] FOR LOGIN [cus] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [c]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE USER [c] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bo]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE USER [bo] FOR LOGIN [bo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ben]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE USER [ben] FOR LOGIN [ben] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [b]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE USER [b] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [a]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE USER [a] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [role_for_customer]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE ROLE [role_for_customer]
GO
ALTER ROLE [role_for_customer] ADD MEMBER [hanh]
GO
ALTER ROLE [role_for_customer] ADD MEMBER [cus]
GO
ALTER ROLE [role_for_customer] ADD MEMBER [c]
GO
ALTER ROLE [role_for_customer] ADD MEMBER [ben]
GO
ALTER ROLE [role_for_customer] ADD MEMBER [b]
GO
ALTER ROLE [role_for_customer] ADD MEMBER [a]
GO
/****** Object:  Schema [role_for_customer]    Script Date: 25/11/2022 7:47:51 AM ******/
CREATE SCHEMA [role_for_customer]
GO
/****** Object:  UserDefinedFunction [dbo].[AddOrderNumber]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[AddOrderNumber]()
returns varchar(10)
as
begin
 declare @string varchar(10)
 set @string = 'ord'+'-'+CONVERT(varchar(4), (select count(order_number)+1000 from [Order])) 
 return @string
end
GO
/****** Object:  UserDefinedFunction [dbo].[AddPaymentID]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[AddPaymentID]()
returns varchar(10)
as
begin
 declare @string varchar(10)
 set @string = 'pay'+'-'+CONVERT(varchar(4), (select count(payment_id)+1000 from Payment)) 
 return @string
end
GO
/****** Object:  UserDefinedFunction [dbo].[AddToy]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[AddToy]()
returns varchar(10)
as
begin
 declare @id int
 set @id = (select count(toy_id)+100 from Toys)
 if (exists (select * from Toys where toy_id = @id))
  set @id = (select count(toy_id)+101 from Toys) 
 return @id
end
GO
/****** Object:  UserDefinedFunction [dbo].[AddVariation]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[AddVariation](@toy_id int)
returns varchar(10)
as
begin
 declare @string varchar(10)
 set @string = 'vari'+'-'+ CONVERT(varchar(3),@toy_id) +'-'+CONVERT(varchar(2), (select count(variation_id)+1 from Variation where product = @toy_id)) 
 return @string
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetOrderMoney]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetOrderMoney](@order varchar(10))
returns float
as
begin
 declare @money float
 select @money = order_total + tax from [Order] where order_number = @order
 return @money
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetProductPrice]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetProductPrice](@product int)
returns float
as
begin
 declare @price float
 select @price = price from Toys where toy_id = @product
 return @price
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetQuantity]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetQuantity](@variation varchar(10))
returns int
as
begin
 declare @quantity int

 select @quantity = sum(quantity) 
 from Cart_Items
 where is_active = 0 and [user] = CURRENT_USER
 group by variation
 having variation = @variation

 return @quantity
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetStock]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetStock](@variation_id varchar(10))
returns int
as
begin
 return (select variation_stock from Variation where variation_id = @variation_id)
end
GO
/****** Object:  UserDefinedFunction [dbo].[IsSoldOut]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[IsSoldOut](@variation_id varchar(10))
returns bit
as
begin
 DECLARE @result bit
 if(exists (select * from Variation where variation_id = @variation_id and variation_stock > 0  and is_active = 1))
   SET @result = 0
 else
   SET @result = 1
 return @result
end
GO
/****** Object:  UserDefinedFunction [dbo].[LastCart]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[LastCart]()
returns datetime
as
begin
 declare @last_cart_id datetime
 SELECT TOP 1 @last_cart_id = card_id FROM Cart ORDER BY card_id DESC
 return @last_cart_id
end
GO
/****** Object:  UserDefinedFunction [dbo].[OrderTotal]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[OrderTotal](@user varchar(100))
returns float
as
begin
 declare @sum float
 select @sum = sum(quantity * price)
 from Cart_Items join Variation
 on Cart_Items.variation = Variation.variation_id
 join Toys
 on Variation.product = Toys.toy_id
 where Cart_Items.is_active = 0
 group by [user]
 having [user] = @user

 return @sum
end
GO
/****** Object:  UserDefinedFunction [dbo].[setTax]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[setTax]()
returns float
as
begin
  declare @settax float
  set @settax = 0.02
  return @settax
end
GO
/****** Object:  UserDefinedFunction [dbo].[Tax]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Tax](@user varchar(100))
returns float
as
begin
  declare @tax float
  set @tax = dbo.setTax() * dbo.OrderTotal(@user)
  return @tax
end
GO
/****** Object:  UserDefinedFunction [dbo].[WhatToy]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[WhatToy](@variation varchar(10))
returns int
as
begin
 declare @toy_id int
 select @toy_id = product from Variation where variation_id = @variation
 return @toy_id
end
GO
/****** Object:  Table [dbo].[Toys]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toys](
	[toy_id] [int] NOT NULL,
	[toy_name] [varchar](200) NOT NULL,
	[category] [varchar](50) NULL,
	[description] [varchar](500) NULL,
	[price] [float] NOT NULL,
	[image] [varchar](20) NULL,
	[stock] [int] NULL,
	[is_available] [varchar](11) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Toys] PRIMARY KEY CLUSTERED 
(
	[toy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Random6Toys]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Random6Toys]
as
select top 6 toy_id,toy_name,price,[image] from Toys
order by newid()
GO
/****** Object:  Table [dbo].[Cart_Items]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Items](
	[user] [varchar](100) NULL,
	[product] [int] NOT NULL,
	[variation] [varchar](10) NOT NULL,
	[cart_items_id] [datetime] NOT NULL,
	[quantity] [int] NOT NULL,
	[is_active] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variation]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variation](
	[variation_id] [varchar](10) NOT NULL,
	[product] [int] NOT NULL,
	[color] [varchar](20) NOT NULL,
	[size] [varchar](20) NOT NULL,
	[variation_stock] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[created_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[variation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[OutOfStock]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[OutOfStock]
as
select sum(quantity) as quantity_of_cart, variation_stock from 
Variation join Cart_Items
on Variation.variation_id = Cart_Items.variation
where [user] = CURRENT_USER and Cart_Items.is_active = 0
group by Variation.variation_id, Variation.variation_stock
having sum(quantity) > variation_stock
GO
/****** Object:  View [dbo].[MyCartt]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MyCartt]
as
 select distinct(Cart_Items.variation),Toys.toy_name,Variation.color, Variation.size, ne.tong
 from Cart_Items join Variation
 on Cart_Items.variation = Variation.variation_id
 join (select variation, sum(quantity) as tong from Cart_Items where [user] = CURRENT_USER and is_active = 0 group by variation) ne
 on Cart_Items.variation = ne.variation
 join Toys
 on Variation.product = Toys.toy_id
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_number] [varchar](10) NOT NULL,
	[user] [varchar](100) NOT NULL,
	[payment] [varchar](10) NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](100) NOT NULL,
	[order_note] [varchar](500) NULL,
	[order_total] [float] NULL,
	[tax] [float] NULL,
	[status] [varchar](10) NOT NULL,
	[is_payment] [bit] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MyOrder]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MyOrder] as
select order_number,payment,first_name,last_name,phone,email,[address],order_note,order_total,tax,is_payment
from [Order]
where [user] = CURRENT_USER
GO
/****** Object:  View [dbo].[MyPayment]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MyPayment]
as
select [Order].order_number,first_name,last_name,money_total,is_payment
from [Order] join
(select order_number,sum(order_total+tax) as money_total
from [Order]
group by order_number) ne
on [Order].order_number = ne.order_number
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [varchar](10) NOT NULL,
	[user] [varchar](100) NOT NULL,
	[payment_method] [varchar](100) NOT NULL,
	[amount_paid] [float] NULL,
	[status] [varchar](100) NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AllOrders]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AllOrders]
as
select order_number,payment_method,first_name,last_name,phone,email,[address],order_note,order_total,tax
from [Order] left join Payment
on [Order].payment = Payment.payment_id


GO
/****** Object:  View [dbo].[AllOrdersToday]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AllOrdersToday]
as
select order_number,payment_method,first_name,last_name,phone,email,[address],order_note,order_total,tax
from [Order] left join Payment
on [Order].payment = Payment.payment_id
where cast(created_date as date) =  cast(getdate() as date)

GO
/****** Object:  View [dbo].[UserPermission]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[UserPermission]
as
SELECT  pri.name As Username
,       pri.type_desc AS [User Type]
,       permit.permission_name AS [Permission]
,       permit.state_desc AS [Permission State]
,       permit.class_desc Class
,       object_name(permit.major_id) AS [Object Name]
FROM    sys.database_principals pri
LEFT JOIN
        sys.database_permissions permit
ON      permit.grantee_principal_id = pri.principal_id
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[card_id] [datetime] NOT NULL,
	[is_available] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_slug] [varchar](50) NOT NULL,
	[category_fullname] [varchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[order] [varchar](10) NOT NULL,
	[payment] [varchar](10) NULL,
	[user] [varchar](100) NOT NULL,
	[product] [int] NOT NULL,
	[variations] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[product_price] [float] NOT NULL,
	[ordered] [bit] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [varchar](100) NOT NULL,
	[pass] [varchar](255) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[email] [varchar](100) NULL,
	[phone_number] [varchar](10) NULL,
	[avatar] [varchar](20) NULL,
	[is_admin] [bit] NOT NULL,
	[date_joined] [datetime] NOT NULL,
	[last_login] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T12:42:33.980' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T16:48:37.377' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T16:49:55.940' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T16:50:12.777' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T16:50:26.730' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T17:25:00.070' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T17:43:30.090' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T17:43:41.030' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T21:47:15.647' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T21:47:41.090' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T21:48:00.800' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T22:14:41.943' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T22:14:54.210' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-22T22:15:01.740' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T10:36:47.670' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T10:36:51.360' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T14:49:03.380' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T14:49:04.333' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T14:52:23.947' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T14:52:39.037' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T14:52:40.403' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T15:00:22.817' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-23T15:23:50.377' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-24T10:21:30.960' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-24T10:21:44.620' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-24T15:27:36.897' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-24T15:27:49.633' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-24T15:29:54.933' AS DateTime), 1)
INSERT [dbo].[Cart] ([card_id], [is_available]) VALUES (CAST(N'2022-11-24T21:56:39.930' AS DateTime), 1)
GO
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 103, N'vari-103-1', CAST(N'2022-11-23T10:36:47.670' AS DateTime), 1, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 103, N'vari-103-1', CAST(N'2022-11-23T10:36:51.360' AS DateTime), 1, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 102, N'vari-102-1', CAST(N'2022-11-23T14:49:03.380' AS DateTime), 2, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 102, N'vari-102-1', CAST(N'2022-11-23T14:49:04.333' AS DateTime), 2, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 102, N'vari-102-1', CAST(N'2022-11-23T14:52:39.037' AS DateTime), 3, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 102, N'vari-102-2', CAST(N'2022-11-23T15:00:22.817' AS DateTime), 1, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 102, N'vari-102-2', CAST(N'2022-11-23T15:23:50.377' AS DateTime), 2, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 102, N'vari-102-1', CAST(N'2022-11-24T10:21:30.960' AS DateTime), 1, 0)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'ben', 102, N'vari-102-2', CAST(N'2022-11-24T15:27:36.897' AS DateTime), 2, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'ben', 102, N'vari-102-1', CAST(N'2022-11-24T15:27:49.633' AS DateTime), 1, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'ben', 102, N'vari-102-1', CAST(N'2022-11-24T15:29:54.933' AS DateTime), 5, 1)
INSERT [dbo].[Cart_Items] ([user], [product], [variation], [cart_items_id], [quantity], [is_active]) VALUES (N'dbo', 102, N'vari-102-1', CAST(N'2022-11-24T21:56:39.930' AS DateTime), 1, 0)
GO
INSERT [dbo].[Category] ([category_slug], [category_fullname]) VALUES (N'action-figures', N'Action Figures')
INSERT [dbo].[Category] ([category_slug], [category_fullname]) VALUES (N'collectible-figures', N'Collectible Figures')
INSERT [dbo].[Category] ([category_slug], [category_fullname]) VALUES (N'dan-gian', N'Tro Choi Dan Gian')
INSERT [dbo].[Category] ([category_slug], [category_fullname]) VALUES (N'nerf', N'Neft and Toy Blasters')
INSERT [dbo].[Category] ([category_slug], [category_fullname]) VALUES (N'vehicles', N'Phuong Tien Giao Thon')
GO
INSERT [dbo].[Order] ([order_number], [user], [payment], [first_name], [last_name], [phone], [email], [address], [order_note], [order_total], [tax], [status], [is_payment], [created_date], [update_at]) VALUES (N'ord-1000', N'dbo', NULL, N'b', N'b', N'123', N'b@b', N'hue', N'can than', 31, 0.62, N'New', 0, CAST(N'2022-11-23T14:37:18.847' AS DateTime), CAST(N'2022-11-23T14:37:18.847' AS DateTime))
INSERT [dbo].[Order] ([order_number], [user], [payment], [first_name], [last_name], [phone], [email], [address], [order_note], [order_total], [tax], [status], [is_payment], [created_date], [update_at]) VALUES (N'ord-1001', N'dbo', NULL, N'ben', N'ben', N'233', N'b@b', N'hue', N'can than', 20, 0.4, N'New', 0, CAST(N'2022-11-23T14:49:40.097' AS DateTime), CAST(N'2022-11-23T14:49:40.097' AS DateTime))
INSERT [dbo].[Order] ([order_number], [user], [payment], [first_name], [last_name], [phone], [email], [address], [order_note], [order_total], [tax], [status], [is_payment], [created_date], [update_at]) VALUES (N'ord-1002', N'dbo', NULL, N'a', N'a', N'a', N'a', N'a', N'can than', 15, 0.3, N'New', 0, CAST(N'2022-11-23T14:55:28.457' AS DateTime), CAST(N'2022-11-23T14:55:28.457' AS DateTime))
INSERT [dbo].[Order] ([order_number], [user], [payment], [first_name], [last_name], [phone], [email], [address], [order_note], [order_total], [tax], [status], [is_payment], [created_date], [update_at]) VALUES (N'ord-1003', N'dbo', N'pay-1000', N'ben', N'quang', N'0355', N'ben@ben', N'hue', N'hihi', 15, 0.3, N'New', 1, CAST(N'2022-11-23T16:08:30.363' AS DateTime), CAST(N'2022-11-23T16:08:30.363' AS DateTime))
INSERT [dbo].[Order] ([order_number], [user], [payment], [first_name], [last_name], [phone], [email], [address], [order_note], [order_total], [tax], [status], [is_payment], [created_date], [update_at]) VALUES (N'ord-1004', N'ben', NULL, N'quang', N'thang', N'015782328', N'ben@ben', N'hue', N'goi hang can than chac chan', 15, 0.3, N'New', 0, CAST(N'2022-11-24T15:29:19.780' AS DateTime), CAST(N'2022-11-24T15:29:19.780' AS DateTime))
INSERT [dbo].[Order] ([order_number], [user], [payment], [first_name], [last_name], [phone], [email], [address], [order_note], [order_total], [tax], [status], [is_payment], [created_date], [update_at]) VALUES (N'ord-1005', N'ben', N'pay-1001', N'quang', N'thang', N'0355123543', N'ben@ben', N'hue', N'don nay cung phai goi can than', 25, 0.5, N'New', 1, CAST(N'2022-11-24T15:30:32.457' AS DateTime), CAST(N'2022-11-24T15:30:32.457' AS DateTime))
GO
INSERT [dbo].[OrderProduct] ([order], [payment], [user], [product], [variations], [quantity], [product_price], [ordered], [created_date], [update_at]) VALUES (N'ord-1000', NULL, N'dbo', 103, N'vari-103-1', 2, 15.5, 1, CAST(N'2022-11-23T14:37:18.870' AS DateTime), CAST(N'2022-11-23T14:37:18.870' AS DateTime))
INSERT [dbo].[OrderProduct] ([order], [payment], [user], [product], [variations], [quantity], [product_price], [ordered], [created_date], [update_at]) VALUES (N'ord-1001', NULL, N'dbo', 102, N'vari-102-1', 4, 5, 1, CAST(N'2022-11-23T14:49:40.123' AS DateTime), CAST(N'2022-11-23T14:49:40.123' AS DateTime))
INSERT [dbo].[OrderProduct] ([order], [payment], [user], [product], [variations], [quantity], [product_price], [ordered], [created_date], [update_at]) VALUES (N'ord-1002', NULL, N'dbo', 102, N'vari-102-1', 3, 5, 1, CAST(N'2022-11-23T14:55:28.483' AS DateTime), CAST(N'2022-11-23T14:55:28.483' AS DateTime))
INSERT [dbo].[OrderProduct] ([order], [payment], [user], [product], [variations], [quantity], [product_price], [ordered], [created_date], [update_at]) VALUES (N'ord-1003', NULL, N'dbo', 102, N'vari-102-2', 3, 5, 1, CAST(N'2022-11-23T16:08:30.383' AS DateTime), CAST(N'2022-11-23T16:08:30.383' AS DateTime))
INSERT [dbo].[OrderProduct] ([order], [payment], [user], [product], [variations], [quantity], [product_price], [ordered], [created_date], [update_at]) VALUES (N'ord-1004', NULL, N'ben', 102, N'vari-102-2', 2, 5, 1, CAST(N'2022-11-24T15:29:19.800' AS DateTime), CAST(N'2022-11-24T15:29:19.800' AS DateTime))
INSERT [dbo].[OrderProduct] ([order], [payment], [user], [product], [variations], [quantity], [product_price], [ordered], [created_date], [update_at]) VALUES (N'ord-1004', NULL, N'ben', 102, N'vari-102-1', 1, 5, 1, CAST(N'2022-11-24T15:29:19.803' AS DateTime), CAST(N'2022-11-24T15:29:19.803' AS DateTime))
INSERT [dbo].[OrderProduct] ([order], [payment], [user], [product], [variations], [quantity], [product_price], [ordered], [created_date], [update_at]) VALUES (N'ord-1005', NULL, N'ben', 102, N'vari-102-1', 5, 5, 1, CAST(N'2022-11-24T15:30:32.480' AS DateTime), CAST(N'2022-11-24T15:30:32.480' AS DateTime))
GO
INSERT [dbo].[Payment] ([payment_id], [user], [payment_method], [amount_paid], [status], [created_at]) VALUES (N'pay-1000', N'dbo', N'bidv', 15.3, N'New', CAST(N'2022-11-24T10:00:01.067' AS DateTime))
INSERT [dbo].[Payment] ([payment_id], [user], [payment_method], [amount_paid], [status], [created_at]) VALUES (N'pay-1001', N'ben', N'bidv', 25.5, N'New', CAST(N'2022-11-24T15:34:02.680' AS DateTime))
GO
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (100, N'Transformers Studio', N'action-figures', N'Studio Series has always allowed fans to reach past the big screen and build the ultimate Transformers collection inspired by iconic movie scenes from the Transformers movie universe. Now, the Studio Series line is expanding to include the epic moments and characters from the classic The Transformers: The Movie, bringing fans a whole new series of screen-inspired figures to collect! (Each sold separately. Subject to availability.)This Studio Series 86-07 Leader Class The Transformers: The Movie-', 10, N'100.jpg', NULL, N'already', CAST(N'2022-11-22T12:17:47.110' AS DateTime), CAST(N'2022-11-22T12:17:47.110' AS DateTime))
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (101, N'Marvel Spider-Man', N'action-figures', N'Twist Turn Flex your power Kids can bend, flex, pose, and play with their favorite Marvel Super Heroes and Villains with these super agile Spider-Man Bend and Flex Figures Collect characters inspired by Marvel Universe with a twist (each sold separately). These stylized Super Hero action figures have bendable arms and legs that can bend and hold in place for the perfect pose There''s plenty of heroic daring and dramatic action when kids shape their Bend and Flex figures into plenty of playful', 50, N'101.jpg', NULL, N'already', CAST(N'2022-11-22T12:18:12.923' AS DateTime), CAST(N'2022-11-22T12:18:12.923' AS DateTime))
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (102, N'Con Lan', N'dan-gian', N'dam chat Viet Nam', 5, N'102.jpg', NULL, N'already', CAST(N'2022-11-22T12:17:23.810' AS DateTime), CAST(N'2022-11-22T12:17:23.810' AS DateTime))
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (103, N'Den Ong Sao', N'dan-gian', N'dam chat trung thu', 15.5, N'103.jpg', NULL, N'already', CAST(N'2022-11-22T12:18:33.693' AS DateTime), CAST(N'2022-11-22T12:18:33.693' AS DateTime))
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (104, N'To He', N'dan-gian', N'tro ve tuoi tho', 2.2, N'104.jpg', NULL, N'already', CAST(N'2022-11-22T12:18:40.473' AS DateTime), CAST(N'2022-11-22T12:18:40.473' AS DateTime))
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (105, N'Con Dieu', N'dan-gian', N'tro ve tuoi tho', 30, N'105.jpg', NULL, N'already', CAST(N'2022-11-23T07:58:16.530' AS DateTime), CAST(N'2022-11-23T07:58:16.530' AS DateTime))
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (106, N'Con Quay', N'dan-gian', N'tro ve tuoi tho', 40, N'106.jpg', NULL, N'already', CAST(N'2022-11-23T07:58:47.423' AS DateTime), CAST(N'2022-11-23T07:58:47.423' AS DateTime))
INSERT [dbo].[Toys] ([toy_id], [toy_name], [category], [description], [price], [image], [stock], [is_available], [created_date], [modified_date]) VALUES (107, N'Den Keo Quan', N'dan-gian', N'dam chat trung thu', 100, N'107.jpg', NULL, N'already', CAST(N'2022-11-23T07:59:06.190' AS DateTime), CAST(N'2022-11-23T07:59:06.190' AS DateTime))
GO
INSERT [dbo].[User] ([user_id], [pass], [firstname], [lastname], [email], [phone_number], [avatar], [is_admin], [date_joined], [last_login]) VALUES (N'ben', N'123', N'ben', N'quang', N'ben1905@gmail.com', N'0123456', NULL, 0, CAST(N'2022-11-22T12:28:39.403' AS DateTime), NULL)
INSERT [dbo].[User] ([user_id], [pass], [firstname], [lastname], [email], [phone_number], [avatar], [is_admin], [date_joined], [last_login]) VALUES (N'bo', N'123', N'bao', N'thy', N'baothy2906@gmail.com', N'0123465', NULL, 1, CAST(N'2022-11-22T12:29:22.333' AS DateTime), NULL)
INSERT [dbo].[User] ([user_id], [pass], [firstname], [lastname], [email], [phone_number], [avatar], [is_admin], [date_joined], [last_login]) VALUES (N'cus', N'123', N'cus', N'cus', N'cus@123', N'123', NULL, 0, CAST(N'2022-11-24T10:59:16.683' AS DateTime), NULL)
INSERT [dbo].[User] ([user_id], [pass], [firstname], [lastname], [email], [phone_number], [avatar], [is_admin], [date_joined], [last_login]) VALUES (N'dbo', N'123', N'bao', N'thyy', N'baothy2906@gmail.com', N'035512345', NULL, 1, CAST(N'2022-11-22T16:49:37.740' AS DateTime), NULL)
INSERT [dbo].[User] ([user_id], [pass], [firstname], [lastname], [email], [phone_number], [avatar], [is_admin], [date_joined], [last_login]) VALUES (N'hanh', N'123', N'nguyen', N'hanh', N'hanh@hanh', N'123', NULL, 0, CAST(N'2022-11-24T10:41:43.820' AS DateTime), NULL)
GO
INSERT [dbo].[Variation] ([variation_id], [product], [color], [size], [variation_stock], [is_active], [created_date]) VALUES (N'vari-102-1', 102, N'white', N'small', 4, 1, CAST(N'2022-11-22T12:19:34.547' AS DateTime))
INSERT [dbo].[Variation] ([variation_id], [product], [color], [size], [variation_stock], [is_active], [created_date]) VALUES (N'vari-102-2', 102, N'white', N'medium', 18, 1, CAST(N'2022-11-22T12:20:00.950' AS DateTime))
INSERT [dbo].[Variation] ([variation_id], [product], [color], [size], [variation_stock], [is_active], [created_date]) VALUES (N'vari-103-1', 103, N'white', N'large', 12, 1, CAST(N'2022-11-22T12:20:30.080' AS DateTime))
INSERT [dbo].[Variation] ([variation_id], [product], [color], [size], [variation_stock], [is_active], [created_date]) VALUES (N'vari-104-1', 104, N'white', N'large', 20, 1, CAST(N'2022-11-24T19:03:43.980' AS DateTime))
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_card_id]  DEFAULT (getdate()) FOR [card_id]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((1)) FOR [is_available]
GO
ALTER TABLE [dbo].[Cart_Items] ADD  CONSTRAINT [DF__Cart_Item__is_ac__73BA3083]  DEFAULT ((0)) FOR [is_active]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ('New') FOR [status]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [is_payment]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  CONSTRAINT [DF__OrderProd__order__70DDC3D8]  DEFAULT ((1)) FOR [ordered]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  CONSTRAINT [DF__OrderProd__creat__71D1E811]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  CONSTRAINT [DF__OrderProd__updat__72C60C4A]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Toys] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Toys] ADD  DEFAULT ('already') FOR [is_available]
GO
ALTER TABLE [dbo].[Toys] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Toys] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [date_joined]
GO
ALTER TABLE [dbo].[Variation] ADD  DEFAULT ((0)) FOR [variation_stock]
GO
ALTER TABLE [dbo].[Variation] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[Variation] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD FOREIGN KEY([cart_items_id])
REFERENCES [dbo].[Cart] ([card_id])
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD FOREIGN KEY([product])
REFERENCES [dbo].[Toys] ([toy_id])
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD FOREIGN KEY([variation])
REFERENCES [dbo].[Variation] ([variation_id])
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD FOREIGN KEY([user])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([payment])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([user])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__order__73BA3083] FOREIGN KEY([order])
REFERENCES [dbo].[Order] ([order_number])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__order__73BA3083]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__payme__74AE54BC] FOREIGN KEY([payment])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__payme__74AE54BC]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__produ__75A278F5] FOREIGN KEY([product])
REFERENCES [dbo].[Toys] ([toy_id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__produ__75A278F5]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__varia__76969D2E] FOREIGN KEY([variations])
REFERENCES [dbo].[Variation] ([variation_id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__varia__76969D2E]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProdu__user__778AC167] FOREIGN KEY([user])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProdu__user__778AC167]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([user])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Toys]  WITH CHECK ADD FOREIGN KEY([category])
REFERENCES [dbo].[Category] ([category_slug])
GO
ALTER TABLE [dbo].[Variation]  WITH CHECK ADD FOREIGN KEY([product])
REFERENCES [dbo].[Toys] ([toy_id])
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD  CONSTRAINT [check_quantity_behon_stock] CHECK  (([quantity]<=[dbo].[GetStock]([variation])))
GO
ALTER TABLE [dbo].[Cart_Items] CHECK CONSTRAINT [check_quantity_behon_stock]
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD  CONSTRAINT [check_quantity_not_negative] CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Cart_Items] CHECK CONSTRAINT [check_quantity_not_negative]
GO
ALTER TABLE [dbo].[Toys]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[AddCartItems]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddCartItems] @variation_id varchar(10), @quantity int
as
begin
begin tran
 begin try
  insert into Cart(is_available) values (1)
  insert into Cart_Items([user],product,variation,cart_items_id,quantity) values (CURRENT_USER,dbo.WhatToy(@variation_id),@variation_id,dbo.LastCart(),@quantity)
  if @quantity > dbo.GetStock(@variation_id)
  begin
   print 'Not enough'
   rollback tran
  end
  if @@TRANCOUNT <= 1
  begin 
   commit tran trans
  end
 end try
 begin catch
  if @@TRANCOUNT > 1
  begin 
   print 'Error occured in transaction'
  end
  print 'Error occured'
  begin rollback tran end
 end catch 
end
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddOrder] @first_name varchar(50), @last_name varchar(50), @phone varchar(10), @email varchar(50), @address varchar(100),@order_note varchar(500)  
as
begin
 begin tran
 begin try
	insert into [Order](order_number,[user],first_name,last_name,phone,email,[address],order_note,order_total,tax) 
	values (dbo.AddOrderNumber(),CURRENT_USER,@first_name,@last_name,@phone,@email,@address,@order_note,dbo.OrderTotal(CURRENT_USER),dbo.Tax(CURRENT_USER))
	if @@TRANCOUNT > 0
		commit tran
 end try
 begin catch
   if @@TRANCOUNT > 1 
   begin 
    print 'Error occured in transaction'
   end
   print 'Error occured'
   rollback tran
 end catch
end
GO
/****** Object:  StoredProcedure [dbo].[AddOrderProduct]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddOrderProduct] @order_number varchar(10), @variation varchar(10)
as
begin
 declare @product int, @quantity varchar(10), @price float
 set @product = dbo.WhatToy(@variation)
 set @quantity = dbo.GetQuantity(@variation)
 set @price = dbo.GetProductPrice(dbo.WhatToy(@variation))
 begin tran
  begin try
   insert into OrderProduct([order],[user],product,variations,quantity,product_price)
   values (@order_number,CURRENT_USER,@product,@variation,@quantity,@price)
   if dbo.GetStock(@variation) < 0
   begin 
    print 'Not enough'
    rollback tran
   end
   if @@TRANCOUNT > 0 
   begin 
    commit tran
   end
  end try
  begin catch
   if @@TRANCOUNT > 1 
   begin 
    print 'Error occured in transaction'
   end
   print 'Error occured'
   rollback tran
  end catch 
end
GO
/****** Object:  StoredProcedure [dbo].[AddPayment]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddPayment] @order_number varchar(10),@payment_method varchar(100), @amount_paid float
as
begin
 declare @payment varchar(10)
 set @payment = dbo.AddPaymentID()
 begin tran
 begin try
  insert into Payment(payment_id,[user],payment_method,amount_paid,[status]) values (@payment,CURRENT_USER,@payment_method,dbo.GetOrderMoney(@order_number),'New')
  update [Order]
  set payment = @payment, is_payment = 1
  where order_number = @order_number
  update [OrderProduct]
  set payment = @payment
  where [order] = @order_number
  if @@TRANCOUNT > 0
   commit tran
 end try
 begin catch 
   if @@TRANCOUNT > 1 
   begin 
    print 'Error occured in transaction'
   end
   print 'Error occured'
   rollback tran
 end catch 
end
GO
/****** Object:  StoredProcedure [dbo].[AddToys]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddToys] @toy_name varchar(200), @category varchar(50), @description varchar(500), @price float, @image varchar(20)
as
begin
 insert into Toys(toy_id,toy_name,category,[description],price,[image])
 values (dbo.AddToy(),@toy_name,@category,@description,@price,@image)
end
GO
/****** Object:  StoredProcedure [dbo].[AddVariations]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddVariations] @toy_id int, @color varchar(20), @size varchar(20), @variation_stock int
as
begin
 insert into Variation(variation_id,product,color,size,variation_stock)
 values (dbo.AddVariation(@toy_id),@toy_id,@color,@size,@variation_stock)
end
GO
/****** Object:  StoredProcedure [dbo].[AllOders_Proc]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AllOders_Proc]
as
begin
 select * from dbo.AllOrders
end
GO
/****** Object:  StoredProcedure [dbo].[AllOrdersToday_Proc]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AllOrdersToday_Proc]
as
begin
 select * from [AllOrdersToday]
end
GO
/****** Object:  StoredProcedure [dbo].[AllToysAdmin]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AllToysAdmin] 
as
begin
 select * from Toys
end
GO
/****** Object:  StoredProcedure [dbo].[AllVariationsAdmin]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AllVariationsAdmin]
as
begin
 select variation_id,toy_name,color,size,variation_stock from Variation join Toys
 on Variation.product = Toys.toy_id
end
GO
/****** Object:  StoredProcedure [dbo].[DelToy]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DelToy] @toy_id int
as
begin 
 delete from Toys where toy_id = @toy_id
end
GO
/****** Object:  StoredProcedure [dbo].[EditProfile]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditProfile] @firstname varchar(50), @lastname varchar(50), @email varchar(100), @phone_number varchar(10)
as
begin  
 update [User] set firstname = @firstname, lastname = @lastname, email = @email, phone_number = @phone_number
 where [user_id] = CURRENT_USER
end
GO
/****** Object:  StoredProcedure [dbo].[FindToy]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FindToy] @tukhoa varchar(200)
as
begin
 select TOP 1 toy_id,toy_name,price,[image] from Toys where toy_name like '%'+@tukhoa+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentUser]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCurrentUser]
as
begin
select CURRENT_USER
end
GO
/****** Object:  StoredProcedure [dbo].[GetToy]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetToy] (@toy_id int)
as
begin 
select toy_id,toy_name,category,[description],price,[image] from Toys where toy_id = @toy_id
end
GO
/****** Object:  StoredProcedure [dbo].[GetVariation]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetVariation] @variation_id varchar(10)
as
begin
select * from Variation where variation_id = @variation_id
end
GO
/****** Object:  StoredProcedure [dbo].[GetVariations]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetVariations] @toy_id int
as
begin
select variation_id,product,color,size from Variation where product = @toy_id
end
GO
/****** Object:  StoredProcedure [dbo].[IsAdmin]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IsAdmin]
as
begin 
 select is_admin from [User] where [user_id] = CURRENT_USER
end
GO
/****** Object:  StoredProcedure [dbo].[IsSoldOut_Proc]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IsSoldOut_Proc] @variation_id varchar(10)
as
begin
select dbo.IsSoldOut(@variation_id)
end
GO
/****** Object:  StoredProcedure [dbo].[MyCart]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MyCart]
as
begin
 select * from dbo.MyCartt
end
GO
/****** Object:  StoredProcedure [dbo].[MyOrder_Proc]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MyOrder_Proc]
as
begin
select * from dbo.MyOrder
end
GO
/****** Object:  StoredProcedure [dbo].[MyPayment_Proc]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MyPayment_Proc]
as
begin
 select * from dbo.MyPayment
end
GO
/****** Object:  StoredProcedure [dbo].[MyUser]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MyUser] 
as
begin
 select [user_id],firstname,lastname,email,phone_number from [User] where [user_id] = CURRENT_USER
end
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[OrderDetail] @order varchar(10)
as
begin
 select [order],payment,Toys.toy_name,color,size,quantity,product_price 
 from OrderProduct join Variation
 on OrderProduct.variations = Variation.variation_id
 join Toys
 on Variation.product = Toys.toy_id
 where [order] = @order
end
GO
/****** Object:  StoredProcedure [dbo].[Random6Toys_Proc]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Random6Toys_Proc]
as
begin
select * from Random6Toys
end
GO
/****** Object:  StoredProcedure [dbo].[RegistCustomer]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RegistCustomer] @user_id varchar(100), @pass varchar(255), @firstname varchar(50), @lastname varchar(50), @email varchar(100), @phone_number varchar(10)
as
begin
 insert into [User]([user_id],pass,firstname,lastname,email,phone_number,is_admin)
 values (@user_id,@pass,@firstname,@lastname,@email,@phone_number,0)
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePrice]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdatePrice] @toy_id int, @price float
as
begin
 update Toys
 set price = @price
 where toy_id = @toy_id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateStock] @variation_id varchar(10), @variation_stock int
as
begin
 update Variation
 set variation_stock = @variation_stock
 where variation_id = @variation_id
end
GO
/****** Object:  Trigger [dbo].[after_add_order]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[after_add_order] ON [dbo].[Order]
AFTER INSERT AS 
BEGIN
    declare @i int, @row int, @order varchar(10)
    SET @i = 1
	SET @row = (select count(distinct(variation)) from Cart_Items where [user] = CURRENT_USER and is_active = 0)
	select @order = ne.order_number from inserted ne
    while @i <= @row
    begin
	    declare @variation varchar(10)
	    select TOP(1) @variation = variation from Cart_Items where [user] = CURRENT_USER and is_active = 0
        exec AddOrderProduct @order, @variation

        UPDATE Cart_Items
	    SET is_active = 1
	    where variation = @variation and [user] = CURRENT_USER

        set @i += 1
    end
END
GO
ALTER TABLE [dbo].[Order] ENABLE TRIGGER [after_add_order]
GO
/****** Object:  Trigger [dbo].[upt_variation_after_add_orderproduct]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[upt_variation_after_add_orderproduct] ON [dbo].[OrderProduct]
AFTER INSERT AS 
BEGIN
    declare @quantity int, @variation varchar(10)
	select @quantity = ne.quantity, @variation = ne.variations from inserted ne
    UPDATE Variation
	SET variation_stock -= @quantity
	where variation_id = @variation
END
GO
ALTER TABLE [dbo].[OrderProduct] ENABLE TRIGGER [upt_variation_after_add_orderproduct]
GO
/****** Object:  Trigger [dbo].[add_system_user_after_insert_user_table]    Script Date: 25/11/2022 7:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[add_system_user_after_insert_user_table] ON [dbo].[User] 
AFTER INSERT AS 
declare @user varchar(100), @pass varchar(255), @is_admin bit
select @user = ne.[user_id], @pass = ne.pass, @is_admin = ne.is_admin
from inserted ne
if (@is_admin = 0)
BEGIN
    EXEC('CREATE LOGIN ['+@user+'] WITH PASSWORD = '''+@pass+'''')
	EXEC('CREATE USER ['+@user+'] FOR LOGIN ['+@user+']')
	exec sp_addrolemember role_for_customer, @user
END
GO
ALTER TABLE [dbo].[User] ENABLE TRIGGER [add_system_user_after_insert_user_table]
GO
USE [master]
GO
ALTER DATABASE [Nhom19_ToysStore] SET  READ_WRITE 
GO
