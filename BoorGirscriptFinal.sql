USE [master]
GO
/****** Object:  Database [db_boorgir]    Script Date: 11/2/2021 1:38:12 PM ******/
CREATE DATABASE [db_boorgir]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_boorgir', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_boorgir.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_boorgir_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_boorgir_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_boorgir] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_boorgir].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_boorgir] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_boorgir] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_boorgir] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_boorgir] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_boorgir] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_boorgir] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_boorgir] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_boorgir] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_boorgir] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_boorgir] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_boorgir] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_boorgir] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_boorgir] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_boorgir] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_boorgir] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_boorgir] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_boorgir] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_boorgir] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_boorgir] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_boorgir] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_boorgir] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_boorgir] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_boorgir] SET RECOVERY FULL 
GO
ALTER DATABASE [db_boorgir] SET  MULTI_USER 
GO
ALTER DATABASE [db_boorgir] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_boorgir] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_boorgir] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_boorgir] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_boorgir] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_boorgir] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_boorgir', N'ON'
GO
ALTER DATABASE [db_boorgir] SET QUERY_STORE = OFF
GO
USE [db_boorgir]
GO
/****** Object:  Table [dbo].[BARRIOS]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BARRIOS](
	[id_barrio] [int] NOT NULL,
	[descripcion] [nvarchar](40) NULL,
 CONSTRAINT [pk_id_barrio] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[DNI] [bigint] NOT NULL,
	[tel_cliente] [nvarchar](50) NULL,
	[nom_cliente] [nvarchar](30) NULL,
	[ape_cliente] [nvarchar](40) NULL,
	[id_barrio] [int] NULL,
	[direccion] [nvarchar](80) NULL,
 CONSTRAINT [pk_dni_cliente] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLES_FACTURAS]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLES_FACTURAS](
	[detalle_nro] [int] NOT NULL,
	[id_factura] [int] NOT NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [money] NULL,
 CONSTRAINT [pk_detalle] PRIMARY KEY CLUSTERED 
(
	[detalle_nro] ASC,
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURAS]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURAS](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[id_vendedor] [int] NULL,
	[DNI] [bigint] NULL,
	[id_forma] [int] NULL,
	[descuento] [decimal](4, 2) NULL,
	[total] [money] NULL,
 CONSTRAINT [pk_id_factuta] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMAS_PAGO]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMAS_PAGO](
	[id_forma] [int] NOT NULL,
	[descripcion] [nvarchar](30) NULL,
 CONSTRAINT [pk_id_forma] PRIMARY KEY CLUSTERED 
(
	[id_forma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[id_producto] [int] NOT NULL,
	[nom_producto] [nvarchar](50) NULL,
	[precio] [money] NULL,
 CONSTRAINT [pk_id_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENDEDORES]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDEDORES](
	[id_vendedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NULL,
	[apellido] [nvarchar](30) NULL,
	[nom_usuario] [nvarchar](30) NULL,
	[pwd] [nvarchar](30) NULL,
 CONSTRAINT [pk_id_empleado] PRIMARY KEY CLUSTERED 
(
	[id_vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (1, N'Córdoba')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (2, N'Norte')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (3, N'Sur')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (4, N'Alta Córdoba')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (5, N'Alto Alberdi')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (6, N'Alto Verde')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (7, N'Argüello')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (8, N'Bella Vista')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (9, N'Centro')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (10, N'Cerro de las Rosas')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (11, N'Chateau Carreras')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (12, N'Cofico')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (13, N'General Paz')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (14, N'Jardín')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (15, N'Nueva Córdoba')
INSERT [dbo].[BARRIOS] ([id_barrio], [descripcion]) VALUES (16, N'Villa Belgrano')
GO
INSERT [dbo].[CLIENTES] ([DNI], [tel_cliente], [nom_cliente], [ape_cliente], [id_barrio], [direccion]) VALUES (16354209, N'35130201', N'Luciano', N'Pereyra', 10, NULL)
INSERT [dbo].[CLIENTES] ([DNI], [tel_cliente], [nom_cliente], [ape_cliente], [id_barrio], [direccion]) VALUES (17765514, N'35180701', N'La Mona', N'Jimenez', 2, NULL)
INSERT [dbo].[CLIENTES] ([DNI], [tel_cliente], [nom_cliente], [ape_cliente], [id_barrio], [direccion]) VALUES (24171591, N'24171591', N'Miguel', N'Caceres', 1, N'2')
INSERT [dbo].[CLIENTES] ([DNI], [tel_cliente], [nom_cliente], [ape_cliente], [id_barrio], [direccion]) VALUES (27178533, N'35160458', N'Armando', N'Paredes', 15, NULL)
INSERT [dbo].[CLIENTES] ([DNI], [tel_cliente], [nom_cliente], [ape_cliente], [id_barrio], [direccion]) VALUES (34789511, N'35155955', N'Moria', N'Casan', 16, NULL)
INSERT [dbo].[CLIENTES] ([DNI], [tel_cliente], [nom_cliente], [ape_cliente], [id_barrio], [direccion]) VALUES (42856135, N'35140768', N'Jose', N'Fernandez', 3, NULL)
INSERT [dbo].[CLIENTES] ([DNI], [tel_cliente], [nom_cliente], [ape_cliente], [id_barrio], [direccion]) VALUES (44789156, N'35145671', N'Marcelo', N'Tinelli', 15, NULL)
GO
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 1, 6, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 2, 18, 1, 120.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 3, 6, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 4, 7, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 5, 17, 1, 100.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 6, 22, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 7, 9, 1, 1200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 8, 20, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 9, 2, 1, 500.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 10, 24, 1, 150.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 11, 10, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 12, 3, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 13, 3, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 14, 12, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 15, 18, 1, 120.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 16, 25, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 17, 6, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 18, 14, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 19, 19, 1, 140.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 20, 14, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 21, 26, 1, 250.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 22, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 23, 21, 1, 150.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 24, 13, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 25, 11, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 26, 17, 1, 100.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 27, 11, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 28, 9, 1, 1200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 29, 6, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 30, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 31, 21, 1, 150.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 32, 11, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 33, 15, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 34, 16, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 35, 24, 1, 150.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 36, 5, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 37, 13, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 38, 23, 1, 250.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 39, 19, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 40, 21, 1, 150.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 41, 15, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 42, 8, 1, 600.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 43, 4, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 44, 7, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 45, 12, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 46, 26, 1, 250.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 47, 4, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 48, 22, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 49, 23, 1, 250.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 50, 14, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 51, 11, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 52, 15, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 53, 21, 1, 150.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 54, 3, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 55, 17, 1, 100.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 56, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 57, 25, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 58, 18, 1, 120.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 59, 5, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 60, 19, 1, 140.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 61, 2, 1, 500.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 62, 12, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 63, 3, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 64, 5, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 65, 11, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 66, 22, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 70, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 71, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 72, 2, 1, 500.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 73, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 74, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 1, 7, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 19, 13, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 20, 15, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 22, 23, 1, 250.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 24, 12, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 26, 20, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 27, 23, 1, 250.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 28, 7, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 29, 7, 1, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 30, 2, 1, 500.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 31, 25, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 32, 2, 1, 500.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 33, 14, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 34, 18, 1, 120.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 35, 26, 1, 250.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 71, 7, 2, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 72, 8, 1, 600.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 20, 13, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 24, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 26, 14, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 27, 10, 1, 200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 28, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 30, 20, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 31, 14, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 32, 4, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 34, 9, 1, 1200.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 35, 1, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 71, 14, 2, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 72, 16, 2, 550.0000)
GO
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 20, 20, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 24, 2, 1, 500.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 27, 3, 1, 450.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 28, 2, 1, 500.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 31, 13, 1, 300.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 32, 17, 1, 100.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 72, 5, 2, 400.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (5, 27, 8, 1, 600.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (5, 28, 4, 1, 550.0000)
INSERT [dbo].[DETALLES_FACTURAS] ([detalle_nro], [id_factura], [id_producto], [cantidad], [precio]) VALUES (6, 27, 14, 1, 450.0000)
GO
SET IDENTITY_INSERT [dbo].[FACTURAS] ON 

INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (1, CAST(N'2020-01-22T00:00:00.000' AS DateTime), 3, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 1100.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (2, CAST(N'2020-01-30T00:00:00.000' AS DateTime), 3, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 920.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (3, CAST(N'2020-02-25T00:00:00.000' AS DateTime), 3, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 1250.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (4, CAST(N'2020-02-21T00:00:00.000' AS DateTime), 2, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 1000.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (5, CAST(N'2020-03-18T00:00:00.000' AS DateTime), 2, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 1870.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (6, CAST(N'2020-03-01T00:00:00.000' AS DateTime), 3, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 700.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (7, CAST(N'2020-03-07T00:00:00.000' AS DateTime), 3, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 850.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (8, CAST(N'2020-04-28T00:00:00.000' AS DateTime), 2, 17765514, 2, CAST(0.00 AS Decimal(4, 2)), 2250.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (9, CAST(N'2020-04-06T00:00:00.000' AS DateTime), 3, 24171591, 2, CAST(0.00 AS Decimal(4, 2)), 2950.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (10, CAST(N'2020-04-09T00:00:00.000' AS DateTime), 5, 17765514, 2, CAST(0.00 AS Decimal(4, 2)), 700.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (11, CAST(N'2020-04-26T00:00:00.000' AS DateTime), 6, 24171591, 2, CAST(0.00 AS Decimal(4, 2)), 650.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (12, CAST(N'2020-05-09T00:00:00.000' AS DateTime), 4, 42856135, 1, CAST(0.00 AS Decimal(4, 2)), 440.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (13, CAST(N'2020-05-27T00:00:00.000' AS DateTime), 2, 44789156, 1, CAST(0.00 AS Decimal(4, 2)), 1600.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (14, CAST(N'2020-05-08T00:00:00.000' AS DateTime), 1, 42856135, 1, CAST(0.00 AS Decimal(4, 2)), 250.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (15, CAST(N'2020-06-29T00:00:00.000' AS DateTime), 3, 24171591, 1, CAST(0.00 AS Decimal(4, 2)), 650.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (16, CAST(N'2020-06-12T00:00:00.000' AS DateTime), 4, 44789156, 2, CAST(0.00 AS Decimal(4, 2)), 150.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (17, CAST(N'2020-06-24T00:00:00.000' AS DateTime), 5, 42856135, 1, CAST(0.00 AS Decimal(4, 2)), 1400.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (18, CAST(N'2020-07-05T00:00:00.000' AS DateTime), 2, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (19, CAST(N'2020-07-13T00:00:00.000' AS DateTime), 6, 17765514, 2, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (20, CAST(N'2020-07-04T00:00:00.000' AS DateTime), 2, 24171591, 2, CAST(0.00 AS Decimal(4, 2)), 120.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (21, CAST(N'2020-07-15T00:00:00.000' AS DateTime), 5, 24171591, 1, CAST(0.00 AS Decimal(4, 2)), 200.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (22, CAST(N'2020-08-27T00:00:00.000' AS DateTime), 2, 16354209, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (23, CAST(N'2020-08-21T00:00:00.000' AS DateTime), 3, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 450.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (24, CAST(N'2020-01-21T00:00:00.000' AS DateTime), 2, 17765514, 2, CAST(0.00 AS Decimal(4, 2)), 650.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (25, CAST(N'2020-08-25T00:00:00.000' AS DateTime), 3, 16354209, 2, CAST(0.00 AS Decimal(4, 2)), 400.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (26, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 6, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 100.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (27, CAST(N'2020-10-11T00:00:00.000' AS DateTime), 5, 16354209, 2, CAST(0.00 AS Decimal(4, 2)), 200.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (28, CAST(N'2020-10-17T00:00:00.000' AS DateTime), 4, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 1200.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (29, CAST(N'2020-10-21T00:00:00.000' AS DateTime), 2, 24171591, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (30, CAST(N'2020-10-28T00:00:00.000' AS DateTime), 1, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 500.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (31, CAST(N'2020-11-20T00:00:00.000' AS DateTime), 3, 24171591, 1, CAST(0.00 AS Decimal(4, 2)), 150.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (32, CAST(N'2020-11-18T00:00:00.000' AS DateTime), 6, 44789156, 1, CAST(0.00 AS Decimal(4, 2)), 200.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (33, CAST(N'2020-11-19T00:00:00.000' AS DateTime), 6, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 450.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (34, CAST(N'2020-11-02T00:00:00.000' AS DateTime), 3, 44789156, 1, CAST(0.00 AS Decimal(4, 2)), 450.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (35, CAST(N'2020-12-10T00:00:00.000' AS DateTime), 3, 44789156, 2, CAST(0.00 AS Decimal(4, 2)), 400.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (36, CAST(N'2020-12-14T00:00:00.000' AS DateTime), 5, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (37, CAST(N'2020-12-25T00:00:00.000' AS DateTime), 4, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 250.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (38, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 2, 44789156, 2, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (39, CAST(N'2021-01-31T00:00:00.000' AS DateTime), 1, 27178533, 2, CAST(0.00 AS Decimal(4, 2)), 150.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (40, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 3, 44789156, 1, CAST(0.00 AS Decimal(4, 2)), 550.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (41, CAST(N'2021-01-12T00:00:00.000' AS DateTime), 3, 42856135, 1, CAST(0.00 AS Decimal(4, 2)), 600.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (42, CAST(N'2021-02-07T00:00:00.000' AS DateTime), 2, 27178533, 2, CAST(0.00 AS Decimal(4, 2)), 550.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (43, CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 400.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (44, CAST(N'2021-02-15T00:00:00.000' AS DateTime), 3, 27178533, 2, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (45, CAST(N'2021-03-08T00:00:00.000' AS DateTime), 5, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 120.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (46, CAST(N'2021-03-03T00:00:00.000' AS DateTime), 6, 27178533, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (47, CAST(N'2021-03-21T00:00:00.000' AS DateTime), 4, 16354209, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (48, CAST(N'2021-04-14T00:00:00.000' AS DateTime), 2, 16354209, 1, CAST(0.00 AS Decimal(4, 2)), 250.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (49, CAST(N'2021-04-10T00:00:00.000' AS DateTime), 1, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 550.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (50, CAST(N'2021-04-05T00:00:00.000' AS DateTime), 4, 42856135, 1, CAST(0.00 AS Decimal(4, 2)), 200.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (51, CAST(N'2021-05-22T00:00:00.000' AS DateTime), 5, 24171591, 2, CAST(0.00 AS Decimal(4, 2)), 250.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (52, CAST(N'2021-05-16T00:00:00.000' AS DateTime), 3, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 450.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (53, CAST(N'2021-05-02T00:00:00.000' AS DateTime), 4, 24171591, 2, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (54, CAST(N'2021-05-07T00:00:00.000' AS DateTime), 5, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 550.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (55, CAST(N'2021-06-15T00:00:00.000' AS DateTime), 2, 44789156, 2, CAST(0.00 AS Decimal(4, 2)), 150.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (56, CAST(N'2021-06-14T00:00:00.000' AS DateTime), 2, 17765514, 2, CAST(0.00 AS Decimal(4, 2)), 450.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (57, CAST(N'2021-06-11T00:00:00.000' AS DateTime), 2, 44789156, 2, CAST(0.00 AS Decimal(4, 2)), 100.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (58, CAST(N'2021-06-12T00:00:00.000' AS DateTime), 3, 42856135, 2, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (59, CAST(N'2021-07-16T00:00:00.000' AS DateTime), 3, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 200.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (60, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 6, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 120.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (61, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 4, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 400.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (62, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 3, 34789511, 2, CAST(0.00 AS Decimal(4, 2)), 140.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (63, CAST(N'2021-08-22T00:00:00.000' AS DateTime), 2, 16354209, 2, CAST(0.00 AS Decimal(4, 2)), 500.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (64, CAST(N'2021-08-30T00:00:00.000' AS DateTime), 1, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (65, CAST(N'2021-08-30T00:00:00.000' AS DateTime), 1, 17765514, 1, CAST(0.00 AS Decimal(4, 2)), 450.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (66, CAST(N'2021-08-30T00:00:00.000' AS DateTime), 2, 34789511, 1, CAST(0.00 AS Decimal(4, 2)), 400.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (67, CAST(N'2021-09-20T00:00:00.000' AS DateTime), 3, 44789156, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (68, CAST(N'2021-09-04T00:00:00.000' AS DateTime), 4, 24171591, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (69, CAST(N'2021-09-03T00:00:00.000' AS DateTime), 5, 44789156, 2, CAST(0.00 AS Decimal(4, 2)), 200.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (70, CAST(N'2021-10-30T22:53:08.760' AS DateTime), 1, 16354209, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (71, CAST(N'2021-10-30T22:54:25.007' AS DateTime), 1, 24171591, 2, CAST(10.00 AS Decimal(4, 2)), 1800.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (72, CAST(N'2021-10-31T09:04:34.897' AS DateTime), 1, 24171591, 2, CAST(25.00 AS Decimal(4, 2)), 2250.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (73, CAST(N'2021-10-31T09:33:38.920' AS DateTime), 1, 24171591, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
INSERT [dbo].[FACTURAS] ([id_factura], [fecha], [id_vendedor], [DNI], [id_forma], [descuento], [total]) VALUES (74, CAST(N'2021-10-31T12:12:05.207' AS DateTime), 1, 24171591, 1, CAST(0.00 AS Decimal(4, 2)), 300.0000)
SET IDENTITY_INSERT [dbo].[FACTURAS] OFF
GO
INSERT [dbo].[FORMAS_PAGO] ([id_forma], [descripcion]) VALUES (1, N'Efectivo')
INSERT [dbo].[FORMAS_PAGO] ([id_forma], [descripcion]) VALUES (2, N'Debito')
GO
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (1, N'BoorChesse Carne', 300.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (2, N'BoorChesse Ternera', 500.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (3, N'BoorVeg Lenteja', 450.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (4, N'BoorVeg Garbanso', 550.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (5, N'BoorVeg Choclo', 400.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (6, N'BoorChesse Pollo', 300.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (7, N'BoorPapas Fritas', 400.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (8, N'BoorPanceta', 600.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (9, N'Combo BoorChesse Carne, Papas, Coca', 1200.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (10, N'BoorAgua', 200.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (11, N'BoorCola', 300.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (12, N'BoorFanta', 300.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (13, N'BoorAguaTonica', 300.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (14, N'Hamburguesa Kids', 450.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (15, N'Hamburguesa Matambre', 550.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (16, N'Hamburguesa Vacio', 550.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (17, N'Ensalada 1', 100.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (18, N'Ensalada 2', 120.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (19, N'Ensalada 3', 140.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (20, N'Jujetito', 300.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (21, N'Papas Fritas Chicas', 150.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (22, N'Papas Fritas Medianas', 200.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (23, N'Papas Fritas Medianas', 250.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (24, N'Gaseosa Chica', 150.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (25, N'Gaseosa Mediana', 200.0000)
INSERT [dbo].[PRODUCTOS] ([id_producto], [nom_producto], [precio]) VALUES (26, N'Gaseosa Grande', 250.0000)
GO
SET IDENTITY_INSERT [dbo].[VENDEDORES] ON 

INSERT [dbo].[VENDEDORES] ([id_vendedor], [nombre], [apellido], [nom_usuario], [pwd]) VALUES (1, N'Miguel', N'Caceres', N'mdc', N'123456')
INSERT [dbo].[VENDEDORES] ([id_vendedor], [nombre], [apellido], [nom_usuario], [pwd]) VALUES (2, N'ivon', N'abr', N'ivo', N'123')
INSERT [dbo].[VENDEDORES] ([id_vendedor], [nombre], [apellido], [nom_usuario], [pwd]) VALUES (3, N'vic', N'velazquez', N'tumami', N'tumama')
INSERT [dbo].[VENDEDORES] ([id_vendedor], [nombre], [apellido], [nom_usuario], [pwd]) VALUES (4, N'Rodrigo', N'Leal', N'Rodrigonew', N'1234')
INSERT [dbo].[VENDEDORES] ([id_vendedor], [nombre], [apellido], [nom_usuario], [pwd]) VALUES (5, N'Gonzalo', N'Juarez', N'Gonza01', N'1234')
INSERT [dbo].[VENDEDORES] ([id_vendedor], [nombre], [apellido], [nom_usuario], [pwd]) VALUES (6, N'Francisco', N'Valenzuela', N'FranSinatra', N'1234')
SET IDENTITY_INSERT [dbo].[VENDEDORES] OFF
GO
/****** Object:  StoredProcedure [dbo].[Facturacion]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Facturacion]
@fecha1 datetime,
@fecha2 datetime
as
select MONTH(f.fecha)'mes', sum(cantidad*precio)'total',
sum(cantidad*precio)/count(distinct f.id_factura) 'promedio por factura'
from facturas f join detalles_facturas d 
on f.id_factura=d.id_factura
where fecha between @fecha1 and @fecha2
group by MONTH(f.fecha)
order by 1
GO
/****** Object:  StoredProcedure [dbo].[facturacion2]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[facturacion2]
@fecha1 datetime,
@fecha2 datetime
as
declare @total  decimal(10,2)
set @total= (select sum(cantidad*precio) from DETALLES_FACTURAS)

declare @cantFact int
set @cantFact= (select COUNT(id_factura) from facturas)

declare @promedio decimal(10,2)
set @promedio= @total/@cantFact


select YEAR(f.fecha)'año', sum(cantidad*precio)'total',
@promedio 'promedio por factura'
from facturas f join detalles_facturas d 
on f.id_factura=d.id_factura
where fecha between @fecha1 and @fecha2
group by  YEAR(f.fecha)
order by 1
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_BARRIOS]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR TODOS LOS BARRIOS
create procedure [dbo].[SP_CONSULTAR_BARRIOS]
AS
BEGIN
SELECT * FROM BARRIOS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_CLIENTES]
AS
BEGIN
	
	SELECT DNI,nom_cliente+ape_cliente 'cliente',tel_cliente 'telefono',direccion 'direccion'  from CLIENTES 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES_POR_DNI]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR CLIENTES POR DNI
create PROCEDURE [dbo].[SP_CONSULTAR_CLIENTES_POR_DNI]
@DNI bigint
AS
BEGIN
	SELECT DNI,nom_cliente+ape_cliente 'cliente',tel_cliente 'telefono',direccion 'direccion'  from CLIENTES 
	where DNI=@DNI
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES_POR_DNI2]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_CLIENTES_POR_DNI2]
@DNI bigint
AS
BEGIN
	SELECT DNI,nom_cliente'nombre',ape_cliente 'apellido',tel_cliente 'telefono',direccion 'direccion', id_barrio 'barrio' from CLIENTES 
	where DNI=@DNI
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_DETALLES_POR_ID]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CONSULTAR_DETALLES_POR_ID]
@id_factura int
as
begin
select cantidad 'cantidad',p.nom_producto'nombre',p.precio 'precio' from DETALLES_FACTURAS df 
join PRODUCTOS p on df.id_producto=p.id_producto
where id_factura=@id_factura
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FACTURAS]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR TODAS LAS FACTURAS
CREATE PROCEDURE [dbo].[SP_CONSULTAR_FACTURAS]
AS
BEGIn
	select distinct  f.id_factura 'nro_factura',c.nom_cliente+c.ape_cliente 'cliente' ,f.fecha 'fecha' ,total 'total'
	from FACTURAS f join CLIENTES c on f.DNI=c.DNI
	join DETALLES_FACTURAS df on df.id_factura=f.id_factura
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FORMAS_PAGO]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR FORMAS DE PAGO
create PROCEDURE [dbo].[SP_CONSULTAR_FORMAS_PAGO]
AS
BEGIN
SELECT * FROM FORMAS_PAGO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PRODUCTOS]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_PRODUCTOS]
AS
BEGIN
	
	SELECT id_producto 'id', nom_producto'nombre', precio 'precio' from PRODUCTOS;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PRODUCTOS_POR_NOMBRE]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CONSULTAR_PRODUCTOS_POR_NOMBRE]
@nombre nvarchar(30)
as
begin
	SELECT id_producto 'id', nom_producto 'nombre', precio 'precio' from PRODUCTOS
	where nom_producto = @nombre
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_VENDEDORES]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR TODOS LOS VENDEDORES
create PROCEDURE [dbo].[SP_CONSULTAR_VENDEDORES]
AS
BEGIN
	SELECT * from VENDEDORES;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_VENDEDORES_POR_ID]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CONSULTAR_VENDEDORES_POR_ID]
@id int
AS 
BEGIN 
    select * from Vendedores where id_vendedor = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FACTURA_POR_FECHA]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_FACTURA_POR_FECHA]
@fechaDesde datetime,
@fechaHasta datetime
as
begin
select f.id_factura 'nro_factura',c.nom_cliente+c.ape_cliente 'cliente' ,f.fecha 'fecha' ,df.cantidad*df.precio 'total'
from FACTURAS f join CLIENTES c on f.DNI=c.DNI
join DETALLES_FACTURAS df on df.id_factura=f.id_factura
where f.fecha between @fechaDesde and @fechaHasta
end
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_CLIENTE]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR CLIENTE
create procedure [dbo].[SP_INSERTAR_CLIENTE]
@DNI bigint,
@tel_cliente bigint,
@nom_cliente nvarchar(20),
@ape_cliente nvarchar(20),
@id_barrio int,
@direccion nvarchar
as
begin
insert into CLIENTES(DNI,tel_cliente,nom_cliente,ape_cliente,id_barrio,direccion)
values (@DNI,@tel_cliente,@nom_cliente,@ape_cliente,@id_barrio,@direccion)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR DETALLE
CREATE PROCEDURE [dbo].[SP_INSERTAR_DETALLE] 
	@id_factura int,
	@detalle_nro int, 
	@id_producto int, 
	@cantidad int,
    @precio money
AS
BEGIN
	INSERT INTO DETALLES_FACTURAS(id_factura,detalle_nro, id_producto, cantidad, precio)
    VALUES (@id_factura, @detalle_nro, @id_producto, @cantidad, @precio);
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_MAESTRO]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR MAESTRO
CREATE PROCEDURE [dbo].[SP_INSERTAR_MAESTRO] 
	@id_vendedor int,
	@DNI bigint,
	@id_forma int,
	@descuento decimal(8,2),
    @total money,
    @id_Factura int output
AS
BEGIN
	INSERT INTO FACTURAS(fecha, id_vendedor, DNI,id_forma,descuento,total)
    VALUES (GETDATE(), @id_vendedor, @DNI, @id_forma,@descuento,@total);	
    set @id_Factura = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_VENDEDOR]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--REGISTRAR VENDEDOR
create PROCEDURE [dbo].[SP_INSERTAR_VENDEDOR]
@nombre nvarchar(20),
@apellido nvarchar(20),
@nom_usuario nvarchar(20),
@pwd nvarchar(20)
AS
BEGIN
INSERT INTO VENDEDORES(nombre,apellido,nom_usuario,pwd)
values (@nombre,@apellido,@nom_usuario,@pwd)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_productos]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_productos]
as 
begin 
select * from productos
end
GO
/****** Object:  StoredProcedure [dbo].[SP_PROXIMA_FACTURA]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_PROXIMA_FACTURA]
@next int OUTPUT
AS
BEGIN
	SET @next = (SELECT MAX(id_factura)+1  FROM FACTURAS);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VENDEDOR_ID]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR VENDEDOR POR ID
create procedure [dbo].[SP_VENDEDOR_ID]
@id int
as
begin
select id_vendedor,nombre from VENDEDORES
where id_vendedor=@id
end
--CONSULTAR FACTURAS POR RANGO DE FECHA

GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICAR_LOGIN]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_VERIFICAR_LOGIN]
@usuario nvarchar(20),
@contraseña nvarchar(20), 
@idVendedor int OUTPUT
as
begin
Select nom_usuario, pwd from VENDEDORES 
where nom_usuario=@usuario and pwd=@contraseña
set @idVendedor = (select max(id_vendedor) from VENDEDORES where nom_usuario=@usuario and pwd=@contraseña)
end
GO
/****** Object:  StoredProcedure [dbo].[vendedores_facturacion]    Script Date: 11/2/2021 1:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[vendedores_facturacion]
as
select f.id_vendedor, apellido 'vendedor',COUNT(distinct f.id_factura)'cant_ventas',
SUM (cantidad*precio )'total'
from facturas f join DETALLES_FACTURAS d 
on f.id_factura=d.id_factura
join vendedores v on v.id_vendedor=f.id_vendedor
group by f.id_vendedor, apellido
GO
USE [master]
GO
ALTER DATABASE [db_boorgir] SET  READ_WRITE 
GO
