USE [master]
GO
/****** Object:  Database [Sport]    Script Date: 16.10.2024 14:29:27 ******/
CREATE DATABASE [Sport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Sport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Sport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sport] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sport] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sport] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sport] SET  MULTI_USER 
GO
ALTER DATABASE [Sport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sport] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sport] SET QUERY_STORE = OFF
GO
USE [Sport]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 16.10.2024 14:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.10.2024 14:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 16.10.2024 14:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.10.2024 14:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronimic] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Telephon] [nvarchar](50) NOT NULL,
	[Seria] [nvarchar](50) NULL,
	[Number] [nvarchar](50) NULL,
	[DataBerth] [date] NULL,
	[LastVhod] [datetime] NULL,
	[IdType] [int] NULL,
	[IdGender] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N'женский')
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'мужской')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Исполнитель')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Type] ([Id], [Name]) VALUES (1, N'Неуспешно')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (2, N'Успешно')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (1, 3, N'Акимов', N'Ян', N'Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7(781) 785-58-37', N'2367', N'558134', CAST(N'1993-07-03' AS Date), CAST(N'2023-02-01T05:59:51.000' AS DateTime), 2, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (2, 2, N'Гончарова', N'Ульяна', N'Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'+7(230) 906-88-15', N'7101', N'669343', CAST(N'1975-06-22' AS Date), CAST(N'2023-02-13T13:59:08.000' AS DateTime), 2, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (3, 1, N'Анохина', N'Елизавета', N'Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'+7(555) 444-83-16', N'3455', N'719630', CAST(N'1991-08-16' AS Date), CAST(N'2023-02-10T17:58:02.000' AS DateTime), 2, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (4, 3, N'Николаев', N'Илья', N'Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'+7(392) 682-44-42', N'2377', N'871623', CAST(N'1970-12-22' AS Date), CAST(N'2023-02-03T03:35:08.000' AS DateTime), 2, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (5, 2, N'Уткин', N'Дмитрий', N'Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'+7(836) 429-03-86', N'8755', N'921148', CAST(N'1999-05-04' AS Date), CAST(N'2023-02-15T21:35:55.000' AS DateTime), 1, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (6, 2, N'Куликова', N'Стефания', N'Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'+7(283) 945-30-92', N'4355', N'104594', CAST(N'1994-12-06' AS Date), CAST(N'2023-02-11T20:22:23.000' AS DateTime), 2, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (7, 2, N'Волков', N'Егор', N'Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'+7(621) 359-36-69', N'2791', N'114390', CAST(N'1995-03-28' AS Date), CAST(N'2023-02-15T18:22:26.000' AS DateTime), 2, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (8, 1, N'Соколова', N'Софья', N'Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'+7(440) 561-03-14', N'5582', N'126286', CAST(N'1977-03-27' AS Date), CAST(N'2023-02-15T23:03:04.000' AS DateTime), 1, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (9, 3, N'Голубева', N'Полина', N'Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'+7(331) 918-24-34', N'2978', N'133653', CAST(N'1975-04-12' AS Date), CAST(N'2023-02-05T05:55:20.000' AS DateTime), 2, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (10, 3, N'Вишневская', N'Мария', N'Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7(493) 219-39-42', N'7512', N'141956', CAST(N'1975-12-23' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (11, 3, N'Васильева', N'Арина', N'Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7(407) 485-50-30', N'5046', N'158433', CAST(N'2000-01-22' AS Date), NULL, 1, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (12, 3, N'Павлов', N'Дмитрий', N'Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7(919) 478-24-97', N'2460', N'169505', CAST(N'1983-10-03' AS Date), CAST(N'2023-02-04T19:26:44.000' AS DateTime), 1, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (13, 2, N'Горбунова', N'Мирослава', N'Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7(482) 802-95-80', N'3412', N'174593', CAST(N'1998-03-03' AS Date), CAST(N'2023-02-16T05:30:24.000' AS DateTime), 2, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (14, 3, N'Демина', N'София', N'Романовна', N'deummecillummu-4992@mail.ru', N'deminasr', N'D%DVKyDN', N'+7(455) 944-64-49', N'4950', N'183034', CAST(N'1993-06-08' AS Date), CAST(N'2023-02-10T23:46:25.000' AS DateTime), 1, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (15, 2, N'Петрова', N'Алина', N'Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7(710) 388-25-63', N'5829', N'219464', CAST(N'1980-09-23' AS Date), CAST(N'2023-02-01T17:56:56.000' AS DateTime), 2, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (16, 2, N'Плотников', N'Григорий', N'Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7(759) 452-38-46', N'6443', N'208059', CAST(N'1991-03-13' AS Date), CAST(N'2023-02-08T19:05:56.000' AS DateTime), 2, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (17, 2, N'Прохорова', N'Есения', N'Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7(687) 801-13-32', N'7079', N'213265', CAST(N'1998-04-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (18, 2, N'Чернов', N'Алексей', N'Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'+7(425) 783-22-53', N'8207', N'522702', CAST(N'1980-04-16' AS Date), CAST(N'2023-02-05T15:05:42.000' AS DateTime), 2, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (19, 3, N'Горбунов', N'Степан', N'Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'+(889) 449-43-91', N'9307', N'232158', CAST(N'1993-07-23' AS Date), CAST(N'2023-02-13T21:13:14.000' AS DateTime), 2, 2)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (20, 2, N'Рябинина', N'Софья', N'Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'+(825) 301-82-50', N'1357', N'242839', CAST(N'1990-06-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (21, 2, N'Козлова', N'Яна', N'Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'+(397) 334-20-86', N'1167', N'256636', CAST(N'1987-12-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (22, 3, N'Лукьянова', N'Ульяна', N'Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'+(241) 570-30-40', N'1768', N'266986', CAST(N'1981-10-22' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (23, 2, N'Кондрашова', N'Арина', N'Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'+7(713) 462-82-65', N'1710', N'427875', CAST(N'1976-12-22' AS Date), CAST(N'2023-02-07T20:30:21.000' AS DateTime), 1, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (24, 3, N'Быкова', N'Виктория', N'Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'+7(854) 822-23-31', N'1806', N'289145', CAST(N'1973-06-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([Id], [IdRole], [Surname], [Name], [Patronimic], [Email], [Login], [Password], [Telephon], [Seria], [Number], [DataBerth], [LastVhod], [IdType], [IdGender]) VALUES (25, 2, N'Гуляев', N'Тимофей', N'Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'+7(439) 713-61-17', N'1587', N'291249', CAST(N'1987-02-05' AS Date), CAST(N'2023-02-01T13:07:20.000' AS DateTime), 1, 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([IdGender])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Type] FOREIGN KEY([IdType])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Type]
GO
USE [master]
GO
ALTER DATABASE [Sport] SET  READ_WRITE 
GO
