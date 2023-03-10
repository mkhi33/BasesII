USE [master]
GO
/****** Object:  Database [DW_Hotel]    Script Date: 11/4/2021 11:50:16 ******/
CREATE DATABASE [DW_Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DW_Hotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DW_Hotel.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DW_Hotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DW_Hotel_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DW_Hotel] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DW_Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DW_Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DW_Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DW_Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DW_Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DW_Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [DW_Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DW_Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DW_Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DW_Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DW_Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DW_Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DW_Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DW_Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DW_Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DW_Hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DW_Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DW_Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DW_Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DW_Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DW_Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DW_Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DW_Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DW_Hotel] SET RECOVERY FULL 
GO
ALTER DATABASE [DW_Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [DW_Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DW_Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DW_Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DW_Hotel] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DW_Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DW_Hotel', N'ON'
GO
USE [DW_Hotel]
GO
/****** Object:  Table [dbo].[Dim_Categorias]    Script Date: 11/4/2021 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Categorias](
	[codigo] [numeric](18, 0) NOT NULL,
	[nombre_categoria] [nvarchar](50) NOT NULL,
	[descripcion_categoria] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Dim_Categorias] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Cliente]    Script Date: 11/4/2021 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Cliente](
	[codigo] [numeric](18, 0) NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
	[nombre_completo] [nvarchar](max) NOT NULL,
	[num_identidad] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Dim_cliente_pais] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Empleados]    Script Date: 11/4/2021 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Empleados](
	[codigo] [numeric](18, 0) NOT NULL,
	[nombre_completo] [nvarchar](max) NOT NULL,
	[num_identidad] [nvarchar](15) NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
	[cod_area_trabajo] [numeric](18, 0) NOT NULL,
	[salario] [numeric](18, 0) NOT NULL,
	[años_empleo] [numeric](18, 0) NOT NULL,
	[nombre_area] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Empleados] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Productos]    Script Date: 11/4/2021 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Productos](
	[codigo] [numeric](18, 0) NOT NULL,
	[nombre_producto] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Productos] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Reservas]    Script Date: 11/4/2021 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Reservas](
	[codigo] [numeric](18, 0) NOT NULL,
	[numero_huespedes] [numeric](18, 0) NOT NULL,
	[nombre_categoria] [nvarchar](50) NOT NULL,
	[nombre_cliente] [nvarchar](max) NULL,
	[num_habitacion] [numeric](18, 0) NOT NULL,
	[cod_habitacion] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Dim_Reservas] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Tiempo]    Script Date: 11/4/2021 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Tiempo](
	[codigo] [date] NOT NULL,
	[año] [numeric](18, 0) NOT NULL,
	[mes] [nvarchar](50) NOT NULL,
	[num_semana] [numeric](18, 0) NOT NULL,
	[num_trimestre] [numeric](18, 0) NOT NULL,
	[num_semestre] [numeric](18, 0) NOT NULL,
	[nombre_dia_semana] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Tiempo] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hechos_ventas]    Script Date: 11/4/2021 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hechos_ventas](
	[codigo] [numeric](18, 0) NOT NULL,
	[id_dim_reserva] [numeric](18, 0) NOT NULL,
	[id_dim_tiempo] [date] NOT NULL,
	[id_dim_categoria] [numeric](18, 0) NOT NULL,
	[id_dim_empleado] [numeric](18, 0) NOT NULL,
	[id_dim_cliente] [numeric](18, 0) NOT NULL,
	[total_venta_reservas] [numeric](18, 2) NOT NULL,
	[total_venta_productos] [numeric](18, 2) NOT NULL,
	[productos_vendidos] [numeric](18, 2) NOT NULL,
	[id_dim_producto] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Hechos] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Hechos_ventas]  WITH CHECK ADD FOREIGN KEY([id_dim_reserva])
REFERENCES [dbo].[Dim_Reservas] ([codigo])
GO
ALTER TABLE [dbo].[Hechos_ventas]  WITH CHECK ADD FOREIGN KEY([id_dim_tiempo])
REFERENCES [dbo].[Dim_Tiempo] ([codigo])
GO
ALTER TABLE [dbo].[Hechos_ventas]  WITH CHECK ADD FOREIGN KEY([id_dim_categoria])
REFERENCES [dbo].[Dim_Categorias] ([codigo])
GO
ALTER TABLE [dbo].[Hechos_ventas]  WITH CHECK ADD FOREIGN KEY([id_dim_empleado])
REFERENCES [dbo].[Dim_Empleados] ([codigo])
GO
ALTER TABLE [dbo].[Hechos_ventas]  WITH CHECK ADD FOREIGN KEY([id_dim_cliente])
REFERENCES [dbo].[Dim_Cliente] ([codigo])
GO
ALTER TABLE [dbo].[Hechos_ventas]  WITH CHECK ADD FOREIGN KEY([id_dim_producto])
REFERENCES [dbo].[Dim_Productos] ([codigo])
GO
USE [master]
GO
ALTER DATABASE [DW_Hotel] SET  READ_WRITE 
GO
