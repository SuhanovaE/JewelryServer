USE [master]
GO
/****** Object:  Database [JewelryShop]    Script Date: 09.12.2022 13:46:59 ******/
CREATE DATABASE [JewelryShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JewelryShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JewelryShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JewelryShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JewelryShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JewelryShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JewelryShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JewelryShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JewelryShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JewelryShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JewelryShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JewelryShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [JewelryShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JewelryShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JewelryShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JewelryShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JewelryShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JewelryShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JewelryShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JewelryShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JewelryShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JewelryShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JewelryShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JewelryShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JewelryShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JewelryShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JewelryShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JewelryShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JewelryShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JewelryShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JewelryShop] SET  MULTI_USER 
GO
ALTER DATABASE [JewelryShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JewelryShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JewelryShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JewelryShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JewelryShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JewelryShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [JewelryShop] SET QUERY_STORE = OFF
GO
USE [JewelryShop]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09.12.2022 13:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id_clients] [int] IDENTITY(1,1) NOT NULL,
	[lastname] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[patronymic] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id_clients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 09.12.2022 13:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id_discount] [int] IDENTITY(1,1) NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[id_discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jewel]    Script Date: 09.12.2022 13:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jewel](
	[id_jewel] [int] IDENTITY(1,1) NOT NULL,
	[weight] [float] NULL,
	[material] [nvarchar](50) NULL,
	[fk_type] [int] NULL,
 CONSTRAINT [PK_Jewel] PRIMARY KEY CLUSTERED 
(
	[id_jewel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.12.2022 13:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[date_adoption] [date] NULL,
	[date_issue] [date] NULL,
	[fk_clients] [int] NULL,
	[fk_jewel] [int] NULL,
	[fk_service] [int] NULL,
	[price] [int] NULL,
	[fk_discount] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 09.12.2022 13:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id_service] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 09.12.2022 13:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id_type] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (1, N'Нефедова', N'Елена', N'Дмитриевна', N'89478456345')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (2, N'Никитин', N'Фёдор', N'Тимофеевич', N'89003567876')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (3, N'Борисов', N'Кирилл', N'Ильич', N'89234765898')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (4, N'Данилова', N'София', N'Кирииловна', N'89278569834')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (5, N'Федотова', N'Амина', N'Леонидовна', N'89265873999')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (6, N'Журавлёва', N'Алиса', N'Олеговна', N'89478447860')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (7, N'Сергеева', N'Светлана', N'Богдановна', N'89308793758')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (8, N'Лапина', N'Мария', N'Михаловна', N'89479874623')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (9, N'Боброва', N'Виктория', N'Михайловна', N'89375878934')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (10, N'Золотова', N'Александра', N'Матвеевна', N'89278573499')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (11, N'Николаев', N'Кирилл', N'Александрович', N'89387848926')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (12, N'Антонова', N'София', N'Дмитриевна', N'89002679879')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (13, N'Борисова', N'Виктория', N'Матвеевна', N'89337865768')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (14, N'Мальцева', N'Екатерина', N'Семёновна', N'89378876567')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (15, N'Кузнецов', N'Михаил', N'Андреевич', N'89378564588')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (16, N'Руднев', N'Глеб', N'Давидович', N'89478763646')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (17, N'Баранов', N'Лев', N'Артурович', N'89375654788')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (18, N'Федосеева', N'Дарья', N'Львовна', N'89377659898')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (19, N'Беляев', N'Андрей', N'Семёнович', N'89376781122')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (20, N'Балашов', N'Артём', N'Никитич', N'89378598756')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (21, N'Кочетова', N'Варвара', N'Ивановна', N'89479802748')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (22, N'Николаев', N'Андрей', N'Михайлович', N'89378889866')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (23, N'Королёв', N'Михаил', N'Романович', N'89478654543')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (24, N'Шилова', N'Ксения', N'Констатиновна', N'89487233435')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (25, N'Петров', N'Макар', N'Даниилович', N'89376598675')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (26, N'Александрова', N'Виктория', N'Ивановна', N'89472465476')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (27, N'Романов', N'Иван', N'Александрович', N'89472836567')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (28, N'Чернова', N'Ева', N'Викторовна', N'89378756544')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (29, N'Леонова', N'Мария', N'Владиславовна', N'89467657876')
INSERT [dbo].[Clients] ([id_clients], [lastname], [firstname], [patronymic], [phone]) VALUES (30, N'Николаева', N'Анастасия', N'Георгиевна', N'89398567234')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id_service], [name]) VALUES (1, N'Изменение размера кольца')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (2, N'Полировка украшений')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (3, N'Ремонт замков в украшениях')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (4, N'Пайка')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (5, N'Вставка выпадающих камней')
INSERT [dbo].[Service] ([id_service], [name]) VALUES (6, N'Гравировка')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id_type], [type]) VALUES (1, N'Браслет')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (2, N'Кольцо')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (3, N'Серьги')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (4, N'Цепочка')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (5, N'Брошь')
INSERT [dbo].[Type] ([id_type], [type]) VALUES (6, N'Кулон')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Jewel]  WITH CHECK ADD  CONSTRAINT [FK_Jewel_Type] FOREIGN KEY([fk_type])
REFERENCES [dbo].[Type] ([id_type])
GO
ALTER TABLE [dbo].[Jewel] CHECK CONSTRAINT [FK_Jewel_Type]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Clients] FOREIGN KEY([fk_clients])
REFERENCES [dbo].[Clients] ([id_clients])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Clients]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Discount] FOREIGN KEY([fk_discount])
REFERENCES [dbo].[Discount] ([id_discount])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Discount]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Jewel] FOREIGN KEY([fk_jewel])
REFERENCES [dbo].[Jewel] ([id_jewel])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Jewel]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Service] FOREIGN KEY([fk_service])
REFERENCES [dbo].[Service] ([id_service])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Service]
GO
USE [master]
GO
ALTER DATABASE [JewelryShop] SET  READ_WRITE 
GO
