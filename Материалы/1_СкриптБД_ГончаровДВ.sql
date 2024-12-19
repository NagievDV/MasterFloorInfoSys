USE [master]
GO
/****** Object:  Database [MasterFloorInfoSys]    Script Date: 19.12.2024 17:43:17 ******/
CREATE DATABASE [MasterFloorInfoSys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterFloorInfoSys', FILENAME = N'E:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterFloorInfoSys.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterFloorInfoSys_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterFloorInfoSys_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MasterFloorInfoSys] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterFloorInfoSys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterFloorInfoSys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterFloorInfoSys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterFloorInfoSys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterFloorInfoSys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterFloorInfoSys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterFloorInfoSys] SET  MULTI_USER 
GO
ALTER DATABASE [MasterFloorInfoSys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterFloorInfoSys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterFloorInfoSys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterFloorInfoSys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterFloorInfoSys] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterFloorInfoSys] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterFloorInfoSys] SET QUERY_STORE = ON
GO
ALTER DATABASE [MasterFloorInfoSys] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MasterFloorInfoSys]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 19.12.2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 19.12.2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Material] [nvarchar](100) NULL,
	[DefectRate] [decimal](5, 4) NULL,
 CONSTRAINT [PK__Material__3214EC276DEFF3AD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 19.12.2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerType] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CEOFirstName] [nvarchar](50) NULL,
	[CEOMiddleName] [nvarchar](50) NULL,
	[CEOLastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[Address] [nvarchar](300) NULL,
	[TIN] [nvarchar](50) NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerSales]    Script Date: 19.12.2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NULL,
	[Partner] [int] NULL,
	[Amount] [int] NULL,
	[SaleDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 19.12.2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Type] [int] NULL,
	[ArticleNumber] [int] NULL,
	[MinimumSellingPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 19.12.2024 17:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Coefficient] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 
GO
INSERT [dbo].[Manager] ([ID], [FirstName], [MiddleName], [LastName], [PhoneNumber], [DateOfBirth], [Login], [Password]) VALUES (1, N'Дмитрий', N'Валентинович', N'Гончаров', N'89217568439', CAST(N'2005-10-31' AS Date), N'gdmitry', N'misterbulba2018')
GO
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 
GO
INSERT [dbo].[MaterialType] ([ID], [Material], [DefectRate]) VALUES (1, N'Тип материала 1', CAST(0.0010 AS Decimal(5, 4)))
GO
INSERT [dbo].[MaterialType] ([ID], [Material], [DefectRate]) VALUES (2, N'Тип материала 2', CAST(0.0095 AS Decimal(5, 4)))
GO
INSERT [dbo].[MaterialType] ([ID], [Material], [DefectRate]) VALUES (3, N'Тип материала 3', CAST(0.0028 AS Decimal(5, 4)))
GO
INSERT [dbo].[MaterialType] ([ID], [Material], [DefectRate]) VALUES (4, N'Тип материала 4', CAST(0.0055 AS Decimal(5, 4)))
GO
INSERT [dbo].[MaterialType] ([ID], [Material], [DefectRate]) VALUES (5, N'Тип материала 5', CAST(0.0034 AS Decimal(5, 4)))
GO
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner] ON 
GO
INSERT [dbo].[Partner] ([ID], [PartnerType], [Name], [CEOFirstName], [CEOMiddleName], [CEOLastName], [Email], [PhoneNumber], [Address], [TIN], [Rating]) VALUES (1, 1, N'База Строитель', N'Александра', N'Ивановна', N'Иванова', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'9999999999', 10)
GO
INSERT [dbo].[Partner] ([ID], [PartnerType], [Name], [CEOFirstName], [CEOMiddleName], [CEOLastName], [Email], [PhoneNumber], [Address], [TIN], [Rating]) VALUES (2, 4, N'Паркет 29', N'Василий', N'Петрович', N'Петров', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7)
GO
INSERT [dbo].[Partner] ([ID], [PartnerType], [Name], [CEOFirstName], [CEOMiddleName], [CEOLastName], [Email], [PhoneNumber], [Address], [TIN], [Rating]) VALUES (3, 2, N'Стройсервис', N'Андрей', N'Николаевич', N'Соловьев', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7)
GO
INSERT [dbo].[Partner] ([ID], [PartnerType], [Name], [CEOFirstName], [CEOMiddleName], [CEOLastName], [Email], [PhoneNumber], [Address], [TIN], [Rating]) VALUES (4, 3, N'Ремонт и отделка', N'Екатерина', N'Валерьевна', N'Воробьева', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5)
GO
INSERT [dbo].[Partner] ([ID], [PartnerType], [Name], [CEOFirstName], [CEOMiddleName], [CEOLastName], [Email], [PhoneNumber], [Address], [TIN], [Rating]) VALUES (5, 1, N'МонтажПро', N'Степан', N'Сергеевич', N'Степанов', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10)
GO
INSERT [dbo].[Partner] ([ID], [PartnerType], [Name], [CEOFirstName], [CEOMiddleName], [CEOLastName], [Email], [PhoneNumber], [Address], [TIN], [Rating]) VALUES (6, 3, N'Паркет 28', N'Иван', N'Антонович', N'Сишарпов', N'ivanivanich@gmail.com', N'956 386 38 99', N'123001, Московская область, город Химки, ул. Авиамоторная, 16', N'5473859235', 3)
GO
SET IDENTITY_INSERT [dbo].[Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerSales] ON 
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
GO
INSERT [dbo].[PartnerSales] ([ID], [Product], [Partner], [Amount], [SaleDate]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[PartnerSales] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerType] ON 
GO
INSERT [dbo].[PartnerType] ([ID], [Type]) VALUES (1, N'ЗАО')
GO
INSERT [dbo].[PartnerType] ([ID], [Type]) VALUES (2, N'ПАО')
GO
INSERT [dbo].[PartnerType] ([ID], [Type]) VALUES (3, N'ОАО')
GO
INSERT [dbo].[PartnerType] ([ID], [Type]) VALUES (4, N'ООО')
GO
SET IDENTITY_INSERT [dbo].[PartnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [Name], [Type], [ArticleNumber], [MinimumSellingPrice]) VALUES (1, N'Паркетная доска Ясень темный однополосная 14 мм', 3, 8758385, CAST(4456.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Name], [Type], [ArticleNumber], [MinimumSellingPrice]) VALUES (2, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 3, 8858958, CAST(7330.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Name], [Type], [ArticleNumber], [MinimumSellingPrice]) VALUES (3, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 1, 7750282, CAST(1799.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Name], [Type], [ArticleNumber], [MinimumSellingPrice]) VALUES (4, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 1, 7028748, CAST(3890.41 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Name], [Type], [ArticleNumber], [MinimumSellingPrice]) VALUES (5, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 4, 5012543, CAST(5450.59 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 
GO
INSERT [dbo].[ProductType] ([ID], [Type], [Coefficient]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(4, 2)))
GO
INSERT [dbo].[ProductType] ([ID], [Type], [Coefficient]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(4, 2)))
GO
INSERT [dbo].[ProductType] ([ID], [Type], [Coefficient]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(4, 2)))
GO
INSERT [dbo].[ProductType] ([ID], [Type], [Coefficient]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD FOREIGN KEY([PartnerType])
REFERENCES [dbo].[PartnerType] ([ID])
GO
ALTER TABLE [dbo].[PartnerSales]  WITH CHECK ADD FOREIGN KEY([Partner])
REFERENCES [dbo].[Partner] ([ID])
GO
ALTER TABLE [dbo].[PartnerSales]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[ProductType] ([ID])
GO
USE [master]
GO
ALTER DATABASE [MasterFloorInfoSys] SET  READ_WRITE 
GO
