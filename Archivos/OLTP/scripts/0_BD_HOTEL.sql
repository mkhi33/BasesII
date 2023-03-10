USE [master]
GO
/****** Object:  Database [DB_HOTEL]    Script Date: 11/4/2021 17:49:08 ******/
CREATE DATABASE [DB_HOTEL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_HOTEL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_HOTEL.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_HOTEL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_HOTEL_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_HOTEL] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_HOTEL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_HOTEL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_HOTEL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_HOTEL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_HOTEL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_HOTEL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_HOTEL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_HOTEL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_HOTEL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_HOTEL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_HOTEL] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_HOTEL] SET  MULTI_USER 
GO
ALTER DATABASE [DB_HOTEL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_HOTEL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_HOTEL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_HOTEL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_HOTEL] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_HOTEL', N'ON'
GO
USE [DB_HOTEL]
GO
/****** Object:  Table [dbo].[Area_trabajo]    Script Date: 11/4/2021 17:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area_trabajo](
	[cod_area] [numeric](18, 0) NOT NULL,
	[nombre_area] [nvarchar](50) NULL,
	[descripcion_area] [nvarchar](max) NULL,
 CONSTRAINT [PK_Area_trabajo] PRIMARY KEY CLUSTERED 
(
	[cod_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat_habitacion]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_habitacion](
	[cod_categoria] [numeric](18, 0) NOT NULL,
	[nombre_categoria] [nvarchar](50) NOT NULL,
	[descripcion_categoria] [nvarchar](max) NOT NULL,
	[precio_dia] [numeric](18, 2) NOT NULL,
	[capacidad] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_Cat_habitacion] PRIMARY KEY CLUSTERED 
(
	[cod_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[cod_cliente] [numeric](18, 0) NOT NULL,
	[cod_persona] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cuenta_cliente]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta_cliente](
	[cuenta_cliente] [numeric](18, 0) NOT NULL,
	[cod_cliente] [numeric](18, 0) NOT NULL,
	[cod_producto] [numeric](18, 0) NOT NULL,
	[cantidad] [numeric](18, 0) NOT NULL,
	[costo_total] [numeric](18, 2) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cuenta_cliente] PRIMARY KEY CLUSTERED 
(
	[cuenta_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[cod_empleado] [numeric](18, 0) NOT NULL,
	[cod_persona] [numeric](18, 0) NOT NULL,
	[cod_area_trabajo] [numeric](18, 0) NULL,
	[fecha_inicio_laborar] [date] NULL,
	[sueldo] [numeric](18, 2) NULL,
	[fecha_fin_laborar] [date] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[cod_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[cod_habitacion] [numeric](18, 0) NOT NULL,
	[num_habitacion] [numeric](10, 0) NULL,
	[num_piso] [numeric](10, 0) NULL,
	[cod_cat_habitacion] [numeric](18, 0) NULL,
	[disponibilidad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[cod_habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pago_cliente]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago_cliente](
	[cod_pago] [numeric](18, 0) NOT NULL,
	[estado_pago] [nvarchar](50) NULL,
	[total_pago] [numeric](18, 2) NULL,
	[fecha_pago] [datetime] NULL,
 CONSTRAINT [PK_Pago_cliente] PRIMARY KEY CLUSTERED 
(
	[cod_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persona]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[cod_persona] [numeric](18, 0) NOT NULL,
	[num_identidad] [nvarchar](15) NULL,
	[primer_nombre] [nvarchar](50) NOT NULL,
	[segundo_nombre] [nvarchar](50) NULL,
	[primer_apellido] [nvarchar](50) NOT NULL,
	[segundo_apellido] [nvarchar](50) NULL,
	[num_telefono] [nvarchar](15) NULL,
	[correo_electronico] [nvarchar](80) NULL,
	[fecha_nacimiento] [date] NULL,
	[estado_civil] [nvarchar](15) NULL,
	[pais_origen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[cod_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[cod_producto] [numeric](18, 0) NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
	[precio] [numeric](18, 2) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[cod_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 11/4/2021 17:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[cod_reserva] [numeric](18, 0) NOT NULL,
	[cod_cliente] [numeric](18, 0) NOT NULL,
	[cod_empleado] [numeric](18, 0) NOT NULL,
	[num_huespedes] [numeric](18, 0) NOT NULL,
	[fecha_reserva] [datetime] NOT NULL,
	[fecha_ingreso] [datetime] NOT NULL,
	[fecha_egreso] [datetime] NOT NULL,
	[precio_estadia] [numeric](18, 0) NOT NULL,
	[num_tarjeta] [nvarchar](50) NOT NULL,
	[cod_pago] [numeric](18, 0) NOT NULL,
	[estado_reserva] [nvarchar](50) NOT NULL,
	[cod_habitacion] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[cod_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fk_persona_cliente] FOREIGN KEY([cod_persona])
REFERENCES [dbo].[Persona] ([cod_persona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fk_persona_cliente]
GO
ALTER TABLE [dbo].[Cuenta_cliente]  WITH CHECK ADD  CONSTRAINT [FK_cod_cliente] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[Cliente] ([cod_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cuenta_cliente] CHECK CONSTRAINT [FK_cod_cliente]
GO
ALTER TABLE [dbo].[Cuenta_cliente]  WITH CHECK ADD  CONSTRAINT [FK_cod_producto] FOREIGN KEY([cod_producto])
REFERENCES [dbo].[Producto] ([cod_producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cuenta_cliente] CHECK CONSTRAINT [FK_cod_producto]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_area_trabajo] FOREIGN KEY([cod_area_trabajo])
REFERENCES [dbo].[Area_trabajo] ([cod_area])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_area_trabajo]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_cod_persona] FOREIGN KEY([cod_persona])
REFERENCES [dbo].[Persona] ([cod_persona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_cod_persona]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_cat_habitacion] FOREIGN KEY([cod_cat_habitacion])
REFERENCES [dbo].[Cat_habitacion] ([cod_categoria])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_cat_habitacion]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_cliente_reserva] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[Cliente] ([cod_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_cliente_reserva]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_cod_habitacion] FOREIGN KEY([cod_habitacion])
REFERENCES [dbo].[Habitacion] ([cod_habitacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_cod_habitacion]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_codigo_pago] FOREIGN KEY([cod_pago])
REFERENCES [dbo].[Pago_cliente] ([cod_pago])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_codigo_pago]
GO
USE [master]
GO
ALTER DATABASE [DB_HOTEL] SET  READ_WRITE 
GO
