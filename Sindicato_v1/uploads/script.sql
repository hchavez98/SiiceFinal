USE [master]
GO
/****** Object:  Database [SII_DB]    Script Date: 12/10/2019 1:46:54 PM ******/
CREATE DATABASE [SII_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SIICE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SIICE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SIICE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SIICE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SII_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SII_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SII_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SII_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SII_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SII_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SII_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SII_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SII_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SII_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SII_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SII_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SII_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SII_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SII_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SII_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SII_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SII_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SII_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SII_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SII_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SII_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SII_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SII_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SII_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [SII_DB] SET  MULTI_USER 
GO
ALTER DATABASE [SII_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SII_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SII_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SII_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SII_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SII_DB', N'ON'
GO
ALTER DATABASE [SII_DB] SET QUERY_STORE = OFF
GO
USE [SII_DB]
GO
/****** Object:  Table [dbo].[Tbl_Acta]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Acta](
	[id_Acta] [int] IDENTITY(1,1) NOT NULL,
	[tipo_Acta] [varchar](50) NOT NULL,
	[fecha_Cre] [date] NOT NULL,
	[ubicacion] [varchar](300) NOT NULL,
 CONSTRAINT [t_acta_pk] PRIMARY KEY CLUSTERED 
(
	[id_Acta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Acta_Usuario]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Acta_Usuario](
	[id_A_U] [int] IDENTITY(1,1) NOT NULL,
	[id_Acta] [int] NOT NULL,
	[id_Usuario] [int] NOT NULL,
 CONSTRAINT [t_ac_usu_pk] PRIMARY KEY CLUSTERED 
(
	[id_A_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Agremiado]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Agremiado](
	[id_Agremiado] [int] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[profesion] [varchar](150) NOT NULL,
	[colegio_Profesional] [varchar](150) NOT NULL,
	[puesto] [varchar](50) NOT NULL,
	[afiliado] [int] NOT NULL,
	[grado_Academico] [varchar](50) NOT NULL,
	[id_LugarTrabajo] [int] NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_agremiado1_pk] PRIMARY KEY CLUSTERED 
(
	[id_Agremiado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Bit_Ingreso]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Bit_Ingreso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [bigint] NULL,
	[hora] [datetime] NULL,
	[rol] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Compania]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Compania](
	[id_Compania] [int] IDENTITY(1,1) NOT NULL,
	[razon_Social] [varchar](100) NOT NULL,
	[cedula_Juridica] [int] NOT NULL,
	[nom_Compania] [varchar](100) NOT NULL,
	[direccion] [varchar](200) NOT NULL,
	[telefono] [int] NOT NULL,
	[correo_Electronico] [varchar](80) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_compania_pk] PRIMARY KEY CLUSTERED 
(
	[id_Compania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Deduccion]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Deduccion](
	[id_Deduccion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_Deduccion] [date] NOT NULL,
	[monto] [decimal](18, 0) NOT NULL,
	[id_Agremiado] [int] NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_deduccion_pk] PRIMARY KEY CLUSTERED 
(
	[id_Deduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Departamento]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Departamento](
	[id_Departamento] [int] IDENTITY(1,1) NOT NULL,
	[departamento] [varchar](80) NOT NULL,
	[id_Compania] [int] NOT NULL,
	[ubicacion] [varchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_departamento_pk] PRIMARY KEY CLUSTERED 
(
	[id_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Empleado]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Empleado](
	[id_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[cargo] [varchar](80) NOT NULL,
	[superior_Inmediato] [varchar](100) NOT NULL,
	[id_LugarTrabajo] [int] NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[total_Vacaciones] [int] NULL,
	[cant_AusenciasJustificadas] [int] NULL,
	[cant_AusenciasInjustificadas] [int] NULL,
	[vac_Utilizadas] [int] NULL,
	[vac_Restantes] [int] NULL,
 CONSTRAINT [t_empleado_pk] PRIMARY KEY CLUSTERED 
(
	[id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EstadoCivil]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_EstadoCivil](
	[id_ECivil] [int] IDENTITY(1,1) NOT NULL,
	[estado_Civil] [varchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_ecivil_pk] PRIMARY KEY CLUSTERED 
(
	[id_ECivil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Gestion]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Gestion](
	[id_Gestion] [int] IDENTITY(1,1) NOT NULL,
	[motivo] [varchar](150) NULL,
	[fecha_Inicio] [date] NULL,
	[fecha_Fin] [date] NULL,
	[id_Empleado] [int] NOT NULL,
	[id_TipoGestion] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[fecha_Ausencia] [date] NULL,
 CONSTRAINT [t_gestion_pk] PRIMARY KEY CLUSTERED 
(
	[id_Gestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Pais]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Pais](
	[id_Pais] [int] IDENTITY(1,1) NOT NULL,
	[country_code] [varchar](2) NOT NULL,
	[country_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Persona]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Persona](
	[id_Persona] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [bigint] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[primer_Apellido] [varchar](50) NOT NULL,
	[segundo_Apellido] [varchar](50) NOT NULL,
	[genero] [varchar](50) NOT NULL,
	[nacionalidad] [int] NOT NULL,
	[id_ECivil] [int] NOT NULL,
	[fecha_Nac] [date] NOT NULL,
	[fecha_Reg] [date] NOT NULL,
	[telefono] [int] NOT NULL,
	[direccion] [varchar](200) NOT NULL,
	[correo_Electronico] [varchar](100) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_Persona_pk] PRIMARY KEY CLUSTERED 
(
	[id_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Rol]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Rol](
	[id_Rol] [int] IDENTITY(1,1) NOT NULL,
	[tipo_Rol] [varchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_rol_pk] PRIMARY KEY CLUSTERED 
(
	[id_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_TipoGestion]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_TipoGestion](
	[id_TipoGestion] [int] IDENTITY(1,1) NOT NULL,
	[tipo_Gestion] [varchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_tgestion_pk] PRIMARY KEY CLUSTERED 
(
	[id_TipoGestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_TipoUsuario]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_TipoUsuario](
	[id_TipoUsu] [int] IDENTITY(1,1) NOT NULL,
	[tipo_Usuario] [varchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [t_usuario_pk] PRIMARY KEY CLUSTERED 
(
	[id_TipoUsu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Usuario]    Script Date: 12/10/2019 1:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Usuario](
	[id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_Persona] [int] NOT NULL,
	[contrasenia] [varchar](1000) NULL,
	[id_Rol] [int] NOT NULL,
	[id_TipoUsu] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[token_recovery] [varchar](200) NULL,
 CONSTRAINT [t_usuario3_pk] PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Pais] ADD  DEFAULT ('') FOR [country_code]
GO
ALTER TABLE [dbo].[Tbl_Pais] ADD  DEFAULT ('') FOR [country_name]
GO
ALTER TABLE [dbo].[Tbl_Acta_Usuario]  WITH CHECK ADD  CONSTRAINT [t_acta0_fk] FOREIGN KEY([id_Acta])
REFERENCES [dbo].[Tbl_Acta] ([id_Acta])
GO
ALTER TABLE [dbo].[Tbl_Acta_Usuario] CHECK CONSTRAINT [t_acta0_fk]
GO
ALTER TABLE [dbo].[Tbl_Acta_Usuario]  WITH CHECK ADD  CONSTRAINT [t_usuario2_fk] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Tbl_Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Acta_Usuario] CHECK CONSTRAINT [t_usuario2_fk]
GO
ALTER TABLE [dbo].[Tbl_Agremiado]  WITH CHECK ADD  CONSTRAINT [t_ltrabajo0_fk] FOREIGN KEY([id_LugarTrabajo])
REFERENCES [dbo].[Tbl_Departamento] ([id_Departamento])
GO
ALTER TABLE [dbo].[Tbl_Agremiado] CHECK CONSTRAINT [t_ltrabajo0_fk]
GO
ALTER TABLE [dbo].[Tbl_Agremiado]  WITH CHECK ADD  CONSTRAINT [t_usuario0_fk] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Tbl_Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Agremiado] CHECK CONSTRAINT [t_usuario0_fk]
GO
ALTER TABLE [dbo].[Tbl_Deduccion]  WITH CHECK ADD  CONSTRAINT [t_agremiado0_fk] FOREIGN KEY([id_Agremiado])
REFERENCES [dbo].[Tbl_Agremiado] ([id_Agremiado])
GO
ALTER TABLE [dbo].[Tbl_Deduccion] CHECK CONSTRAINT [t_agremiado0_fk]
GO
ALTER TABLE [dbo].[Tbl_Departamento]  WITH CHECK ADD  CONSTRAINT [t_compania_fk] FOREIGN KEY([id_Compania])
REFERENCES [dbo].[Tbl_Compania] ([id_Compania])
GO
ALTER TABLE [dbo].[Tbl_Departamento] CHECK CONSTRAINT [t_compania_fk]
GO
ALTER TABLE [dbo].[Tbl_Empleado]  WITH CHECK ADD  CONSTRAINT [t_ltrabajo1_fk] FOREIGN KEY([id_LugarTrabajo])
REFERENCES [dbo].[Tbl_Departamento] ([id_Departamento])
GO
ALTER TABLE [dbo].[Tbl_Empleado] CHECK CONSTRAINT [t_ltrabajo1_fk]
GO
ALTER TABLE [dbo].[Tbl_Empleado]  WITH CHECK ADD  CONSTRAINT [t_usuario1_fk] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Tbl_Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Empleado] CHECK CONSTRAINT [t_usuario1_fk]
GO
ALTER TABLE [dbo].[Tbl_Gestion]  WITH CHECK ADD  CONSTRAINT [t_empleado_fk] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[Tbl_Empleado] ([id_Empleado])
GO
ALTER TABLE [dbo].[Tbl_Gestion] CHECK CONSTRAINT [t_empleado_fk]
GO
ALTER TABLE [dbo].[Tbl_Gestion]  WITH CHECK ADD  CONSTRAINT [t_tgestion_fk] FOREIGN KEY([id_TipoGestion])
REFERENCES [dbo].[Tbl_TipoGestion] ([id_TipoGestion])
GO
ALTER TABLE [dbo].[Tbl_Gestion] CHECK CONSTRAINT [t_tgestion_fk]
GO
ALTER TABLE [dbo].[Tbl_Persona]  WITH CHECK ADD  CONSTRAINT [t_ecivil_fk] FOREIGN KEY([id_ECivil])
REFERENCES [dbo].[Tbl_EstadoCivil] ([id_ECivil])
GO
ALTER TABLE [dbo].[Tbl_Persona] CHECK CONSTRAINT [t_ecivil_fk]
GO
ALTER TABLE [dbo].[Tbl_Usuario]  WITH CHECK ADD  CONSTRAINT [t_persona_fk] FOREIGN KEY([id_Persona])
REFERENCES [dbo].[Tbl_Persona] ([id_Persona])
GO
ALTER TABLE [dbo].[Tbl_Usuario] CHECK CONSTRAINT [t_persona_fk]
GO
ALTER TABLE [dbo].[Tbl_Usuario]  WITH CHECK ADD  CONSTRAINT [t_rol_fk] FOREIGN KEY([id_Rol])
REFERENCES [dbo].[Tbl_Rol] ([id_Rol])
GO
ALTER TABLE [dbo].[Tbl_Usuario] CHECK CONSTRAINT [t_rol_fk]
GO
ALTER TABLE [dbo].[Tbl_Usuario]  WITH CHECK ADD  CONSTRAINT [t_tipousu_fk] FOREIGN KEY([id_TipoUsu])
REFERENCES [dbo].[Tbl_TipoUsuario] ([id_TipoUsu])
GO
ALTER TABLE [dbo].[Tbl_Usuario] CHECK CONSTRAINT [t_tipousu_fk]
GO
USE [master]
GO
ALTER DATABASE [SII_DB] SET  READ_WRITE 
GO
