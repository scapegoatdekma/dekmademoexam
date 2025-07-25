USE [master]
GO
/****** Object:  Database [currDemoExam]    Script Date: 02.06.2025 18:14:08 ******/
CREATE DATABASE [currDemoExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'currDemoExam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\currDemoExam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'currDemoExam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\currDemoExam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [currDemoExam] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [currDemoExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [currDemoExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [currDemoExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [currDemoExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [currDemoExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [currDemoExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [currDemoExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [currDemoExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [currDemoExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [currDemoExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [currDemoExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [currDemoExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [currDemoExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [currDemoExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [currDemoExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [currDemoExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [currDemoExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [currDemoExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [currDemoExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [currDemoExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [currDemoExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [currDemoExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [currDemoExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [currDemoExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [currDemoExam] SET  MULTI_USER 
GO
ALTER DATABASE [currDemoExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [currDemoExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [currDemoExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [currDemoExam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [currDemoExam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [currDemoExam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [currDemoExam] SET QUERY_STORE = ON
GO
ALTER DATABASE [currDemoExam] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [currDemoExam]
GO
/****** Object:  Table [dbo].[MaterialProducts]    Script Date: 02.06.2025 18:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialProducts](
	[Id] [int] IDENTITY(84,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[QuaForBuild] [float] NULL,
 CONSTRAINT [PK_MaterialProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 02.06.2025 18:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Id] [int] IDENTITY(21,1) NOT NULL,
	[MaterialName] [nvarchar](255) NULL,
	[MaterialTypeId] [int] NULL,
	[PriceByOne] [float] NULL,
	[HasQuantity] [float] NULL,
	[MinQuantity] [float] NULL,
	[QuantityInOne] [float] NULL,
	[CheckStyle] [nvarchar](255) NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 02.06.2025 18:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Id] [int] IDENTITY(7,1) NOT NULL,
	[MaterialType] [nvarchar](255) NULL,
	[LossPercent] [float] NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02.06.2025 18:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(21,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[Article] [float] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 02.06.2025 18:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(7,1) NOT NULL,
	[ProductType] [nvarchar](255) NULL,
	[BreackQua] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialProducts] ON 

INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (1, 4, 1, 0.85)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (2, 10, 1, 1.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (3, 11, 1, 1.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (4, 12, 1, 1.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (5, 14, 1, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (6, 16, 1, 5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (7, 17, 1, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (8, 18, 1, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (9, 19, 1, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (10, 4, 2, 1.25)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (11, 9, 2, 3.04)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (12, 11, 2, 1.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (13, 12, 2, 2.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (14, 14, 2, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (15, 16, 2, 5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (16, 17, 2, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (17, 18, 2, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (18, 19, 2, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (19, 4, 3, 1.85)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (20, 9, 3, 4.22)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (21, 10, 3, 1.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (22, 14, 3, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (23, 16, 3, 5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (24, 17, 3, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (25, 18, 3, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (26, 19, 3, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (27, 5, 4, 3.33)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (28, 20, 4, 6)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (29, 2, 5, 2.9)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (30, 3, 5, 1.7)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (31, 6, 5, 2.7)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (32, 8, 5, 1.8)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (33, 2, 6, 1.7)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (34, 3, 6, 1.6)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (35, 8, 6, 1.8)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (36, 5, 7, 2)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (37, 7, 7, 0.8)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (38, 20, 7, 7)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (39, 6, 8, 5.95)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (40, 15, 8, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (41, 5, 9, 4.3)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (42, 20, 9, 8.6)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (43, 6, 10, 7.65)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (44, 8, 10, 1.05)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (45, 15, 10, 1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (46, 5, 11, 6.4)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (47, 20, 11, 6.2)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (48, 4, 12, 2.55)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (49, 5, 12, 5.2)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (50, 5, 12, 5.22)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (51, 7, 12, 3.59)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (52, 20, 12, 9.4)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (53, 1, 13, 3.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (54, 3, 13, 1.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (55, 8, 13, 2.1)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (56, 13, 13, 0.8)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (57, 1, 14, 7.7)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (58, 3, 14, 6.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (59, 5, 14, 4.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (60, 6, 14, 5.7)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (61, 8, 14, 2.3)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (62, 9, 14, 1.74)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (63, 5, 15, 4.2)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (64, 7, 15, 2.21)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (65, 16, 15, 4)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (66, 20, 15, 6.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (67, 2, 16, 0.4)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (68, 16, 16, 4)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (69, 3, 17, 0.7)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (70, 5, 17, 7.65)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (71, 7, 17, 0.8)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (72, 20, 17, 6.3)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (73, 3, 18, 3.2)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (74, 4, 18, 3.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (75, 7, 18, 1.6)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (76, 13, 18, 1.6)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (77, 3, 19, 1.3)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (78, 5, 19, 8.2)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (79, 8, 19, 1.3)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (80, 1, 20, 1.8)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (81, 3, 20, 3.5)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (82, 8, 20, 1.65)
INSERT [dbo].[MaterialProducts] ([Id], [MaterialId], [ProductId], [QuaForBuild]) VALUES (83, 13, 20, 1.6)
SET IDENTITY_INSERT [dbo].[MaterialProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (1, N'Цельный массив дерева Дуб 1000х600 мм', 1, 7450, 1500, 500, 7.1999999999999993, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (2, N'Клееный массив дерева Дуб 1000х600 мм', 1, 4520, 300, 500, 7.1999999999999993, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (3, N'Шпон облицовочный Дуб натуральный 2750х480 мм', 1, 2500, 2000, 1500, 19.8, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (4, N'Фанера 2200х1000 мм', 2, 2245, 450, 1000, 52.800000000000004, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (5, N'ДСП 2750х1830 мм', 2, 529.6, 1010, 1200, 181.08, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (6, N'МДФ 2070х1400 мм', 2, 417.24, 1550, 1000, 87, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (7, N'ДВП 2440х2050 мм', 2, 187, 1310, 1000, 190, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (8, N'ХДФ 2800x2070 мм', 2, 370.96, 1400, 1200, 90, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (9, N'Экокожа 140 см', 3, 1600, 1200, 1500, 100, N'пог.м')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (10, N'Велюр 140 см', 3, 1300, 1300, 1500, 100, N'пог.м')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (11, N'Шенилл 140 см', 3, 620, 950, 1500, 100, N'пог.м')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (12, N'Рогожка 140 см', 3, 720, 960, 1500, 100, N'пог.м')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (13, N'Закаленное стекло 2600х1800 мм', 4, 1148, 1000, 500, 196.56, N'м²')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (14, N'Металлокаркас для стула', 5, 1100, 300, 250, 5, N'шт')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (15, N'Металлокаркас каркас из профиля с траверсами для стола', 5, 6700, 100, 100, 1, N'шт')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (16, N'Колесо для мебели поворотное', 6, 10.59, 1500, 1000, 500, N'шт')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (17, N'Газ-лифт', 5, 730, 500, 250, 5, N'шт')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (18, N'Металлическая крестовина для офисных кресел', 5, 2700, 500, 250, 5, N'шт')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (19, N'Пластиковый комплект для стула', 6, 900, 300, 250, 100, N'шт')
INSERT [dbo].[Materials] ([Id], [MaterialName], [MaterialTypeId], [PriceByOne], [HasQuantity], [MinQuantity], [QuantityInOne], [CheckStyle]) VALUES (20, N'Кромка ПВХ', 6, 35.8, 1500, 1000, 100, N'м')
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([Id], [MaterialType], [LossPercent]) VALUES (1, N'Дерево', 0.0055)
INSERT [dbo].[MaterialType] ([Id], [MaterialType], [LossPercent]) VALUES (2, N'Древесная плита', 0.003)
INSERT [dbo].[MaterialType] ([Id], [MaterialType], [LossPercent]) VALUES (3, N'Текстиль', 0.0015)
INSERT [dbo].[MaterialType] ([Id], [MaterialType], [LossPercent]) VALUES (4, N'Стекло', 0.0045)
INSERT [dbo].[MaterialType] ([Id], [MaterialType], [LossPercent]) VALUES (5, N'Металл', 0.001)
INSERT [dbo].[MaterialType] ([Id], [MaterialType], [LossPercent]) VALUES (6, N'Пластик', 0.0005)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (1, 1, N'Кресло детское цвет Белый и Розовый', 3028272, 15324.99)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (2, 1, N'Кресло офисное цвет Черный', 3018556, 21443.99)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (3, 1, N'Кресло эргономичное цвет Темно-коричневый  ', 3549922, 24760)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (4, 2, N'Полка настольная', 7028048, 2670.89)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (5, 3, N'Стеллаж для документов цвет Дуб светлый 854х445х2105 мм', 5759324, 24899)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (6, 3, N'Стеллаж цвет Белый с ящиками 854х445х2105 мм', 5259474, 16150)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (7, 3, N'Стеллаж цвет Орех 400х370х2000 мм', 5118827, 2860)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (8, 4, N'Стол для ноутбука на металлокаркасе 800х600х123 мм', 1029784, 14690)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (9, 4, N'Стол компьютерный 700х600х500 мм', 1028248, 4105.89)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (10, 4, N'Стол компьютерный на металлокаркасе 1400х600х750 мм', 1130981, 13899)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (11, 4, N'Стол письменный 1100x750x600 мм', 1188827, 5148)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (12, 4, N'Стол письменный с тумбочкой 4 ящика 1100x750x600 мм', 1029272, 15325)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (13, 4, N'Стол руководителя письменный цвет Венге 1600x800x764 мм', 1016662, 43500.9)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (14, 4, N'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм', 1658953, 132500)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (15, 5, N'Тумба выкатная 3 ящика', 6033136, 3750)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (16, 5, N'Тумба офисная для оргтехники', 6115947, 2450)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (17, 3, N'Узкий пенал стеллаж 5 полок цвет Орех 364х326x2000 мм ', 5559898, 8348)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (18, 6, N'Шкаф для книг 800x420x2000 мм', 4159043, 23390.99)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (19, 6, N'Шкаф для одежды цвет Венге 602x420x2000 мм', 4758375, 12035)
INSERT [dbo].[Products] ([Id], [ProductTypeId], [ProductName], [Article], [Price]) VALUES (20, 6, N'Шкаф-витрина 2 ящика 800x420x2000 мм', 4588376, 31991)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [ProductType], [BreackQua]) VALUES (1, N'Кресла', 1.95)
INSERT [dbo].[ProductType] ([Id], [ProductType], [BreackQua]) VALUES (2, N'Полки', 2.5)
INSERT [dbo].[ProductType] ([Id], [ProductType], [BreackQua]) VALUES (3, N'Стеллажи', 4.35)
INSERT [dbo].[ProductType] ([Id], [ProductType], [BreackQua]) VALUES (4, N'Столы', 5.5)
INSERT [dbo].[ProductType] ([Id], [ProductType], [BreackQua]) VALUES (5, N'Тумбы', 7.6)
INSERT [dbo].[ProductType] ([Id], [ProductType], [BreackQua]) VALUES (6, N'Шкафы', 6.72)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[MaterialProducts]  WITH CHECK ADD  CONSTRAINT [FK_MaterialProducts_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [dbo].[MaterialProducts] CHECK CONSTRAINT [FK_MaterialProducts_Materials]
GO
ALTER TABLE [dbo].[MaterialProducts]  WITH CHECK ADD  CONSTRAINT [FK_MaterialProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[MaterialProducts] CHECK CONSTRAINT [FK_MaterialProducts_Products]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialType] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialType] ([Id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_MaterialType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
USE [master]
GO
ALTER DATABASE [currDemoExam] SET  READ_WRITE 
GO
