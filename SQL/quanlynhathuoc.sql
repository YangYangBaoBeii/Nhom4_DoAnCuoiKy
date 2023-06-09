USE [master]
GO
/****** Object:  Database [QuanLyDuocPham]    Script Date: 4/19/2023 6:47:58 AM ******/
CREATE DATABASE [QuanLyDuocPham]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDuocPham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HUY\MSSQL\DATA\QuanLyDuocPham.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyDuocPham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HUY\MSSQL\DATA\QuanLyDuocPham_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyDuocPham] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDuocPham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDuocPham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyDuocPham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDuocPham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDuocPham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyDuocPham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDuocPham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyDuocPham] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDuocPham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDuocPham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDuocPham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDuocPham] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyDuocPham] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyDuocPham]
GO
/****** Object:  User [giahuy09cnpm2]    Script Date: 4/19/2023 6:47:58 AM ******/
CREATE USER [giahuy09cnpm2] FOR LOGIN [giahuy09cnpm2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GiaHuy]    Script Date: 4/19/2023 6:47:58 AM ******/
CREATE USER [GiaHuy] FOR LOGIN [GiaHuy1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_nvphucvubaonhieukhach]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_nvphucvubaonhieukhach] (@manv nvarchar(10))
RETURNS @tb_soluong table (manv nvarchar(10), soluongkhachphucvu nvarchar(10))
AS
BEGIN
	INSERT INTO @tb_soluong SELECT MaNV, count(MaKH) FROM KeToan WHERE MaNV = @manv group by MaNV 
	RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_tongtien5ngaythang4]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_tongtien5ngaythang4] ()
RETURNS int
AS
BEGIN
	RETURN (SELECT Sum(TongTien) FROM KeToan WHERE NgayGG between '2023-04-01' and '2023-04-05')
END
GO
/****** Object:  Table [dbo].[DanhMucHang]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhMucHang](
	[MaDMH] [nchar](10) NOT NULL,
	[TenDMH] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KeToan]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeToan](
	[MaGG] [nchar](10) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[MaKH] [nchar](10) NULL,
	[MaMH] [nchar](10) NULL,
	[NgayGG] [date] NULL,
	[Tongtien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nchar](10) NOT NULL,
	[TenKH] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MatHang]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MatHang](
	[MaMH] [nchar](10) NOT NULL,
	[TenMH] [varchar](30) NULL,
	[DonViTinh] [varchar](10) NULL,
	[DonGia] [money] NULL,
	[SoLuongTon] [int] NULL,
	[MaDMH] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [varchar](15) NULL,
	[ChucVu] [nvarchar](30) NULL,
	[NgaySinh] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DanhMucHang] ([MaDMH], [TenDMH]) VALUES (N'1         ', N'Thu?c dau d?u')
INSERT [dbo].[DanhMucHang] ([MaDMH], [TenDMH]) VALUES (N'2         ', N'Thu?c ho')
INSERT [dbo].[DanhMucHang] ([MaDMH], [TenDMH]) VALUES (N'3         ', N'Thu?c h? s?t')
INSERT [dbo].[DanhMucHang] ([MaDMH], [TenDMH]) VALUES (N'4         ', N'Thu?c kháng sinh')
INSERT [dbo].[DanhMucHang] ([MaDMH], [TenDMH]) VALUES (N'5         ', N'Thu?c tiêu hóa')
INSERT [dbo].[KeToan] ([MaGG], [MaNV], [MaKH], [MaMH], [NgayGG], [Tongtien]) VALUES (N'GG1       ', N'NV3       ', N'KH1       ', N'MH1       ', CAST(N'2023-04-01' AS Date), 75000.0000)
INSERT [dbo].[KeToan] ([MaGG], [MaNV], [MaKH], [MaMH], [NgayGG], [Tongtien]) VALUES (N'GG2       ', N'NV2       ', N'KH2       ', N'MH2       ', CAST(N'2023-04-02' AS Date), 160000.0000)
INSERT [dbo].[KeToan] ([MaGG], [MaNV], [MaKH], [MaMH], [NgayGG], [Tongtien]) VALUES (N'GG3       ', N'NV3       ', N'KH3       ', N'MH3       ', CAST(N'2023-04-03' AS Date), 70000.0000)
INSERT [dbo].[KeToan] ([MaGG], [MaNV], [MaKH], [MaMH], [NgayGG], [Tongtien]) VALUES (N'GG4       ', N'NV3       ', N'KH4       ', N'MH4       ', CAST(N'2023-04-04' AS Date), 60000.0000)
INSERT [dbo].[KeToan] ([MaGG], [MaNV], [MaKH], [MaMH], [NgayGG], [Tongtien]) VALUES (N'GG5       ', N'NV5       ', N'KH5       ', N'MH5       ', CAST(N'2023-04-04' AS Date), 48000.0000)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH1       ', N'Nguyễn Văn A', N'123 Nguyễn Trãi, Quận 5, TP.HCM', N'0123456789')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH2       ', N'Trần Thi B', N'456 Lê Lợi, Quận 1, TP.HCM', N'0987654321')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH3       ', N'Phạm Văn C', N'789 Trần Hưng Đạo, Quận 10, TP.HCM', N'0112233440')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH4       ', N'Lê Thị D', N'567 Phan Văn Trị, Gò Vấp, TP.HCM', N'0543219876')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH5       ', N'Vũ Văn E', N'321 Tôn Thất Thuyết, Quận 4, TP.HCM', N'0246813579')
INSERT [dbo].[MatHang] ([MaMH], [TenMH], [DonViTinh], [DonGia], [SoLuongTon], [MaDMH]) VALUES (N'MH1       ', N'Panadol', N'Viên', 20000.0000, 1000, N'1         ')
INSERT [dbo].[MatHang] ([MaMH], [TenMH], [DonViTinh], [DonGia], [SoLuongTon], [MaDMH]) VALUES (N'MH2       ', N'Siropex', N'Chai', 30000.0000, 500, N'2         ')
INSERT [dbo].[MatHang] ([MaMH], [TenMH], [DonViTinh], [DonGia], [SoLuongTon], [MaDMH]) VALUES (N'MH3       ', N'Ibuprofen', N'Viên', 25000.0000, 800, N'3         ')
INSERT [dbo].[MatHang] ([MaMH], [TenMH], [DonViTinh], [DonGia], [SoLuongTon], [MaDMH]) VALUES (N'MH4       ', N'Amoxicillin', N'Viên', 50000.0000, 200, N'4         ')
INSERT [dbo].[MatHang] ([MaMH], [TenMH], [DonViTinh], [DonGia], [SoLuongTon], [MaDMH]) VALUES (N'MH5       ', N'Imodium', N'Viên', 35000.0000, 600, N'5         ')
INSERT [dbo].[MatHang] ([MaMH], [TenMH], [DonViTinh], [DonGia], [SoLuongTon], [MaDMH]) VALUES (N'MH6       ', N'Lactolose', N'Gói', 10000.0000, 200, N'5         ')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh]) VALUES (N'NV1       ', N'Trần Văn X', N'12 Tô Ký, Quận 12, TP.HCM', N'0111111111', N'Quản lý', CAST(N'1999-12-12' AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh]) VALUES (N'NV2       ', N'Nguyễn Thị Y', N'34 Nguyễn Chí Thanh, Quận 5, TP.HCM', N'0222222222', N'Nhân viên', CAST(N'1996-04-02' AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh]) VALUES (N'NV3       ', N'Lê Văn Z', N'56 Lê Văn Sỹ, Quận Tân Bình, TP.HCM', N'0333333333', N'Nhân viên', CAST(N'1994-04-06' AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh]) VALUES (N'NV4       ', N'Phạm Thị K', N'123 Ngô Gia Tự, Quận 10, TP.HCM', N'0444444444', N'Kế Toán', CAST(N'1992-07-02' AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh]) VALUES (N'NV5       ', N'Võ Thị L', N'567 Phạm Văn Đồng, Gò Vấp, TP.HCM', N'0555555555', N'Nhân viên', CAST(N'1993-08-03' AS Date))
ALTER TABLE [dbo].[KeToan]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[KeToan]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MatHang] ([MaMH])
GO
ALTER TABLE [dbo].[KeToan]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD FOREIGN KEY([MaDMH])
REFERENCES [dbo].[DanhMucHang] ([MaDMH])
GO
/****** Object:  StoredProcedure [dbo].[sp_timnhanvientheomnv]    Script Date: 4/19/2023 6:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_timnhanvientheomnv] @manv nvarchar(10)
AS
BEGIN
	SELECT * FROM NhanVien WHERE @manv = MaNV
END

GO
USE [master]
GO
ALTER DATABASE [QuanLyDuocPham] SET  READ_WRITE 
GO
