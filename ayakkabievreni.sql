USE [master]
GO
/****** Object:  Database [AyakkabiEvreni]    Script Date: 14.01.2020 15:58:54 ******/
CREATE DATABASE [AyakkabiEvreni]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AyakkabiEvreni', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AyakkabiEvreni.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AyakkabiEvreni_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AyakkabiEvreni_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AyakkabiEvreni] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AyakkabiEvreni].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AyakkabiEvreni] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET ARITHABORT OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AyakkabiEvreni] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AyakkabiEvreni] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AyakkabiEvreni] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AyakkabiEvreni] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET RECOVERY FULL 
GO
ALTER DATABASE [AyakkabiEvreni] SET  MULTI_USER 
GO
ALTER DATABASE [AyakkabiEvreni] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AyakkabiEvreni] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AyakkabiEvreni] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AyakkabiEvreni] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AyakkabiEvreni] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AyakkabiEvreni', N'ON'
GO
ALTER DATABASE [AyakkabiEvreni] SET QUERY_STORE = OFF
GO
USE [AyakkabiEvreni]
GO
/****** Object:  Table [dbo].[TBL_Musteri]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Musteri](
	[Musteri_ID] [int] IDENTITY(1,1) NOT NULL,
	[Musteri_Adi] [nvarchar](50) NULL,
	[Musteri_Soyadi] [nvarchar](50) NULL,
	[Musteri_KullaniciAdi] [nvarchar](50) NULL,
	[Musteri_Email] [nvarchar](50) NULL,
	[Musteri_Telefon] [char](15) NULL,
 CONSTRAINT [PK_TBL_Musteri_1] PRIMARY KEY CLUSTERED 
(
	[Musteri_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[musterileri_Listele]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create procedure MaxGoruntulenme
--as
--SELECT TOP 5 * FROM TBL_Urun
--ORDER BY Urun_Goruntulenme_Sayisi DESC
--exec MaxGoruntulenme
create view [dbo].[musterileri_Listele]
as
select TBL_Musteri.Musteri_Adi,TBL_Musteri.Musteri_Soyadi,TBL_Musteri.Musteri_Email
from TBL_Musteri
GO
/****** Object:  View [dbo].[musteriliste]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[musteriliste]
as
select TBL_Musteri.Musteri_Adi, TBL_Musteri.Musteri_Soyadi, TBL_Musteri.Musteri_Email
from TBL_Musteri
GO
/****** Object:  Table [dbo].[TBL_Auth]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Auth](
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Sifre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Kargo]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Kargo](
	[KargoID] [int] IDENTITY(1,1) NOT NULL,
	[Kargo_Firma_Adi] [nvarchar](150) NOT NULL,
	[Kargo_Adres] [nvarchar](500) NULL,
	[Kargo_Telefon] [char](15) NULL,
	[Kargo_WebSite] [nvarchar](50) NULL,
	[Kargo_Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBL_Kargo] PRIMARY KEY CLUSTERED 
(
	[KargoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Kategori]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Kategori](
	[Kategori_ID] [int] IDENTITY(1,1) NOT NULL,
	[Kategori_Adi] [nvarchar](50) NOT NULL,
	[Kategori_Aciklama] [nvarchar](500) NULL,
	[Kategori_ResimID] [int] NULL,
 CONSTRAINT [PK_TBL_Kategori] PRIMARY KEY CLUSTERED 
(
	[Kategori_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Marka]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Marka](
	[Marka_ID] [int] IDENTITY(1,1) NOT NULL,
	[Marka_Ad] [nvarchar](50) NOT NULL,
	[Marka_Aciklama] [nvarchar](1000) NULL,
	[Marka_ResimID] [int] NULL,
 CONSTRAINT [PK_TBL_Marka] PRIMARY KEY CLUSTERED 
(
	[Marka_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_MusteriAdres]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_MusteriAdres](
	[MusteriAdres_ID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdres_MusteriID] [int] NULL,
	[MusteriAdres_Adres] [nvarchar](500) NOT NULL,
	[MusteriAdres_Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_MusteriAdres] PRIMARY KEY CLUSTERED 
(
	[MusteriAdres_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_OzellikDeger]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_OzellikDeger](
	[OzellikDeger_ID] [int] IDENTITY(1,1) NOT NULL,
	[OzellikDeger_Adi] [nvarchar](50) NOT NULL,
	[OzellikDeger_Aciklama] [nvarchar](500) NULL,
	[OzellikDeger_OzellikTipID] [int] NOT NULL,
 CONSTRAINT [PK_TBL_OzellikDeger] PRIMARY KEY CLUSTERED 
(
	[OzellikDeger_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_OzellikTip]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_OzellikTip](
	[Ozellik_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ozellik_Adi] [nvarchar](50) NOT NULL,
	[Ozellik_Aciklama] [nvarchar](500) NULL,
	[Ozellik_Kategori_ID] [int] NOT NULL,
 CONSTRAINT [PK_TBL_OzellikTip] PRIMARY KEY CLUSTERED 
(
	[Ozellik_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Resim]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Resim](
	[Resim_ID] [int] IDENTITY(1,1) NOT NULL,
	[Resim_Buyuk_Yolu] [nvarchar](250) NULL,
	[Resim_Orta_Yolu] [nvarchar](250) NULL,
	[Resim_Kucuk_Yolu] [nvarchar](250) NULL,
	[Resim_SiraNo] [tinyint] NULL,
	[Resim_UrunID] [int] NULL,
 CONSTRAINT [PK_TBL_Resim] PRIMARY KEY CLUSTERED 
(
	[Resim_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Satis]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Satis](
	[Satis_ID] [int] IDENTITY(1,1) NOT NULL,
	[Satis_MusteriID] [int] NULL,
	[Satis_Tarih] [datetime] NOT NULL,
	[Satis_ToplamTutar] [money] NOT NULL,
	[Satis_SepetteMi] [bit] NOT NULL,
	[Satis_KargoID] [int] NULL,
	[Satis_SiparisDurumID] [int] NULL,
	[Satis_KargoTakipNo] [nvarchar](20) NULL,
 CONSTRAINT [PK_TBL_Satis] PRIMARY KEY CLUSTERED 
(
	[Satis_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SatisDetay]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SatisDetay](
	[SatisDetay_SatisID] [int] NOT NULL,
	[SatisDetay_UrunID] [int] NOT NULL,
	[SatisDetay_Adet] [int] NULL,
	[SatisDetay_Fiyat] [money] NULL,
	[SatisDetay_Indirim] [float] NULL,
 CONSTRAINT [PK_TBL_SatisDetay] PRIMARY KEY CLUSTERED 
(
	[SatisDetay_SatisID] ASC,
	[SatisDetay_UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SiparisDurum]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SiparisDurum](
	[SiparisDurum_ID] [int] IDENTITY(1,1) NOT NULL,
	[SiparisDurum_Adi] [nvarchar](50) NOT NULL,
	[SiparisDurum_Aciklama] [nvarchar](500) NULL,
 CONSTRAINT [PK_TBL_SiparisDurum] PRIMARY KEY CLUSTERED 
(
	[SiparisDurum_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Urun]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Urun](
	[Urun_ID] [int] IDENTITY(1,1) NOT NULL,
	[Urun_Adi] [nvarchar](250) NOT NULL,
	[Urun_Marka_ID] [int] NULL,
	[Urun_Kategori_ID] [int] NULL,
	[Urun_Eklenme_Tarihi] [nvarchar](25) NOT NULL,
	[Urun_Garanti_Suresi] [nvarchar](20) NULL,
	[Urun_Aciklama] [nvarchar](1000) NULL,
	[Urun_Stok_Sayisi] [int] NULL,
	[Urun_Fiyati] [money] NOT NULL,
	[Urun_Goruntulenme_Sayisi] [int] NULL,
 CONSTRAINT [PK_TBL_Urun] PRIMARY KEY CLUSTERED 
(
	[Urun_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_UrunOzellik]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_UrunOzellik](
	[UrunOzellik_UrunID] [int] NOT NULL,
	[UrunOzellik_OzellikTipID] [int] NOT NULL,
	[UrunOzellik_OzellikDegerID] [int] NOT NULL,
 CONSTRAINT [PK_TBL_UrunOzellik] PRIMARY KEY CLUSTERED 
(
	[UrunOzellik_UrunID] ASC,
	[UrunOzellik_OzellikTipID] ASC,
	[UrunOzellik_OzellikDegerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_Auth] ([KullaniciAdi], [Sifre]) VALUES (N'kader', N'1234')
SET IDENTITY_INSERT [dbo].[TBL_Kargo] ON 

INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (1, N'Yurtiçi Kargo', N'Serdivan', N'05111111111    ', N'www.yurtici.com', N'yurtici@gmail.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (2, N'Mng Kargo', N'Arifiye', N'05111111112    ', N'www.mng.com', N'mng@gmail.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (3, N'Aras Kargo', N'Adapazarı', N'05111111113    ', N'www.aras.com', N'aras@gmail.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (4, N'Ptt Kargo', N'Serdivan', N'05422543656    ', N'www.ptt.com', N'ptt@info.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (5, N'Sürat Kargo', N'Adapazarı', N'05362145365    ', N'www.suratkargo.com', N'info@suratkargo.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (6, N'UPS Kargo', N'İstanbul', N'05423621253    ', N'www.ups.com/kargo', N'kargo@ups.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (7, N'DHL Kargo', N'Bilecik', N'05689652365    ', N'www.dhl.com', N'dhl@gmail.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (8, N'TNT Kargo', N'İzmir', N'05893694512    ', N'www.tnt.com', N'tntkargo@gmail.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (9, N'InterGlobalKargo', N'İstanbul', N'05963256398    ', N'www.igk.com', N'kargo@igk.com')
INSERT [dbo].[TBL_Kargo] ([KargoID], [Kargo_Firma_Adi], [Kargo_Adres], [Kargo_Telefon], [Kargo_WebSite], [Kargo_Email]) VALUES (10, N'MetroKargo', N'Sakarya', N'05689741236    ', N'www.metro.com', N'metrokargo@gmail.com')
SET IDENTITY_INSERT [dbo].[TBL_Kargo] OFF
SET IDENTITY_INSERT [dbo].[TBL_Kategori] ON 

INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (1, N'Sneaker', N'Snekar Ayakkabı', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (2, N'Günlük Ayakkabı', N'Günlük Ayakkabı', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (3, N'Bot', N'Bot', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (4, N'Outdoor Ayakkabı', N'Outdoor', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (5, N'Klasik Ayakkabı', N'Klasik', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (6, N'Spor Ayakkabı', N'Spor', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (7, N'Sandalet', N'Sandalet', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (8, N'Terlik', N'Terlik', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (9, N'Ev Ayakkabısı', N'Ev', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (10, N'Ayakkabı Aksesuar', N'Aksesuar', NULL)
INSERT [dbo].[TBL_Kategori] ([Kategori_ID], [Kategori_Adi], [Kategori_Aciklama], [Kategori_ResimID]) VALUES (11, N'Ayakkabı Bakım', N'Bakım', NULL)
SET IDENTITY_INSERT [dbo].[TBL_Kategori] OFF
SET IDENTITY_INSERT [dbo].[TBL_Marka] ON 

INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (1, N'Kinetix', N'Kinetix Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (2, N'Polaris', N'Polaris Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (3, N'Nike', N'Nike Ayakkabi Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (4, N'Lumberjack', N'Lumberjack Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (5, N'Dockers by Gerli', N'Dockers by Gerli Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (6, N'U.S. Polo Assn.', N'U.S. Polo Assn. Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (7, N'Puma', N'Puma Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (8, N'Garamond', N'Garamond Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (9, N'Panama Club', N'Panama Club Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (10, N'Oxide', N'Oxide Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (11, N'JJ-Stiller', N'JJ-Stiller Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (12, N'Timberland', N'Timberland Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (13, N'adidas', N'adidas Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (14, N'A.Bottega', N'A.Bottega Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (15, N'Adolfo Carli', N'Adolfo Carli Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (16, N'Blink', N'Blink Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (17, N'Coraf', N'Coraf Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (18, N'Coxx', N'Coxx Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (19, N'Flo', N'Flo Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (20, N'Hot Chocolate', N'Hot Chocolate Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (21, N'In Blu', N'In Blu Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (22, N'Kebo', N'Kebo Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (23, N'Maritan', N'Maritan Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (24, N'Norberto Costa', N'Norberto Costa Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (25, N'Overstate', N'Overstate Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (26, N'Primigi', N'Primigi Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (27, N'Roberto Ley', N'Roberto Ley Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (28, N'RS4', N'RS4 Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (29, N'Sebago', N'Sebago Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (30, N'SlipStop', N'SlipStop Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (31, N'Thema', N'Thema Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (32, N'Werbenas', N'Werbenas Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (33, N'Cacharel', N'Cacharel Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (34, N'Cafeina', N'Cafeina Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (35, N'Change ', N'Change Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (36, N'Freemood', N'Freemood Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (37, N'Glif', N'Glif Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (38, N'HERGAR', N'HERGAR Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (39, N'Hummel', N'Hummel Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (40, N'Joseli', N'Joseli Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (41, N'Mirage', N'Mirage Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (42, N'Output', N'Output Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (43, N'Reebok', N'Reebok Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (44, N'Vans', N'Vans Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (45, N'New balance', N'New balance Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (46, N'Merrell', N'Merrell Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (47, N'Salomon', N'Salomon Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (48, N'Torex', N'Torex Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (49, N'Quicksilver', N'Quicksilver Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (50, N'Crocs', N'Crocs Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (51, N'Salvano', N'Salvano Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (52, N'Birkenstock', N'Birkenstock Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (53, N'Bjk', N'Bjk Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (54, N'Ambitious', N'Ambitious Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (55, N'Cordovan', N'Cordovan Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (56, N'Antarctica', N'Antarctica Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (57, N'Down Town', N'Down Town Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (58, N'Dunlop', N'Dunlop Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (59, N'FB', N'FB Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (60, N'Flexall', N'Flexall Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (61, N'Forester', N'Forester Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (62, N'Flogart ', N'Flogart Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (63, N'GS', N'GS Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (64, N'Havaianas', N'Havaianas Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (65, N'Keen', N'Keen Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (66, N'Lotto', N'Lotto Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (67, N'Mavi', N'Mavi Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (68, N'Mercedes', N'Mercedes Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (69, N'Mkz', N'Mkz Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (70, N'Mytrax', N'Mytrax Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (71, N'Overside', N'Overside Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (72, N'Pierre Cardin', N'Pierre Cardin Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (73, N'Slazenger ', N'Slazenger Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (74, N'Sperry Top Sider', N'Sperry Top Sider Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (75, N'The North Face', N'The North Face', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (76, N'Woly', N'Woly Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (77, N'Zen', N'Zen Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (78, N'Gola', N'Gola Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (79, N'Dark Seer', N'Dark Seer Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (80, N'CEYO', N'CEYO Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (81, N'JACK-WOLFSKIN', N'JACK-WOLFSKIN Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (82, N'RIDER', N'RIDER Ayakkabı Çeşitleri', NULL)
INSERT [dbo].[TBL_Marka] ([Marka_ID], [Marka_Ad], [Marka_Aciklama], [Marka_ResimID]) VALUES (83, N'FLO TOMIC', N'FLO TOMIC Ayakkabı Çeşitleri', NULL)
SET IDENTITY_INSERT [dbo].[TBL_Marka] OFF
SET IDENTITY_INSERT [dbo].[TBL_Musteri] ON 

INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (1, N'Ahmet', N'Aktaş', N'ahmet.aktas0', N'ahmetaktas0@gmail.com', N'0511111112     ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (2, N'Berat', N'Taş', N'berat.tas1', N'berttas@gmail.com', N'0511111113     ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (3, N'Caner', N'Al', N'caner.al', N'caner.al@gmail.com', N'0511111114     ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (4, N'Deniz', N'Ekin', N'denizekin', N'denizekin@gmail.com', N'0511111115     ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (5, N'Kader', N'Gür', N'kdrgur', N'kdrgur@gmail.com', N'05141255456    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (6, N'Hilal', N'Eltugral', N'hlleltgrl', N'hilal.eltugral@hotmail.com', N'05635698987    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (7, N'Onur', N'Cengiz', N'onurcengiz', N'onurcengiz54@hotmail.com', N'03698742365    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (8, N'Buse', N'Öncü', N'buse_oncu', N'bse_oncu@gmail.com', N'08975632145    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (9, N'Kadir', N'İnanır', N'kadir.inanır', N'kadir.inanır11@hotmail.com', N'08964572369    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (10, N'Hasan', N'Demir', N'hasannnn', N'hasandemr@gmail.com', N'05648963256    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (11, N'Cansu', N'Bağlı', N'cansucnu', N'cnsbgll@gmail.com', N'05697841236    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (12, N'Ali', N'Yılmaz', N'ali_yilmaz', N'alii.ylmaz34@hotmail.com', N'05896357841    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (13, N'Baran', N'Can', N'barancann', N'brncan@gmail.com', N'05142369874    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (14, N'Emel', N'Deniz', N'emeldeniiz', N'emel.deniz@hotmail.com', N'05981235469    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (15, N'Nesrin', N'Özel', N'nsrinozll', N'nesrinozell@gmail.com', N'05893651236    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (16, N'Sibel', N'Şen', N'sibelsennn', N'sibel.sen@hotmail.com', N'05412369874    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (17, N'Aslı', N'Tan', N'aslıtan', N'asli_tan@hotmail.com', N'05239687456    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (18, N'Kadir', N'Demirbaş', N'kadir.demirbas', N'kadirrdemirbas@gmail.com', N'05983651236    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (19, N'Halenur', N'Çelik', N'halenurceliik', N'halenur_celik@hotmail.com', N'05368742365    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (20, N'Hasan', N'Uysal', N'hsnnuysal', N'hasannuysall@gmail.com', N'05645632569    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (21, N'Berna', N'Işık', N'bernaa.isik', N'bernaisik@hotmail.com', N'05653214569    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (22, N'Derya', N'Uysal', N'dry_uysll', N'deryauysal@gmail.com', N'05453698547    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (23, N'Fahriye', N'Evcen', N'fahriyeevcn', N'fahriye.evcn@gmail.com', N'05486932564    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (24, N'Murat', N'Taş', N'murattas', N'murattas@gmail.com', N'05623698547    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (25, N'Kemal', N'Dağ', N'kemalldag', N'kmldgg@hotmail.com', N'05236984563    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (26, N'Kadriye', N'Buruk', N'kadriyeee', N'kdrybrk@gmail.com', N'05698523698    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (27, N'Lale', N'Hasanova', N'lalehasanova', N'lale.hasanova@gmail.com', N'05213698547    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (28, N'Yasin', N'Uysal', N'yasinnuysl', N'yasin_uysal@gmail.com', N'05236984563    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (29, N'Melis', N'Terzi', N'melissterzii', N'mls.trz@gmail.com', N'05369635896    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (30, N'Gaye', N'Önal', N'gayeönal', N'gayeonal@gmail.com', N'05632569856    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (31, N'Pelin', N'Taşkıran', N'peloo', N'pelin.taskrn@hotmail.com', N'06549632569    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (32, N'Hale', N'Kaya', N'halekaya', N'halekaya@gmail.com', N'05632365689    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (33, N'Ongun', N'Tan', N'onguntann', N'onguntan@gmail.com', N'05236984563    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (34, N'Fahri', N'Yılmaz', N'fahriyilmaz', N'fahriyilmaz@gmail.com', N'05632145632    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (35, N'Leyla', N'Işık', N'leylaaisikk', N'leyla.ısıkk@hotmail.com', N'05236985623    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (36, N'Yılmaz', N'Baş', N'yilmazzbass', N'ylmzbass@gmail.com', N'05623698547    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (37, N'Zeliha', N'Gündoğan', N'zelihaagndgn', N'zlhgndgnn@gmail.com', N'05639632589    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (38, N'Murat', N'Boz', N'muratboz', N'mrtboz@gmail.com', N'05632369874    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (39, N'Büşra', N'Tekin', N'busra.tekin', N'busra_tekin@hotmail.com', N'05632369874    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (40, N'Yeliz', N'Güngör', N'ylzgungor', N'yeliz.gungor@gmail.com', N'05236987456    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (41, N'Yasemin', N'Uğur', N'ysmnugur', N'ysmnugur@gmail.com', N'05326987456    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (42, N'Ömer', N'Deniz', N'omer_deniz', N'omerrdeniz@gmail.com', N'05632145698    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (43, N'Veli', N'Tan', N'velitann', N'veli.tan@gmail.com', N'05635874123    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (44, N'Nesrin', N'Özcan', N'nerin_ozcan', N'nesrin.ozcan@gmail.com', N'05236987412    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (45, N'Tekin', N'Doğan', N'tekindogann', N'tekin.dogan@gmail.com', N'05326987456    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (46, N'Müslüm', N'Baba', N'muslumbabaa', N'muslum.baba@gmail.com', N'05326987456    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (47, N'Şeyda', N'Erdoğan', N'seyda_erdogan', N'seydaaa@gmail.com', N'05698745236    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (48, N'Naim', N'Süleymanoğlu', N'naimslmnoglu', N'naimslmnoglu@gmail.com', N'05632365896    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (49, N'Yağmur', N'Yılmaz', N'yagmur.yılmaz', N'ygmrylmzz@gmail.com', N'05369874563    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (50, N'Ziya', N'Uşak', N'ziyausak', N'ziya.usakk@gmail.com', N'05326987845    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (51, N'Yağmur', N'Atalı', N'yagmurratali', N'yagmuratali52@hotmail.com', N'05236987412    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (52, N'Emin', N'Güzel', N'eminn.guzel', N'eminnguzell11@gmail.com', N'05326987412    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (53, N'Mücahit', N'Ilıcalı', N'mücahitttill', N'mchtilcli@gma,l.com', N'05326987456    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (54, N'Ferdi', N'Tayfur', N'ferditayfur54', N'ferditayfur54@gmail.com', N'05632369874    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (55, N'Ezgi', N'Doğu', N'ezgiiii', N'ezgi.dogu.11@gmail.com', N'05236987452    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (56, N'Metehan', N'Mutlu', N'methanmtlu', N'metehanmutluu@hotmail.com', N'05256423556    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (57, N'Ersin', N'Kaşçı', N'ersnkscii', N'ersinn234@gmail.com', N'05235655595    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (58, N'Orhan', N'Işık', N'orhnisikk', N'orhanmert@gmail.com', N'02369874563    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (59, N'Batuhan', N'Arabacı', N'bthnarabacii', N'bthnnarbaci57@gmail.com', N'05632581285    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (60, N'Özge', N'Kapusız', N'ozge.kpsz', N'ozge_kpsz11@gmail.com', N'05326987412    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (61, N'Sümeyye ', N'Güzel', N'smyyyee', N'smyegzl2365@gmail.com', N'05238529636    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (62, N'Elif', N'Musluk', N'eliifmuslukk', N'elf.musluk@hotmail.com', N'05237412588    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (63, N'Emine ', N'Değirmenci', N'emndegirmencii', N'eminedegirmenci@gmail.com', N'02368569755    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (64, N'Buket', N'Yaman', N'buketyamannn', N'buket876@gmail.com', N'02538965412    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (65, N'Dilara', N'Çevik', N'dilaracevik', N'dilaracevik12@gmail.com', N'05894447566    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (66, N'Başak', N'Hızlı', N'basak_hizlii', N'basakhizli@hotmail.com', N'05236946555    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (67, N'Rabia', N'Özlü', N'rabisss', N'rabiaozlu123@hotmail.com', N'05232265555    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (68, N'Şule', N'Ünal', N'suleunall', N'sulee45unal@gmail.com', N'05235566987    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (69, N'Nisanur', N'Karakuzu', N'nisanurkazaruzu11', N'nisaa345@hotmail.com', N'05236985522    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (70, N'Özkan', N'Afacan', N'ozkanafacan', N'ozkanafacann@gmail.com', N'05235577441    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (71, N'Fatih', N'Tetik', N'fatihhtetik', N'ftihttk635@gmail.com', N'05478123566    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (72, N'Bilal ', N'Başhan', N'bllbashan', N'bilal.bashan.12@gmail.com', N'05287964254    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (73, N'Halil', N'Koca', N'halil_koca', N'halill.kocaa@hotmail.com', N'05785624556    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (74, N'Samet', N'Baş', N'sametbass', N'samet_bas34@gmail.com', N'05875362225    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (75, N'Tuba', N'İşlek', N'tubiss', N'tubaislek67@gmail.com', N'05462564685    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (76, N'Esra', N'Al', N'al25', N'al@gmail.com', N'05684589621    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (77, N'Nilsu', N'Tetik', N'tetik65', N'titik@hotmail.com', N'05384896219    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (78, N'Nilsunur', N'Tetik', N'nilsu25', N'nilsu@icloude.com', N'05487893652    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (79, N'Onur', N'Tetik', N'onur25', N'onur96@hotmail.com', N'05486879524    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (80, N'Ali ', N'Yurt', N'yurt89', N'yurt89@hotmail.com', N'05356771202    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (81, N'Emre', N'Minnet', N'minnetemre25', N'minnet@gmail.com', N'05365489548    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (82, N'Hilal', N'Er', N'erhilal34', N'erhilal@hotmail.com', N'05368897795    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (83, N'Yunus', N'Erik', N'erikyunus', N'erikyunus@outlook.com', N'05458961023    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (84, N'Tuba', N'Kot', N'tubakt', N'kt@gmail.com', N'05367895245    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (85, N'Esra', N'Rol', N'rlesra45', N'esraaaaa@gmail.com', N'05478963155    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (86, N'Cemil', N'Çakır', N'ckry89', N'ckr@gmail.com', N'05359955445    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (87, N'Meryem', N'Çakır', N'meryemj7', N'merm@gmail.com', N'05369875236    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (88, N'Esmanur', N'Çakır', N'esma78', N'ckresma@icloude.com', N'05587669565    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (89, N'Aleynanur', N'Çakır', N'alyn58', N'alyn58@gmail.com', N'05333878951    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (90, N'Hilmi', N'Çakır', N'hlm', N'hlmckr@gmail.com', N'05369895167    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (91, N'Esra', N'Koca', N'kcaesra', N'kces@gmail.com', N'05358795156    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (92, N'Mehmet', N'Koca', N'mehmet', N'mehmet@gmail.com', N'05359778234    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (93, N'Ali', N'Koca', N'kocaali7', N'7koca@hotmail.com', N'05359979999    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (94, N'Burak', N'Koca', N'brk45', N'45br@gmail.com', N'05555555555    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (95, N'Burakcan', N'Kurt', N'krt45', N'krt@gmail.com', N'05458522222    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (96, N'Murat', N'Kurt', N'mrt48i', N'mert@hotmail.com', N'05489348995    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (97, N'Ali', N'Ateş', N'ates25', N'ates@gmail.com', N'05354896333    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (98, N'Mehmet', N'Ateş', N'mehmet45', N'i45@gmail.com', N'05336789551    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (99, N'Kadir', N'Ay', N'aykadir', N'ay@gmail.com', N'05365895155    ')
GO
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (100, N'Ali', N'Ay', N'ali325ay', N'ali25ay@hotmail.com', N'05454444444    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (101, N'Kiraz ', N'Ay', N'aykiraz25', N'kiraz@gmail.com', N'05559999999    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (102, N'Murat', N'Kiraz', N'kiraz25', N'murat4@gmail.com', N'05555555999    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (103, N'Esra ', N'Kiraz', N'kiraz78', N'kiraz@hotmail.com', N'05555487966    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (104, N'Caner', N'Kitap', N'kitap25', N'cnr@gmail.com', N'05366555555    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (105, N'Yunus', N'Kitap', N'kitappppp', N'kitappp@gmail.com', N'05335999955    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (106, N'Veli', N'Kalem', N'veli', N'velik@hotmail.com', N'05359742222    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (107, N'Neslihan', N'Yurtkul', N'yrtkl', N'yrtkl@homtail.com', N'05359897777    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (108, N'Hilal', N'Yurtkul', N'hlyrt', N'hlyrt@hotmail.com', N'05558888888    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (109, N'İbrahim', N'Yurtkul', N'ibrhmyrt25', N'yrtnj@hotmail.com', N'05588899777    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (110, N'Numan', N'Al', N'alnu', N'alnu@hotmail.com', N'05355558899    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (111, N'Okan', N'Dogan', N'dgn78', N'78dgn@hotmail.com', N'05555774111    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (112, N'Umut', N'Emre', N'emreokan', N'emreokan45@gmail.com', N'04525666985    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (113, N'Okan', N'Mehmet', N'45mhmto', N'mhmto@hotmail.com', N'05498654658    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (114, N'Rumeysa', N'Ok', N'ok254', N'r@gmail.com', N'05444444444    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (115, N'Ogeday', N'Kol', N'kol25', N'kl25@gmail.com', N'05448521658    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (116, N'Murat', N'Yuce', N'25yüce', N'yuce@gmail.com', N'05423468848    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (117, N'Mustafa', N'Yuce', N'yuce25', N'y25@hotmail.com', N'05454845865    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (118, N'Hilal', N'Yuce', N'hlyce78', N'y8888@hotmail.com', N'05546515668    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (119, N'Ahmet', N'Yıldız', N'yldza', N'yldz@hotmail.com', N'05654898754    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (120, N'Yıldız', N'Yıldız', N'yldz25', N'yldz@gmail.com', N'04235855589    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (121, N'Ugur', N'Ola', N'ola78', N'ola@gmail.com', N'05421884515    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (122, N'Ayşe', N'Kaya', N'kya59', N'kya@gmail.com', N'05426489855    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (123, N'Sultan', N'Kaya', N'sltn78', N'sltn78@gmail.com', N'04523168997    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (124, N'Kayahan', N'Kaya', N'kya55555', N'5555@gmail.com', N'05464655546    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (125, N'Emre', N'Oktay', N'oktay', N'lakksld@hotmail.com', N'05421488884    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (126, N'Büsra', N'Yumusak', N'by78', N'busr@gmail.com', N'04421515548    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (127, N'Bugra', N'Efe', N'efe666', N'be@hotmail.com', N'05451458588    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (128, N'Can', N'Yüz', N'yüz25', N'y25@hotmail.com', N'05454894845    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (129, N'Emre', N'Yüz', N'emrey', N'mm@gmail.com', N'04123887545    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (130, N'Kadir', N'Kurt', N'krt7889', N'kadir25@hotmail.com', N'01123548888    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (131, N'Yusuf', N'Kurt', N'ysfk88', N'ysf78@gmail.com', N'04515646565    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (132, N'Yusuf', N'Ak', N'ak465', N'akyus@gmail.com', N'05421358781    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (133, N'Yunus', N'Ak', N'aky78', N'aky@hottmail.com', N'01234887844    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (134, N'Yakup', N'Ak', N'ykpak', N'aku@hotmail.com', N'01223458984    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (135, N'Esra', N'Ak', N'ak7895', N'oks@hotmail.com', N'02148154897    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (136, N'Jale', N'Ak', N'al', N'dep@gmail.com', N'05520554555    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (137, N'Osman', N'Yüce', N'yucosma', N'osmn@gmail.com', N'05458789455    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (138, N'Ömer', N'El', N'elom7', N'om@gmail.com', N'04545254794    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (139, N'Ömer', N'Ot', N'otomer', N'omer88@hotmail.com', N'05412058845    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (140, N'Kadir', N'Ela', N'omer25', N'ela@gmail.com', N'05546518989    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (141, N'Emre', N'Ela', N'emre888', N'em@gmail.com', N'04134888899    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (142, N'Murat', N'Taş', N'mrtts', N'tsmr@gmail.com', N'01232564564    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (143, N'Emre', N'Taş', N'emre665', N'tsem@hotmail.com', N'04231889715    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (144, N'Toprak', N'Taş', N'toprak7', N'tt@hotmail.com', N'01256489797    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (145, N'Ali', N'Toprak', N'tprkali', N'tpr@hotmail.com', N'01256489989    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (146, N'Mehmet', N'Toprak', N'tpmehm', N'mehtp@gmail.com', N'03115648844    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (147, N'Ali', N'Demir', N'dmr5', N'dmrali@gmail.com', N'05278523487    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (148, N'Yakup', N'Demir', N'ykdmr', N'ykkdmer@icloude.com', N'02135489848    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (149, N'Şeyma', N'Tekin', N'tknsyma', N'syme@hotmail.com', N'01512456844    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (150, N'Muratcan', N'Tekin', N'tknmura', N'tknmura@gmail.com', N'02615656156    ')
INSERT [dbo].[TBL_Musteri] ([Musteri_ID], [Musteri_Adi], [Musteri_Soyadi], [Musteri_KullaniciAdi], [Musteri_Email], [Musteri_Telefon]) VALUES (151, N'Ali', N'Tekin', N'alitkn', N'ali25m@gmail.com', N'01232456688    ')
SET IDENTITY_INSERT [dbo].[TBL_Musteri] OFF
SET IDENTITY_INSERT [dbo].[TBL_MusteriAdres] ON 

INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (1, 1, N'Serdivan serdi sokağı no 5', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (4, 2, N'Arifiye arifbey mahallesi 4.sokak no 9', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (5, 41, N'Adapazarı palmiye sokak akın apt ', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (6, 4, N'Akyazı akyazi sokak no 4', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (7, 5, N'Bozüyük-Bilecik', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (8, 6, N'Mihalgazi-Eskişehir', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (9, 7, N'Mecidiyeköy-İstanbul', N'İsyeri')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (10, 8, N'Sultanbeyli-İstanbul', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (11, 9, N'Pendik-İstanbul', N'İsyeri')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (12, 10, N'Buca-İzmir', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (13, 11, N'Ümraniye-İstanbul', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (14, 12, N'Söğüt-Bilecik', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (15, 13, N'Ereğli-Zonguldak', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (16, 14, N'Çengelköy-İstanbul', N'İsyeri')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (17, 15, N'Mecidiyeköy-İstanbul', N'İsyeri')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (18, 16, N'Osmangazi-Bursa', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (19, 17, N'Nilüfer-Bursa', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (20, 18, N'Serdivan-Sakarya', N'İşyeri')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (21, 19, N'Kadıköy-İstanbul', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (22, 20, N'Başaran-Bursa', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (23, 21, N'Dumlupınar-Kütahya', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (24, 22, N'Çengelköy-İstanbul', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (25, 23, N'Orhangazi-Bursa', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (26, 24, N'Ataşehir-İstanbul', N'Okul')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (27, 25, N'Ataşehir-İstanbul', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (28, 26, N'Ataşehir-İstanbul', N'Yurt')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (29, 27, N'Şişli-İstanbul', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (30, 28, N'Şişli-İstanbul', N'Okul')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (31, 29, N'Şişli-İstanbul', N'Yurt')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (32, 30, N'Şişli-İstanbul', N'İş')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (33, 31, N'Erenler-Sakarya', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (34, 32, N'Erenler-Sakarya', N'İş')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (35, 33, N'Erenler-Sakarya', N'Okul')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (36, 34, N'Erenler-Sakarya', N'Yurt')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (37, 35, N'Hendek-Sakarya', N'Okul')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (38, 36, N'Hendek-Sakarya', N'İş')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (39, 37, N'Hendek-Sakarya', N'Yurt')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (40, 38, N'Ferizli-Sakarya', N'Ev')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (41, 39, N'Ferizli-Sakarya', N'Okul')
INSERT [dbo].[TBL_MusteriAdres] ([MusteriAdres_ID], [MusteriAdres_MusteriID], [MusteriAdres_Adres], [MusteriAdres_Adi]) VALUES (42, 40, N'Ferizli-Sakarya', N'Yurt')
SET IDENTITY_INSERT [dbo].[TBL_MusteriAdres] OFF
SET IDENTITY_INSERT [dbo].[TBL_OzellikDeger] ON 

INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (1, N'35', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (2, N'36', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (3, N'37', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (4, N'38', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (5, N'39', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (6, N'40', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (8, N'41', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (10, N'42', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (11, N'43', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (12, N'44', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (13, N'45', NULL, 18)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (14, N'35', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (15, N'36', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (16, N'37', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (17, N'38', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (18, N'39', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (19, N'40', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (20, N'41', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (21, N'42', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (22, N'43', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (23, N'44', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (24, N'45', NULL, 19)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (25, N'35', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (26, N'36', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (27, N'37', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (28, N'38', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (29, N'39', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (30, N'40', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (31, N'41', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (32, N'42', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (33, N'43', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (34, N'44', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (35, N'45', NULL, 20)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (36, N'Siyah', NULL, 1)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (37, N'Lacivert', NULL, 1)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (38, N'Kırmızı', NULL, 1)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (39, N'Beyaz', NULL, 1)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (40, N'Siyah', NULL, 6)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (41, N'Lacivert', NULL, 6)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (42, N'Kırmızı', NULL, 6)
INSERT [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID], [OzellikDeger_Adi], [OzellikDeger_Aciklama], [OzellikDeger_OzellikTipID]) VALUES (43, N'Beyaz', NULL, 6)
SET IDENTITY_INSERT [dbo].[TBL_OzellikDeger] OFF
SET IDENTITY_INSERT [dbo].[TBL_OzellikTip] ON 

INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (1, N'Renk', N'Ayakkabı Rengi', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (3, N'Model', N'Ayakkabı Modeli', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (4, N'Cinsiyet', N'Cinsiyet', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (5, N'Malzeme', N'Kullanılan Malzeme', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (6, N'Renk', N'Ayakkabı Rengi', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (7, N'Model', N'Ayakkabı Modeli', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (8, N'Cinsiyet', N'Cinsiyet', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (9, N'Malzeme', N'Kullanılan Malzeme', 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (10, N'Renk', NULL, 2)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (11, N'Model', NULL, 2)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (12, N'Cinsiyet', NULL, 2)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (13, N'Malzeme', NULL, 2)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (14, N'Renk', NULL, 3)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (15, N'Model', NULL, 3)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (16, N'Cinsiyet', NULL, 3)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (17, N'Malzeme', NULL, 3)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (18, N'Beden', NULL, 1)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (19, N'Beden', NULL, 2)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (20, N'Beden', NULL, 3)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (21, N'Beden', NULL, 4)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (22, N'Beden', NULL, 5)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (23, N'Beden', NULL, 6)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (24, N'Beden', NULL, 7)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (25, N'Beden', NULL, 8)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (26, N'Beden', NULL, 9)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (27, N'Beden', NULL, 10)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (28, N'Beden', NULL, 11)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (29, N'Renk', NULL, 4)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (30, N'Renk', NULL, 5)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (31, N'Renk', NULL, 6)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (33, N'Renk', NULL, 7)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (34, N'Renk', N'', 8)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (35, N'Renk', NULL, 9)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (36, N'Renk', NULL, 10)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (37, N'Renk', NULL, 11)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (38, N'Model', NULL, 4)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (39, N'Model', NULL, 5)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (40, N'Model', NULL, 6)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (41, N'Model', NULL, 7)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (42, N'Model', NULL, 8)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (43, N'Model', NULL, 9)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (44, N'Model', NULL, 10)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (45, N'Model', NULL, 11)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (46, N'Cinsiyet', NULL, 4)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (47, N'Cinsiyet', NULL, 5)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (48, N'Cinsiyet', NULL, 6)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (50, N'Cinsiyet', NULL, 7)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (51, N'Cinsiyet', NULL, 8)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (52, N'Cinsiyet', NULL, 9)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (53, N'Cinsiyet', NULL, 10)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (54, N'Cinsiyet', NULL, 11)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (55, N'Malzeme', NULL, 4)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (56, N'Malzeme', NULL, 5)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (57, N'Malzeme', NULL, 6)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (58, N'Malzeme', NULL, 7)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (59, N'Malzeme', NULL, 8)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (60, N'Malzeme', NULL, 9)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (61, N'Malzeme', NULL, 10)
INSERT [dbo].[TBL_OzellikTip] ([Ozellik_ID], [Ozellik_Adi], [Ozellik_Aciklama], [Ozellik_Kategori_ID]) VALUES (62, N'Malzeme', NULL, 11)
SET IDENTITY_INSERT [dbo].[TBL_OzellikTip] OFF
SET IDENTITY_INSERT [dbo].[TBL_Resim] ON 

INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (1, N'buyukresim.jpg', N'ortaresim.jpg', N'kucukresim.jpg', 1, 1)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (2, N'buyukresim2.jpg', N'ortaresim2.jpg', N'kucukresim2.jpg', 2, 8)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (3, N'buyukresim3.jpg', N'ortaresim3.jpg', N'kucukresim3.jpg', 3, 1)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (4, N'buyukresim4.jpg', N'ortaresim4.jpg', N'kucukresim4.jpg', 4, 1)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (5, N'buyukresim5.jpg', N'ortaresim5.jpg', N'kucukresim5.jpg', 5, 8)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (6, N'buyukresim6.jpg', N'ortaresim6.jpg', N'kucukresim6.jpg', 6, 8)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (7, N'buyukresim7.jpg', N'ortaresim7.jpg', N'kucukresim7.jpg', 7, 8)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (8, N'buyukresim8.jpg', N'ortaresim8.jpg', N'kucukresim8.jpg', 8, 8)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (9, N'buyukresim9.jpg', N'ortaresim9.jpg', N'kucukresim9.jpg', 9, 1)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (10, N'buyukresim10.jpg', N'ortaresim10.jpg', N'kucukresim10.jpg', 10, 1)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (11, N'buyukresim11.jpg', N'ortaresim11.jpg', N'kucukresim11.jpg', 11, 1)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (12, N'buyukresim11.jpg', N'ortaresim11.jpg', N'kucukresim11.jpg', 12, 13)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (13, N'buyukresim12.jpg', N'ortaresim12.jpg', N'kucukresim12.jpg', 13, 18)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (14, N'buyukresim13.jpg', N'ortaresim13.jpg', N'kucukresim13.jpg', 14, 15)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (15, N'buyukresim14.jpg', N'ortaresim14.jpg', N'kucukresim14.jpg', 15, 17)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (16, N'buyukresim15.jpg', N'ortaresim15.jpg', N'kucukresim15.jpg', 16, 14)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (17, N'buyukresim16.jpg', N'ortaresim16.jpg', N'kucukresim16.jpg', 17, 15)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (18, N'buyukresim17.jpg', N'ortaresim17.jpg', N'kucukresim17.jpg', 18, 15)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (19, N'buyukresim18.jpg', N'ortaresim18.jpg', N'kucukresim18.jpg', 19, 16)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (20, N'buyukresim19.jpg', N'ortaresim19.jpg', N'kucukresim19.jpg', 20, 11)
INSERT [dbo].[TBL_Resim] ([Resim_ID], [Resim_Buyuk_Yolu], [Resim_Orta_Yolu], [Resim_Kucuk_Yolu], [Resim_SiraNo], [Resim_UrunID]) VALUES (21, N'buyukresim20.jpg', N'ortaresim20.jpg', N'kucukresim20.jpg', 21, 11)
SET IDENTITY_INSERT [dbo].[TBL_Resim] OFF
SET IDENTITY_INSERT [dbo].[TBL_Satis] ON 

INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (2, 1, CAST(N'2019-12-13T00:00:00.000' AS DateTime), 150.0000, 1, 1, 1, N'1')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (3, 2, CAST(N'2019-12-13T00:00:00.000' AS DateTime), 400.0000, 1, 1, 4, N'2')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (4, 3, CAST(N'2019-12-13T00:00:00.000' AS DateTime), 650.0000, 1, 2, 3, N'3')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (5, 4, CAST(N'2019-12-13T00:00:00.000' AS DateTime), 600.0000, 1, 3, 4, N'4')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (7, 5, CAST(N'2019-07-23T12:25:32.067' AS DateTime), 9876.3652, 1, 4, 2, N'5')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (8, 6, CAST(N'2019-06-30T09:53:23.023' AS DateTime), 326.0000, 1, 5, 4, N'6')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (12, 7, CAST(N'2018-11-11T11:11:11.037' AS DateTime), 659875.2300, 1, 6, 2, N'6')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (41, 6, CAST(N'2018-12-28T23:26:52.157' AS DateTime), 963.2650, 1, 5, 2, N'6')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (42, 10, CAST(N'2018-04-23T14:15:23.660' AS DateTime), 500.2500, 1, 9, 4, N'4')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (43, 11, CAST(N'2018-02-11T15:26:55.000' AS DateTime), 652.2500, 1, 10, 6, N'11')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (46, 11, CAST(N'2019-06-13T18:12:56.323' AS DateTime), 6352.5550, 1, 9, 4, N'11')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (49, 35, CAST(N'2019-06-13T18:12:56.327' AS DateTime), 259.0000, 1, 5, 5, N'12')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (50, 45, CAST(N'2019-06-13T18:12:56.550' AS DateTime), 9000.0000, 1, 2, 5, N'18')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (51, 55, CAST(N'2019-05-13T18:12:56.323' AS DateTime), 158.0000, 1, 3, 4, N'20')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (52, 60, CAST(N'2015-05-13T18:12:56.323' AS DateTime), 785.0000, 1, 1, 1, N'21')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (53, 100, CAST(N'2016-05-13T18:12:56.323' AS DateTime), 452.5555, 1, 5, 2, N'38')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (54, 120, CAST(N'2016-05-13T20:12:56.323' AS DateTime), 895.0000, 1, 2, 2, N'40')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (55, 121, CAST(N'2016-05-13T18:12:56.320' AS DateTime), 555.4444, 1, 2, 4, N'50')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (56, 135, CAST(N'2016-11-13T18:12:56.323' AS DateTime), 25.5550, 1, 2, 4, N'90')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (57, 136, CAST(N'2016-05-13T18:12:56.300' AS DateTime), 458.4440, 0, 3, 4, N'60')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (58, 138, CAST(N'2011-05-13T18:12:56.323' AS DateTime), 256.4400, 0, 2, 2, N'55')
INSERT [dbo].[TBL_Satis] ([Satis_ID], [Satis_MusteriID], [Satis_Tarih], [Satis_ToplamTutar], [Satis_SepetteMi], [Satis_KargoID], [Satis_SiparisDurumID], [Satis_KargoTakipNo]) VALUES (59, 140, CAST(N'2016-05-13T18:11:56.323' AS DateTime), 2555.0000, 0, 2, 4, N'25')
SET IDENTITY_INSERT [dbo].[TBL_Satis] OFF
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (2, 1, 1, 150.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (3, 8, 2, 400.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (4, 10, 3, 650.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (5, 11, 4, 600.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (7, 11, 23, 890.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (8, 15, 19, 3600.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (12, 1, 4, 980.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (41, 8, 2, 650.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (42, 18, 5, 1000.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (43, 16, 2, 1558.2222, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (46, 8, 5, 1000.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (49, 18, 1, 1000.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (51, 14, 1, 500.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (53, 13, 3, 2000.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (55, 18, 1, 750.0000, 0)
INSERT [dbo].[TBL_SatisDetay] ([SatisDetay_SatisID], [SatisDetay_UrunID], [SatisDetay_Adet], [SatisDetay_Fiyat], [SatisDetay_Indirim]) VALUES (57, 18, 6, 1000.0000, 0)
SET IDENTITY_INSERT [dbo].[TBL_SiparisDurum] ON 

INSERT [dbo].[TBL_SiparisDurum] ([SiparisDurum_ID], [SiparisDurum_Adi], [SiparisDurum_Aciklama]) VALUES (1, N'Sipariş Alındı', N'Sipariş Alındı...')
INSERT [dbo].[TBL_SiparisDurum] ([SiparisDurum_ID], [SiparisDurum_Adi], [SiparisDurum_Aciklama]) VALUES (2, N'Onay bekleniyor', N'Sipariş için onay bekleniyor...')
INSERT [dbo].[TBL_SiparisDurum] ([SiparisDurum_ID], [SiparisDurum_Adi], [SiparisDurum_Aciklama]) VALUES (3, N'Tedarik Aşamasında', N'Siparis tedarik aşamasında...')
INSERT [dbo].[TBL_SiparisDurum] ([SiparisDurum_ID], [SiparisDurum_Adi], [SiparisDurum_Aciklama]) VALUES (4, N'Kargoya Verildi', N'Siparis tasima durumunda.')
INSERT [dbo].[TBL_SiparisDurum] ([SiparisDurum_ID], [SiparisDurum_Adi], [SiparisDurum_Aciklama]) VALUES (5, N'Kargo Dağıtıma Çıktı', N'Siparis kargo tasima durumunda...')
INSERT [dbo].[TBL_SiparisDurum] ([SiparisDurum_ID], [SiparisDurum_Adi], [SiparisDurum_Aciklama]) VALUES (6, N'Teslim Edilidi', N'Sipariş teslim edildi...')
SET IDENTITY_INSERT [dbo].[TBL_SiparisDurum] OFF
SET IDENTITY_INSERT [dbo].[TBL_Urun] ON 

INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (1, N'Ayakkabi', 1, 1, N'13.12.2019', N'2 yıl', N'SANTA M 9PR Siyah Erkek Sneaker Ayakkabı', 10, 129.9900, 100)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (8, N'Ayakkabi', 1, 1, N'13.12.2019', N'2 yıl', N'SANTA M 9PR Lacivert Erkek Sneaker Ayakkabı', 15, 130.0000, 150)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (10, N'Ayakkabi', 1, 1, N'13.12.2019', N'2 yıl', N'NESTOR PU M 9PR Lacivert Erkek Sneaker Ayakkabı', 20, 100.0000, 250)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (11, N'Ayakkabi', 48, 1, N'13.12.2019', N'2 yıl', N'JODER Beyaz Erkek Sneaker Ayakkabı', 30, 60.0000, 500)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (13, N'Ayakkabi', 4, 1, N'13.12.2019', N'2 yıl', N'FARGO Lacivert Erkek Sneaker Ayakkabı', 9, 250.0000, 50)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (14, N'Ayakkabi', 4, 1, N'13.12.2019', N'2 yıl', N'DAX Lacivert Erkek Sneakar ', 8, 190.0000, 75)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (15, N'Ayakkabı', 2, 2, N'13.12.2019', N'2 yıl', N'Noel 9pr Siyah Erkek Sneaker Ayakkabı', 15, 160.0000, 5)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (16, N'Ayakkabı', 65, 5, N'19.04.2019', N'2 yıl', N'FLObot BAYAN256', 63, 165.0000, 650)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (17, N'Ayakkabı', 23, 2, N'26.11.2018', N'2 yıl', N'lumberjackbay45665', 89, 360.2000, 896)
INSERT [dbo].[TBL_Urun] ([Urun_ID], [Urun_Adi], [Urun_Marka_ID], [Urun_Kategori_ID], [Urun_Eklenme_Tarihi], [Urun_Garanti_Suresi], [Urun_Aciklama], [Urun_Stok_Sayisi], [Urun_Fiyati], [Urun_Goruntulenme_Sayisi]) VALUES (18, N'Ayakkabı', 46, 3, N'27.12.2018', N'2 YIL', N'BAMBİbayantopuklu326', 45, 180.0000, 563)
SET IDENTITY_INSERT [dbo].[TBL_Urun] OFF
INSERT [dbo].[TBL_UrunOzellik] ([UrunOzellik_UrunID], [UrunOzellik_OzellikTipID], [UrunOzellik_OzellikDegerID]) VALUES (1, 1, 36)
INSERT [dbo].[TBL_UrunOzellik] ([UrunOzellik_UrunID], [UrunOzellik_OzellikTipID], [UrunOzellik_OzellikDegerID]) VALUES (8, 1, 37)
INSERT [dbo].[TBL_UrunOzellik] ([UrunOzellik_UrunID], [UrunOzellik_OzellikTipID], [UrunOzellik_OzellikDegerID]) VALUES (10, 1, 38)
INSERT [dbo].[TBL_UrunOzellik] ([UrunOzellik_UrunID], [UrunOzellik_OzellikTipID], [UrunOzellik_OzellikDegerID]) VALUES (10, 13, 13)
INSERT [dbo].[TBL_UrunOzellik] ([UrunOzellik_UrunID], [UrunOzellik_OzellikTipID], [UrunOzellik_OzellikDegerID]) VALUES (11, 1, 39)
INSERT [dbo].[TBL_UrunOzellik] ([UrunOzellik_UrunID], [UrunOzellik_OzellikTipID], [UrunOzellik_OzellikDegerID]) VALUES (13, 18, 23)
INSERT [dbo].[TBL_UrunOzellik] ([UrunOzellik_UrunID], [UrunOzellik_OzellikTipID], [UrunOzellik_OzellikDegerID]) VALUES (14, 18, 22)
ALTER TABLE [dbo].[TBL_Satis] ADD  CONSTRAINT [DF_TBL_Satis_Satis_Tarih]  DEFAULT (getdate()) FOR [Satis_Tarih]
GO
ALTER TABLE [dbo].[TBL_Satis] ADD  CONSTRAINT [DF_TBL_Satis_Satis_SepetteMi]  DEFAULT ((1)) FOR [Satis_SepetteMi]
GO
ALTER TABLE [dbo].[TBL_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Kategori_TBL_Resim] FOREIGN KEY([Kategori_ResimID])
REFERENCES [dbo].[TBL_Resim] ([Resim_ID])
GO
ALTER TABLE [dbo].[TBL_Kategori] CHECK CONSTRAINT [FK_TBL_Kategori_TBL_Resim]
GO
ALTER TABLE [dbo].[TBL_Marka]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Marka_TBL_Resim] FOREIGN KEY([Marka_ResimID])
REFERENCES [dbo].[TBL_Resim] ([Resim_ID])
GO
ALTER TABLE [dbo].[TBL_Marka] CHECK CONSTRAINT [FK_TBL_Marka_TBL_Resim]
GO
ALTER TABLE [dbo].[TBL_MusteriAdres]  WITH CHECK ADD  CONSTRAINT [FK_TBL_MusteriAdres_TBL_Musteri1] FOREIGN KEY([MusteriAdres_MusteriID])
REFERENCES [dbo].[TBL_Musteri] ([Musteri_ID])
GO
ALTER TABLE [dbo].[TBL_MusteriAdres] CHECK CONSTRAINT [FK_TBL_MusteriAdres_TBL_Musteri1]
GO
ALTER TABLE [dbo].[TBL_OzellikDeger]  WITH CHECK ADD  CONSTRAINT [FK_TBL_OzellikDeger_TBL_OzellikTip] FOREIGN KEY([OzellikDeger_OzellikTipID])
REFERENCES [dbo].[TBL_OzellikTip] ([Ozellik_ID])
GO
ALTER TABLE [dbo].[TBL_OzellikDeger] CHECK CONSTRAINT [FK_TBL_OzellikDeger_TBL_OzellikTip]
GO
ALTER TABLE [dbo].[TBL_OzellikTip]  WITH CHECK ADD  CONSTRAINT [FK_TBL_OzellikTip_TBL_Kategori] FOREIGN KEY([Ozellik_Kategori_ID])
REFERENCES [dbo].[TBL_Kategori] ([Kategori_ID])
GO
ALTER TABLE [dbo].[TBL_OzellikTip] CHECK CONSTRAINT [FK_TBL_OzellikTip_TBL_Kategori]
GO
ALTER TABLE [dbo].[TBL_Resim]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Resim_TBL_Urun] FOREIGN KEY([Resim_UrunID])
REFERENCES [dbo].[TBL_Urun] ([Urun_ID])
GO
ALTER TABLE [dbo].[TBL_Resim] CHECK CONSTRAINT [FK_TBL_Resim_TBL_Urun]
GO
ALTER TABLE [dbo].[TBL_Satis]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Satis_TBL_Kargo] FOREIGN KEY([Satis_KargoID])
REFERENCES [dbo].[TBL_Kargo] ([KargoID])
GO
ALTER TABLE [dbo].[TBL_Satis] CHECK CONSTRAINT [FK_TBL_Satis_TBL_Kargo]
GO
ALTER TABLE [dbo].[TBL_Satis]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Satis_TBL_Musteri1] FOREIGN KEY([Satis_MusteriID])
REFERENCES [dbo].[TBL_Musteri] ([Musteri_ID])
GO
ALTER TABLE [dbo].[TBL_Satis] CHECK CONSTRAINT [FK_TBL_Satis_TBL_Musteri1]
GO
ALTER TABLE [dbo].[TBL_Satis]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Satis_TBL_SiparisDurum] FOREIGN KEY([Satis_SiparisDurumID])
REFERENCES [dbo].[TBL_SiparisDurum] ([SiparisDurum_ID])
GO
ALTER TABLE [dbo].[TBL_Satis] CHECK CONSTRAINT [FK_TBL_Satis_TBL_SiparisDurum]
GO
ALTER TABLE [dbo].[TBL_SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SatisDetay_TBL_Satis] FOREIGN KEY([SatisDetay_SatisID])
REFERENCES [dbo].[TBL_Satis] ([Satis_ID])
GO
ALTER TABLE [dbo].[TBL_SatisDetay] CHECK CONSTRAINT [FK_TBL_SatisDetay_TBL_Satis]
GO
ALTER TABLE [dbo].[TBL_SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SatisDetay_TBL_Urun] FOREIGN KEY([SatisDetay_UrunID])
REFERENCES [dbo].[TBL_Urun] ([Urun_ID])
GO
ALTER TABLE [dbo].[TBL_SatisDetay] CHECK CONSTRAINT [FK_TBL_SatisDetay_TBL_Urun]
GO
ALTER TABLE [dbo].[TBL_Urun]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Urun_TBL_Kategori] FOREIGN KEY([Urun_Kategori_ID])
REFERENCES [dbo].[TBL_Kategori] ([Kategori_ID])
GO
ALTER TABLE [dbo].[TBL_Urun] CHECK CONSTRAINT [FK_TBL_Urun_TBL_Kategori]
GO
ALTER TABLE [dbo].[TBL_Urun]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Urun_TBL_Marka] FOREIGN KEY([Urun_Marka_ID])
REFERENCES [dbo].[TBL_Marka] ([Marka_ID])
GO
ALTER TABLE [dbo].[TBL_Urun] CHECK CONSTRAINT [FK_TBL_Urun_TBL_Marka]
GO
ALTER TABLE [dbo].[TBL_UrunOzellik]  WITH CHECK ADD  CONSTRAINT [FK_TBL_UrunOzellik_TBL_OzellikDeger] FOREIGN KEY([UrunOzellik_OzellikDegerID])
REFERENCES [dbo].[TBL_OzellikDeger] ([OzellikDeger_ID])
GO
ALTER TABLE [dbo].[TBL_UrunOzellik] CHECK CONSTRAINT [FK_TBL_UrunOzellik_TBL_OzellikDeger]
GO
ALTER TABLE [dbo].[TBL_UrunOzellik]  WITH CHECK ADD  CONSTRAINT [FK_TBL_UrunOzellik_TBL_OzellikTip] FOREIGN KEY([UrunOzellik_OzellikTipID])
REFERENCES [dbo].[TBL_OzellikTip] ([Ozellik_ID])
GO
ALTER TABLE [dbo].[TBL_UrunOzellik] CHECK CONSTRAINT [FK_TBL_UrunOzellik_TBL_OzellikTip]
GO
ALTER TABLE [dbo].[TBL_UrunOzellik]  WITH CHECK ADD  CONSTRAINT [FK_TBL_UrunOzellik_TBL_Urun] FOREIGN KEY([UrunOzellik_UrunID])
REFERENCES [dbo].[TBL_Urun] ([Urun_ID])
GO
ALTER TABLE [dbo].[TBL_UrunOzellik] CHECK CONSTRAINT [FK_TBL_UrunOzellik_TBL_Urun]
GO
/****** Object:  StoredProcedure [dbo].[MaxGoruntulenme]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MaxGoruntulenme]
as
select top 5 Urun_Goruntulenme_Sayisi , Urun_Adi
from TBL_Urun
order by Urun_Goruntulenme_Sayisi desc




GO
/****** Object:  StoredProcedure [dbo].[UrunleriGetir]    Script Date: 14.01.2020 15:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UrunleriGetir]
as
select * from TBL_Urun
GO
USE [master]
GO
ALTER DATABASE [AyakkabiEvreni] SET  READ_WRITE 
GO
