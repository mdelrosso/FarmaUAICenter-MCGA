USE [master]
GO
/****** Object:  Database [FarmaUAICenter]    Script Date: 08/07/2023 10:56:56 ******/
CREATE DATABASE [FarmaUAICenter]
GO
USE [FarmaUAICenter]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[ID_Evento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Bitacora_1] PRIMARY KEY CLUSTERED 
(
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Busquedas]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Busquedas](
	[ID_Consulta] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[Consulta] [nvarchar](50) NULL,
	[Fecha] [datetime] NULL,
	[DVH] [nvarchar](50) NULL,
 CONSTRAINT [PK_Busquedas] PRIMARY KEY CLUSTERED 
(
	[ID_Consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[ID_Factura] [int] NOT NULL,
	[ID_Producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[PrecioUnitario] [float] NULL,
	[DVH] [nvarchar](50) NULL,
 CONSTRAINT [PK_ListaCompra] PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC,
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVV]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVV](
	[DVV] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DVV] PRIMARY KEY CLUSTERED 
(
	[DVV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID_Factura] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[DVH] [nvarchar](50) NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia](
	[ID_Familia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Familia] [nvarchar](50) NOT NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Modulos] PRIMARY KEY CLUSTERED 
(
	[ID_Familia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familia_Patente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia_Patente](
	[ID_Familia] [int] NOT NULL,
	[ID_Patente] [int] NOT NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Familia_Patente] PRIMARY KEY CLUSTERED 
(
	[ID_Familia] ASC,
	[ID_Patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patente](
	[ID_Patente] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Grupo] [nvarchar](50) NOT NULL,
	[Detalle] [nvarchar](50) NOT NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[ID_Patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID_Producto] [int] IDENTITY(1,1) NOT NULL,
	[ID_Proveedor] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Precio] [float] NOT NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Productos_1] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promos](
	[ID_Promo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Producto] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[precio] [float] NOT NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Promos] PRIMARY KEY CLUSTERED 
(
	[ID_Promo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ID_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[ID_Producto] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[DVH] [nvarchar](50) NULL,
 CONSTRAINT [PK_Stock_1] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioFamilia](
	[ID_Usuario] [int] NOT NULL,
	[ID_Familia] [int] NOT NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_UsuarioModulo] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC,
	[ID_Familia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Direccion] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Activo] [bit] NOT NULL,
	[PalabraRestitucion] [nvarchar](50) NULL,
	[DVH] [nvarchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (1, N'Se logueo el usuario: webmaster ID: 8   ', CAST(N'2023-07-08T10:46:42.757' AS DateTime), N'3hHUUiaJ2GHQRe3L1DbFkydfJU0=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (2, N'Se deslogueo el usuario: webmaster ID: 8   ', CAST(N'2023-07-08T10:48:19.537' AS DateTime), N'J1bYOpkRgUmznyMKU9tb1+p6YaI=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (3, N'Se logueo el usuario: admin ID: 4   ', CAST(N'2023-07-08T10:48:28.743' AS DateTime), N'OYR9pypypZvMRf90f/sm2NrIPy4=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (4, N'Se deslogueo el usuario: admin ID: 4   ', CAST(N'2023-07-08T10:48:58.773' AS DateTime), N'EYuPV9xPiSD4nrsXxALiU9zYyuM=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (5, N'Se logueo el usuario: pato ID: 6   ', CAST(N'2023-07-08T10:49:04.307' AS DateTime), N'Dmqsj5Q/OUZTO8HLPuvQfKW/4vc=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (6, N'Se deslogueo el usuario: pato ID: 6   ', CAST(N'2023-07-08T10:50:57.573' AS DateTime), N'iGvbxAEg/HZidASHjj33O2VvX08=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (7, N'Se deslogueo el usuario: lautaro ID: 7   ', CAST(N'2023-07-08T10:51:58.697' AS DateTime), N'+uKeFiQlIXTSiLNiz/EG74uYKGU=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (8, N'Se logueo el usuario: agus ID: 2   ', CAST(N'2023-07-08T10:52:05.413' AS DateTime), N'p5p94cgXkPy+XaiM+URn7cby7Dc=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (9, N'Se deslogueo el usuario: agus ID: 2   ', CAST(N'2023-07-08T10:54:46.727' AS DateTime), N'+JOABkZLMjJ/GDDE+XSWZ1xGS0A=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (10, N'Se deslogueo el usuario: lautaro ID: 7   ', CAST(N'2023-07-08T10:55:01.430' AS DateTime), N'w2eY/hWf8NGhs0ODQMpPE4IVVaE=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (11, N'Se logueo el usuario: nahuel ID: 5   ', CAST(N'2023-07-08T10:55:09.390' AS DateTime), N'EtBE+Mb34GYkvQLjxhlvaZLiDaE=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (12, N'Se deslogueo el usuario: nahuel ID: 5   ', CAST(N'2023-07-08T10:55:10.623' AS DateTime), N'uMC2BeLtJJTuhG2zBGbVXIh2RpU=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (13, N'Se logueo el usuario: ivan ID: 9   ', CAST(N'2023-07-08T10:55:17.260' AS DateTime), N'OXxZ9OhyePQPAJYFOXmq/tLAmUw=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (14, N'Se deslogueo el usuario: ivan ID: 9   ', CAST(N'2023-07-08T10:55:21.260' AS DateTime), N'aGvCKKK59asb5E6j82zPAYHUlZQ=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (15, N'Se logueo el usuario: claudia ID: 1   ', CAST(N'2023-07-08T10:55:27.163' AS DateTime), N'ch6TEM0YKPZbtYUd83uk1B0ve84=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (16, N'Se deslogueo el usuario: claudia ID: 1   ', CAST(N'2023-07-08T10:55:28.560' AS DateTime), N'0d3BXgTcOcidWKV7UaWMVFcsqN8=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (17, N'Se logueo el usuario: omar ID: 3   ', CAST(N'2023-07-08T10:55:31.740' AS DateTime), N'0FHSU1zz58Z9x8J2ErMe5+8nEVw=')
INSERT [dbo].[Bitacora] ([ID_Evento], [Descripcion], [Fecha], [DVH]) VALUES (18, N'Se deslogueo el usuario: omar ID: 3   ', CAST(N'2023-07-08T10:55:33.377' AS DateTime), N'q6vEDME+9L8n1yzvrD7aHIRBZvk=')
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[Busquedas] ON 

INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (1, 1, N'Ibuprofeno', CAST(N'2023-07-06T00:00:00.000' AS DateTime), N'i9C8ql0AfUv6aNix+XIhxbgXR8I=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (2, 2, N'Omeprazol', CAST(N'2023-07-06T16:44:52.000' AS DateTime), N'Oo7Oc+1DIAn/FiK/Vy2bc6SzyGw=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (3, 2, N'Ibuprofeno Forte', CAST(N'2023-07-06T16:46:28.000' AS DateTime), N'PIrhjL602yOiXarA1KVeE+bDo50=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (4, 2, N'Aspirinas', CAST(N'2023-07-06T16:56:29.000' AS DateTime), N'3QQ0RP/vOXVnem983bUa+VT9dME=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (5, 2, N'Amoxicilina', CAST(N'2013-07-11T15:15:33.000' AS DateTime), N'gRiM4EiyR7ENT26zvMJzUoYxnQc=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (6, 2, N'Aspirina', CAST(N'2013-07-11T15:15:41.000' AS DateTime), N'mr8ywP/giQ/jBPaRLJnqwSnhWs0=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (7, 2, N'Loratadina', CAST(N'2013-07-11T15:16:03.000' AS DateTime), N'ekCOGZJYuu7mF0xb6UEipJlYYRQ=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (8, 2, N'Amoxicilina ', CAST(N'2013-07-11T15:16:53.000' AS DateTime), N'hbYOLNv0kYNgCgkOjw8jI1xewUU=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (9, 2, N'Diphenhydramine', CAST(N'2013-07-11T15:17:07.000' AS DateTime), N'FpRV+v6NQKF+FZakw1ZdA5jnx0o=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (10, 2, N'Aspirinas', CAST(N'2013-07-11T15:17:50.000' AS DateTime), N'/XclC7jWzDQfoogQlEJV0jpp7fk=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (11, 2, N'Amoxicilina', CAST(N'2023-07-05T16:07:47.000' AS DateTime), N'qYBf3GAkyg5+Td2DOk7ny/qxJFA=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (12, 2, N'Loratadina', CAST(N'2023-07-05T16:09:28.000' AS DateTime), N'jlb+2Zr2NHm4p2iaIngjQw5LzNE=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (13, 2, N'Ibuprofeno', CAST(N'2023-07-05T16:11:09.000' AS DateTime), N'mdq0HKwdmtTZm4ylNI3p7l3hHWY=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (14, 2, N'Prednisona', CAST(N'2023-07-05T16:26:51.000' AS DateTime), N'K7iYdDFqu9ITn1nFtLKaGFzbaT8=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (15, 2, N'Prednisona', CAST(N'2023-07-05T16:35:25.000' AS DateTime), N'DIXMWV79sCnRY/CF9KNgNQTTc6M=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (16, 2, N'Loratadina', CAST(N'2023-07-05T17:05:14.000' AS DateTime), N'dyQRAJKEKUWDIFynAR2MN+0JkWA=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (17, 9, N'Aspirinas', CAST(N'2023-07-06T11:18:23.000' AS DateTime), N'9N+/1bKiTDqFcoKBzz3JCx/t0Zw=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (18, 9, N'Loratadina', CAST(N'2023-07-06T11:18:27.000' AS DateTime), N'K8lVGH03k23RqQzG16fUakLWdJw=')
INSERT [dbo].[Busquedas] ([ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]) VALUES (19, 9, N'Aspirinas', CAST(N'2023-07-06T11:18:31.000' AS DateTime), N'zUSYPVos2NUy7oXJbTQ2NHSMDPM=')
SET IDENTITY_INSERT [dbo].[Busquedas] OFF
GO
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (1, 10, 2, 20, N'jpj6U2wlJCMCFHVIvjuVF7r7/Hw=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (2, 10, 7, 20, N'CCn63RLynaCDEiAki6MrWGRAkC0=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (3, 3, 2, 20, N'XiBo+A9FiQzsgWa7k+aZBrK3IUI=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (4, 3, 4, 5.5, N'228UjXqQsDSdBErPMK4Mi8NWpA8=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (5, 3, 2, 20, N'qMuYnRbVYQLEnRVlX0JyolMttO0=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (6, 3, 2, 20, N'vbnRN0joVpneDEaSVX4/y6R3pso=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (6, 10, 2, 20, N'ax9+2kICTCkK4lab7sZ+f3A5lVo=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (7, 3, 1, 20, N'fQ2qDLD1HzrrU62aej0BC6n8Rsc=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (7, 10, 1, 20, N'43psKcFiVhvD56QEnVYyPtiqwWI=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (8, 2, 1, 10, N'UeGZ25iZQn/ecpCy+MptCSLPW/I=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (8, 4, 2, 10, N'eg5Hg8exJ8OAW9efBoaQ25xIdRM=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (8, 9, 1, 10, N'sF04VvF2Mb+Wr4IAxj4AgsS1Zpk=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (9, 1, 2, 40, N'rbDOcNRnuefE6qTiiahXcGifcRc=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (9, 6, 2, 40, N'C3JIO+VONL3XatjTWdn73uA/VRE=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (9, 8, 1, 40, N'GUYg83yR3IBDiYVylaSNvBjQqCM=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (10, 4, 1, 0, N'wbYkUs5//aToMG96Z+6NtmE0Of0=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (10, 6, 1, 0, N'M84oL2cw7VRF8fgPU6uarx51jTc=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (10, 8, 1, 0, N'eHIW62E/GjIoMVMzRMMZzfKvAxM=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (10, 9, 2, 0, N'bRQK6ouKvGTV3R5wEY4mjbPtsyw=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (11, 2, 2, 0, N'yrLzrg7Vl4E+3k/MkTtijc7B2gM=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (11, 3, 2, 0, N'o1bu/6Tj2LBTAO74LDoDKRZ0zmM=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (12, 3, 2, 5.5, N'Iv9LS4Ah6WD8GqtuAKXX1kIpitc=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (12, 4, 1, 5.5, N'AvC25zEE50m/bAt9qRX7v4ZLT1k=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (12, 9, 2, 5.5, N'o2cqkvXm66l8w97VW4AU18fuOwY=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (13, 4, 1, 6.5, N'bAB6u+HfR20VXGwj8t3pdvemHMA=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (13, 6, 2, 6.5, N'ZPOK7NnZkyboYGtBch4a90h/Y+M=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (14, 3, 1, 5.5, N'E/PaprhiD41qxo+cfxeuY1I8ODU=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (14, 4, 2, 5.5, N'N9pl1HOADWAB5N02MUkrIJTsR88=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (15, 3, 1, 5.5, N'krjxntVXQQQsf9zHdnX9Ik1MreI=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (15, 4, 1, 5.5, N'c1MAf/0ReMYs8mA8GwDQTYaLS4o=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (16, 1, 1, 9.3, N'oT+ED+hS+qwMtv8Z2cb7wKzTGhU=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (16, 4, 1, 9.3, N'DUZzB6Z8ZMsKnl+o43turDGxjes=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (17, 2, 1, 20, N'LrURVd2SXnNDbrpe3dm9fzgmcAU=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (17, 10, 1, 20, N'ys5775r4D4J23OGDdRPZNiLeJqw=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (19, 2, 2, 20, N'xQ6YpdDCbAnV3GtBDgb6qFW1Pfg=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (19, 10, 2, 20, N'CsdkHLAs2KG4fKEPyZpNwHVZSjA=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (20, 2, 1, 10, N'bcimiaLcL/fAkuLbJrHqO4ajl94=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (20, 10, 2, 20, N'yFH6EOZXtPBih6CLY+h+yqDth6g=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (21, 8, 1, 350, N'Cn/YgIhhQfbzdB8n+PY3ZjBk2Eg=')
INSERT [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]) VALUES (21, 10, 1, 20, N'vuwpSsbYgb0PzWeryzgadvEBrLI=')
GO
INSERT [dbo].[DVV] ([DVV]) VALUES (N'Fm+wMQg4/bQQ4LGDp9hs8ZPaxCs=')
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (1, 2, CAST(N'2023-07-05T20:28:09.220' AS DateTime), N'axyAJFSfmxx6EWBwMC7MFOKCEIU=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (2, 2, CAST(N'2023-07-05T20:29:38.907' AS DateTime), N'OakA2CWrA2eUoRrlllQ3FRqq9k4=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (3, 2, CAST(N'2023-07-05T20:34:38.980' AS DateTime), N'+tQqM/YIYATE73mKhBmPix/KymQ=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (4, 2, CAST(N'2023-07-05T20:36:20.530' AS DateTime), N'hZo4Yhv6nR4YpunaCwp62MU26tk=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (5, 2, CAST(N'2023-07-05T20:38:01.917' AS DateTime), N'5rZYtS6grMdcMUB1R5sPk+u59Vw=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (6, 2, CAST(N'2023-07-05T20:42:57.497' AS DateTime), N'ra+3I/M92rr3uQ8EELqLiQFKTZU=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (7, 2, CAST(N'2023-07-05T21:32:16.247' AS DateTime), N'KVLcMhwhQbaz7ncyOoCWCXjuccQ=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (8, 2, CAST(N'2023-07-06T10:24:37.603' AS DateTime), N'TNa3j8VatnbLKcHskxRde3fGiU8=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (9, 2, CAST(N'2023-07-06T10:27:49.277' AS DateTime), N'bGwRqxAiv39QZkoxe8Kzva3H2RA=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (10, 2, CAST(N'2023-07-06T10:33:25.247' AS DateTime), N'LVzw0XHTXwiQv+2HZSkZvtajGKA=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (11, 2, CAST(N'2023-07-06T10:35:55.737' AS DateTime), N'eItrhGu8DVZf2Ui5gQMbcRnVNPw=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (12, 2, CAST(N'2023-07-06T10:37:28.383' AS DateTime), N'NfBNnJXnyuZpVOVdkyIr/tOn+Do=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (13, 2, CAST(N'2023-07-06T10:39:55.553' AS DateTime), N'8jc/izAEhABQ3L4NpcAvIT5fmoM=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (14, 2, CAST(N'2023-07-06T10:45:41.577' AS DateTime), N'Fo/or7hWRofaK5DkXGmfVI4D9/I=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (15, 2, CAST(N'2023-07-06T10:53:31.017' AS DateTime), N'U4fy4lzGwo+3Oak5DsVBvWTLenQ=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (16, 2, CAST(N'2023-07-06T10:57:43.213' AS DateTime), N'LUnl+IHSTNlYnlvFiT4gZl/gPg4=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (17, 2, CAST(N'2023-07-06T11:02:40.370' AS DateTime), N'smDAzrJLbwWbcDJYhnQUIn/woFo=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (18, 2, CAST(N'2023-07-06T11:07:54.730' AS DateTime), N'rWnFyyRtNp+CqkJzM/CZy/LRx/g=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (19, 2, CAST(N'2023-07-06T11:10:06.193' AS DateTime), N'cRAn+KieH5HgADJXLBvWtB+vBVc=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (20, 2, CAST(N'2023-07-06T11:16:09.577' AS DateTime), N'4eoyhxRyYYzSPQgm1QtOD4a9Ov0=')
INSERT [dbo].[Factura] ([ID_Factura], [ID_Cliente], [Fecha], [DVH]) VALUES (21, 9, CAST(N'2023-07-06T11:17:50.920' AS DateTime), N'ydhDE3gyr7gbm7wt7t/1XwhytyA=')
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Familia] ON 

INSERT [dbo].[Familia] ([ID_Familia], [Nombre_Familia], [DVH]) VALUES (1, N'Cliente', N'Up55jti832yIJ6oJu2VS6IpLBzg=')
INSERT [dbo].[Familia] ([ID_Familia], [Nombre_Familia], [DVH]) VALUES (2, N'Admin', N'VSLFXqdEyH3E3EyerdB75B06BgU=')
INSERT [dbo].[Familia] ([ID_Familia], [Nombre_Familia], [DVH]) VALUES (3, N'WebMaster', N'0wEhe0TuldVjKF7zGH4U9AytFg4=')
SET IDENTITY_INSERT [dbo].[Familia] OFF
GO
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (1, 1, N'gWI40sW2ZO924DkHnkDBSSrc8Ow=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (1, 2, N'ueFdNtrPqXDYkX+KLSWz5WB0tXI=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (1, 3, N'GqF5CuG8FX3XvC6OfRQssiwjRqg=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (1, 4, N'xH5/eu8W94zns9dXVvOKZ3lK9NA=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (2, 5, N'F88FlirBrHfNS1JHzGMRaQ2Nr+U=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (2, 8, N'lKoUpSdj882P+0gMnvXr1SnTnCQ=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (2, 9, N'iB35WD0pbA1besXJs3GsFPiT9LE=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (3, 11, N'rg7TgAaT47kIQue7yjoV1MKJrvY=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (3, 12, N'0/fJdFIyzI27Msso89V5muoB624=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (3, 13, N'ILniIhljJLRxvpb89YInhI5rvCo=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (3, 14, N'1Hy1ZzY13yE+nhuU7kXmRWKcmRg=')
INSERT [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH]) VALUES (3, 20, N'PuK3iE2LqjhnFONBPyKIkJWwWyU=')
GO
SET IDENTITY_INSERT [dbo].[Patente] ON 

INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (1, N'Productos', N'1', N'Solo el Cliente tendra Acceso a Productos', N'y36ddlqSKxA8xbMlfzb12r7I+9o=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (2, N'Promos', N'2', N'Solo el Cliente tendra Acceso a Promos', N'R9sNi0tBHGR7ghvaj56YEx9U4qo=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (3, N'MisBusquedas', N'3', N'Solo el Cliente tendra Acceso a MisBusquedas', N'ccXH5akGtjQmsVUO/q54vV4/Q1g=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (4, N'MisCompras', N'4', N'Solo el Cliente tendra Acceso a MisCompras', N'FYFY2eMY8Ry1JhBV/+vCFOEuvKQ=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (5, N'AdministrarProductos', N'5', N'Solo el Avanzado tendra Acceso a AdminProd', N'Y36Ri1NYDl8pglpTvoBnrgHIr/U=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (8, N'AdministrarPromos', N'6', N'Solo el Avanzado tendra Acceso a AdminProm', N'vKbrtYEXmDa+1VQo/o2w6ROApOo=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (9, N'AdministrarPedidos', N'7', N'Solo el Avanzado tendra Acceso a AdminPed', N'Ki4rqvzgF0Y+OHrJXCW3ikdSSUo=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (11, N'AdministrarUsuarios', N'8', N'Solo el administrador tendra Acceso a AdminUsu', N'piw6sz0/SBY0lTGLHrRdEShhiyg=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (12, N'AdministrarPermisos', N'9', N'Solo el administrador tendra Acceso a AdminPerm', N'6JWhezAw5pWcT4nxgD4I4Yf/WK0=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (13, N'BackupRestore', N'10', N'Solo el administrador tendra Acceso al BackUP-Rest', N'DuuBfhSUKEajkFBOtTizkVwDYGo=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (14, N'Bitacora', N'11', N'Solo el administrador tendra Acceso a la Bitacora', N'2NYN/OxJdGUPI49MBAtEykS+E6E=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (15, N'Institucional', N'12', N'Solo el Visitante tendra Acceso a Institucional', N'5Fo9bDg0RWpc9oRLO2jCm9N1otQ=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (16, N'Productos', N'13', N'Solo el Visitante tendra Acceso a Productos', N'O3jsbWCWdy4eIKirwcsANhoHzMA=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (17, N'Promos', N'14', N'Solo el Visitante tendra Acceso a Promos', N'QPmZa0lJDUc0z2OYHOzXKyVkfik=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (18, N'tiendas', N'15', N'Solo el Visitante tendra Acceso a  Farmacias', N'/nq7JAcX8wykZPwyWt/v8N3WTB0=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (19, N'Contacto', N'16', N'Solo el Visitante tendra Acceso a Contactos', N'ClTMoneWgja7x3caZ57g1qbv1PU=')
INSERT [dbo].[Patente] ([ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]) VALUES (20, N'DigitosVerificadores', N'17', N'Solo el administrador tendra Acceso a los DV', N'7K5OH4m2ji1aitf/BdzsxvduuVM=')
SET IDENTITY_INSERT [dbo].[Patente] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (1, 1, N'Paracetamol 500', N'500 Mg', 1850, N'JXg4LilFtzEv8RRTohr9y58ekHk=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (2, 1, N'Paracetamol 1000', N'1 G', 3200, N'LfbVHITBEqDvbJdo1+pBpS2/3kQ=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (3, 3, N'Ibuprofeno', N'400 Mg', 1900, N'swwAY7ctadaJ7VnpvL35eQ/ygmI=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (4, 1, N'Ibuprofeno Forte', N'600 Mg', 2699, N'mZ4ydmtp90+cRF/f4HxpQia9kRY=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (5, 0, N'Omeprazol 20', N'20 Mg', 3000, N'SEpKFhpwLT6ch/YGN8I0JNXR54s=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (6, 3, N'Amoxicilina Jarabe', N'125mg 5ml', 2500, N'ZwedxRklZ6YdMM/Xs8f6TcW4NYc=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (7, 2, N'Loratadina', N'10 Mg', 1000, N'xMROr3nzJg6f3S4+IXrnKb8SIT8=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (8, 2, N'Aspirina', N'81 Mg', 1200, N'DtHwQml7UAALK+fpJOUg5Nw9BrM=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (9, 3, N'Prednisona', N'20 Mg', 2300, N'qhcW1aoHtQ77Dz6dTgC4N55j/Hc=')
INSERT [dbo].[Productos] ([ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]) VALUES (10, 3, N'Diphenhydramine', N'25Mg 5ml', 1560, N'WkuCCr8fAIgHhFvyGMQnWD4huRc=')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Promos] ON 

INSERT [dbo].[Promos] ([ID_Promo], [Nombre], [Producto], [Descripcion], [precio], [DVH]) VALUES (1, N'Promo 1', N'Ibuprofeno', N'2x', 3000, N'eCThujkMXwOkfOP7MyyEMK3yiHI=')
INSERT [dbo].[Promos] ([ID_Promo], [Nombre], [Producto], [Descripcion], [precio], [DVH]) VALUES (3, N'Promo2', N'Aspirina', N'3x', 4500, N'+h6NTo/MXlQ6eEBJqBKKjB/rWfA=')
SET IDENTITY_INSERT [dbo].[Promos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [Descripcion], [DVH]) VALUES (1, N'Laboratorio Pister', N'Armenia 782', N'43002147', NULL, N'fiUG+54Rxawf+3Kn8N0gOhiPWBg=')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [Descripcion], [DVH]) VALUES (2, N'Laboratorio Yester', N'San Juan 1785', N'49124578', N'Proveedor Interno', N'c5Z7e0HTGDbFfmXKSo267tpO6xM=')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [Descripcion], [DVH]) VALUES (3, N'Laboratorio Abas', N'Ucrania 569', N'45464123', NULL, N'9cmXZGcqeb3iTGiOndM0lryBB+Q=')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (1, 7, N'73/CS1EX3npQMm61S3CvW6wXp3Q=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (2, 8, N'lKoUpSdj882P+0gMnvXr1SnTnCQ=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (3, 10, N'TW6pydHpgOr4Qv5p0sWHtbUGeqw=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (4, 10, N'Oa2mjAr66J93VPi9JiKWkP/JlFs=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (5, 12, N's25RUjGD+S7j/8D2e8XE5BPTLPc=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (6, 10, N'3rr35REA6ieLnIaM/A4GqsWClpo=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (7, 14, N'mXh6+HJh4por/z9mQcV67ILR8Xk=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (8, 50, N'5nBxnOKhIYAJS8BUpMD8OKEsNsg=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (9, 10, N'hF28B+3S6HMqRAwJzFUph+swwyk=')
INSERT [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH]) VALUES (10, 19, N'/0aY5oj5/g9r6DZJ1gA9PcnE+Fw=')
GO
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (0, 1, N'JtxeC/cxV+Sp9A67LF0EWx41ymI=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (1, 3, N'GqF5CuG8FX3XvC6OfRQssiwjRqg=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (2, 1, N'BVYB4HbWWZKz/NgJ3V4iKvuQO+4=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (3, 3, N'uVSRLVthOpu7nldWfAGnja9JaZc=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (4, 2, N'eSvteug42SZ2RPgymqhqMBJguyw=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (5, 1, N'gjrH8TVHu2HuAE7jOfZWgRNI2Us=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (6, 2, N'7RKQQTP/rJeBcYQFG2KVeR6umNs=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (7, 1, N'sx39wAlMpjLOhb2Y3DU7107II7I=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (8, 3, N'22yUihH5S0mkHO4hwHus6DPA6j0=')
INSERT [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH]) VALUES (9, 1, N'8WvrqrTlfH4UPPzpcKoVVm8VH5k=')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (1, N'claudia', N'claudia', N'Claudia', N'Quispe', N'Garay 8956', N'clau@outlook.com', N'5569877', 1, N'a', N'6fKDS/5sH8Etwuox10fP1uP0f3k=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (2, N'agus', N'agus', N'Agustina', N'Vildozo', N'Cordoba 786', N'agus@hotmail.com', N'46358899', 1, N'b', N'YFO1my3qyi412jFMYgZbhcVt53w=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (3, N'omar', N'omar', N'Omar', N'Musmanno', N'Laprida 5644', N'omar20@gmail.com', N'116987448', 1, N'c', N'VyiSKYkogz4rbYELC66tcfiSpJI=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (4, N'admin', N'admin', N'Administrador', N'Sistema', N'Casa Central', N'admin@farmauaicenter.com', N'43221152', 1, N'd', N'tc1ILzjt4+2jTce27CFyAx9Y0GU=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (5, N'nahuel', N'nahuel', N'Nahuel', N'Murias', N'Jujuy 7855', N'nahue@hotmail.com', N'11986488', 1, N'e', N'v4O/ZI/GWkYtnrTFJXMU7JUH/64=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (6, N'pato', N'pato', N'Patricio', N'Graces', N'Alsina 176', N'pato@hotmail.com', N'11698554', 1, N'f', N'xdh9XCAhIuRJjfvMNZPFc5RMciw=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (7, N'lautaro', N'lautaro', N'Lautaro', N'Fariñas', N'Egipto 145', N'lautaro@gmail.com', N'46998855', 1, N'g', N'ZOWVV5arurQG/F23TxtrNbBe6tA=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (8, N'webmaster', N'webmaster', N'Web', N'Master', N'Casa Central', N'webmaster@farmauaicenter.com', N'43221152', 1, N'h', N'207lCL3YHmPdy1tVHm6OFFzj5mg=')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Activo], [PalabraRestitucion], [DVH]) VALUES (9, N'ivan', N'ivan', N'ivan', N'ivan', N'dfsdfsdf', N'fdsfds@fdsfsdf.com', N'4531-1231', 1, N'i', N'mFpAEcJiKJIdqiI3VJfB7uIHxNo=')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Familia_Patente]  WITH CHECK ADD  CONSTRAINT [FK_Familia_Patente_Familia] FOREIGN KEY([ID_Familia])
REFERENCES [dbo].[Familia] ([ID_Familia])
GO
ALTER TABLE [dbo].[Familia_Patente] CHECK CONSTRAINT [FK_Familia_Patente_Familia]
GO
ALTER TABLE [dbo].[Familia_Patente]  WITH CHECK ADD  CONSTRAINT [FK_Familia_Patente_Patente] FOREIGN KEY([ID_Patente])
REFERENCES [dbo].[Patente] ([ID_Patente])
GO
ALTER TABLE [dbo].[Familia_Patente] CHECK CONSTRAINT [FK_Familia_Patente_Patente]
GO
/****** Object:  StoredProcedure [dbo].[sp_AltaBitacora]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaBitacora] 
    @Descripcion nvarchar(50),
    @Fecha datetime,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Bitacora] ([Descripcion], [Fecha], [DVH])
	SELECT @Descripcion, @Fecha, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Evento], [Descripcion], [Fecha], [DVH]
	FROM   [dbo].[Bitacora]
	WHERE  [ID_Evento] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaBusquedas]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaBusquedas] 
    @ID_Usuario int,
    @Consulta nvarchar(50) = NULL,
    @Fecha datetime = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Busquedas] ([ID_Usuario], [Consulta], [Fecha], [DVH])
	SELECT @ID_Usuario, @Consulta, @Fecha, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]
	FROM   [dbo].[Busquedas]
	WHERE  [ID_Consulta] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaDetalle]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaDetalle] 
    @ID_Factura int,
    @ID_Producto int,
    @cantidad int,
    @PrecioUnitario float = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Detalle] ([ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH])
	SELECT @ID_Factura, @ID_Producto, @cantidad, @PrecioUnitario, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]
	FROM   [dbo].[Detalle]
	WHERE  [ID_Factura] = @ID_Factura
	       AND [ID_Producto] = @ID_Producto
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaDVV]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaDVV] 
    @DVV nvarchar(100)
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[DVV] ([DVV])
	SELECT @DVV
	
	-- Begin Return Select <- do not remove
	SELECT [DVV]
	FROM   [dbo].[DVV]
	WHERE  [DVV] = @DVV
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaFactura]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaFactura] 
    @ID_Cliente int,
    @Fecha datetime = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Factura] ([ID_Cliente], [Fecha], [DVH])
	SELECT @ID_Cliente, @Fecha, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Factura], [ID_Cliente], [Fecha], [DVH]
	FROM   [dbo].[Factura]
	WHERE  [ID_Factura] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaFamilia] 
    @Nombre_Familia nvarchar(50),
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Familia] ([Nombre_Familia], [DVH])
	SELECT @Nombre_Familia, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Familia], [Nombre_Familia], [DVH]
	FROM   [dbo].[Familia]
	WHERE  [ID_Familia] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaFamilia_Patente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaFamilia_Patente] 
    @ID_Familia int,
    @ID_Patente int,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Familia_Patente] ([ID_Familia], [ID_Patente], [DVH])
	SELECT @ID_Familia, @ID_Patente, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Familia], [ID_Patente], [DVH]
	FROM   [dbo].[Familia_Patente]
	WHERE  [ID_Familia] = @ID_Familia
	       AND [ID_Patente] = @ID_Patente
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaPatente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaPatente] 
    @Descripcion nvarchar(50),
    @Grupo nvarchar(50),
    @Detalle nvarchar(50),
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Patente] ([Descripcion], [Grupo], [Detalle], [DVH])
	SELECT @Descripcion, @Grupo, @Detalle, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]
	FROM   [dbo].[Patente]
	WHERE  [ID_Patente] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaProductos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaProductos] 
    @ID_Proveedor int,
    @Nombre nvarchar(50),
    @Descripcion nvarchar(50) = NULL,
    @Precio float,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Productos] ([ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH])
	SELECT @ID_Proveedor, @Nombre, @Descripcion, @Precio, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]
	FROM   [dbo].[Productos]
	WHERE  [ID_Producto] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaPromos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaPromos] 
    @Nombre nvarchar(50),
    @Producto nvarchar(50),
    @Descripcion nvarchar(50),
    @precio float,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Promos] ([Nombre], [Producto], [Descripcion], [precio], [DVH])
	SELECT @Nombre, @Producto, @Descripcion, @precio, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Promo], [Nombre], [Producto], [Descripcion], [precio], [DVH]
	FROM   [dbo].[Promos]
	WHERE  [ID_Promo] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaProveedores]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaProveedores] 
    @Nombre varchar(50),
    @Direccion varchar(50),
    @Telefono varchar(50),
    @Descripcion varchar(50) = NULL,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Proveedores] ([Nombre], [Direccion], [Telefono], [Descripcion], [DVH])
	SELECT @Nombre, @Direccion, @Telefono, @Descripcion, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Proveedor], [Nombre], [Direccion], [Telefono], [Descripcion], [DVH]
	FROM   [dbo].[Proveedores]
	WHERE  [ID_Proveedor] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaStock]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaStock] 
    @ID_Producto int,
    @Cantidad int = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Stock] ([ID_Producto], [Cantidad], [DVH])
	SELECT @ID_Producto, @Cantidad, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Producto], [Cantidad], [DVH]
	FROM   [dbo].[Stock]
	WHERE  [ID_Producto] = @ID_Producto
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaUsuarioFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaUsuarioFamilia] 
    @ID_Usuario int,
    @ID_Familia int,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[UsuarioFamilia] ([ID_Usuario], [ID_Familia], [DVH])
	SELECT @ID_Usuario, @ID_Familia, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Usuario], [ID_Familia], [DVH]
	FROM   [dbo].[UsuarioFamilia]
	WHERE  [ID_Usuario] = @ID_Usuario
	       AND [ID_Familia] = @ID_Familia
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_AltaUsuarios]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AltaUsuarios] 
    @Usuario nvarchar(50) = NULL,
    @Password nvarchar(50) = NULL,
    @Nombre nvarchar(50) = NULL,
    @Apellido nvarchar(50) = NULL,
    @Direccion nvarchar(50) = NULL,
    @email nvarchar(50) = NULL,
    @Telefono nvarchar(50) = NULL,
    @Activo bit,
    @PalabraRestitucion nvarchar(50) = NULL,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Usuarios] ([Usuario], [Password], [Nombre], [Apellido], [Direccion], [email], [Telefono], [Activo], [PalabraRestitucion], [DVH])
	SELECT @Usuario, @Password, @Nombre, @Apellido, @Direccion, @email, @Telefono, @Activo, @PalabraRestitucion, @DVH
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [email], [Telefono], [Activo], [PalabraRestitucion], [DVH]
	FROM   [dbo].[Usuarios]
	WHERE  [ID_Usuario] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_Backup]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Backup] 
    @Base nvarchar(1000),
	@Directorio varchar(1000),
	@NombreArchivo varchar(1000)
AS 


	DECLARE @sqlCommand nvarchar(1000)

	SET @sqlCommand = 'USE MASTER BACKUP DATABASE ' + @Base + ' TO DISK = ' + '''' + @Directorio + @NombreArchivo + '.bak' + '''';

	EXEC (@sqlCommand)


GO
/****** Object:  StoredProcedure [dbo].[sp_BajaBitacora]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaBitacora] 
    @ID_Evento int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Bitacora]
	WHERE  [ID_Evento] = @ID_Evento

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaBusquedas]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaBusquedas] 
    @ID_Consulta int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Busquedas]
	WHERE  [ID_Consulta] = @ID_Consulta

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaDetalle]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaDetalle] 
    @ID_Factura int,
    @ID_Producto int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Detalle]
	WHERE  [ID_Factura] = @ID_Factura
	       AND [ID_Producto] = @ID_Producto

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaDVV]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaDVV] 
    @DVV nvarchar(100)
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[DVV]
	WHERE  [DVV] = @DVV

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaFactura]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaFactura] 
    @ID_Factura int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Factura]
	WHERE  [ID_Factura] = @ID_Factura

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaFamilia] 
    @ID_Familia int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Familia]
	WHERE  [ID_Familia] = @ID_Familia

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaFamilia_Patente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaFamilia_Patente] 
    @ID_Familia int,
    @ID_Patente int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Familia_Patente]
	WHERE  [ID_Familia] = @ID_Familia
	       AND [ID_Patente] = @ID_Patente

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaPatente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaPatente] 
    @ID_Patente int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Patente]
	WHERE  [ID_Patente] = @ID_Patente

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaProductos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaProductos] 
    @ID_Producto int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Productos]
	WHERE  [ID_Producto] = @ID_Producto

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaPromos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaPromos] 
    @ID_Promo int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Promos]
	WHERE  [ID_Promo] = @ID_Promo

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaProveedores]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaProveedores] 
    @ID_Proveedor int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Proveedores]
	WHERE  [ID_Proveedor] = @ID_Proveedor

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaStock]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaStock] 
    @ID_Producto int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Stock]
	WHERE  [ID_Producto] = @ID_Producto

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaUsuarioFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaUsuarioFamilia] 
    @ID_Usuario int,
    @ID_Familia int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[UsuarioFamilia]
	WHERE  [ID_Usuario] = @ID_Usuario
	       AND [ID_Familia] = @ID_Familia

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_BajaUsuarios]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BajaUsuarios] 
    @ID_Usuario int
AS 
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Usuarios]
	WHERE  [ID_Usuario] = @ID_Usuario

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerBitacora]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerBitacora] 
    @ID_Evento int
AS 

	BEGIN TRAN

	SELECT [ID_Evento], [Descripcion], [Fecha], [DVH] 
	FROM   [dbo].[Bitacora] 
	WHERE  ([ID_Evento] = @ID_Evento OR @ID_Evento IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerBitacoraPorFechas]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerBitacoraPorFechas] 
    @Desde varchar(50),
	@Hasta varchar(50)

AS 

	BEGIN TRAN

	SELECT [ID_Evento], [Descripcion], [Fecha], [DVH] 
	FROM   [dbo].[Bitacora] 
 WHERE (([Fecha] >=  @Desde +' 00:00:00.000' OR @Desde IS NULL )
 AND    ([Fecha] <= @Hasta +' 23:59:59.000' OR @Hasta IS NULL )) 

 
 order by Fecha Desc

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[sp_LeerBusquedas]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerBusquedas] 
    @ID_Consulta int
AS 

	BEGIN TRAN

	SELECT [ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH] 
	FROM   [dbo].[Busquedas] 
	WHERE  ([ID_Consulta] = @ID_Consulta OR @ID_Consulta IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerCantProductosPorId]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerCantProductosPorId] 
    @ID_Producto int
AS 

	BEGIN TRAN

			select cantidad, pro.ID_Producto 
		from dbo.Productos pro, dbo.Stock 
		where pro.ID_Producto = dbo.Stock.ID_Producto
		and (pro.ID_Producto = @ID_Producto OR @ID_Producto IS NULL) 




	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerDetalle]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerDetalle] 
    @ID_Factura int
AS 

	BEGIN TRAN

	SELECT [ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH] 
	FROM   [dbo].[Detalle] 
	WHERE  ([ID_Factura] = @ID_Factura OR @ID_Factura IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerDVV]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerDVV] 
    @DVV nvarchar(100)
AS 

	BEGIN TRAN

	SELECT [DVV] 
	FROM   [dbo].[DVV] 
	WHERE  ([DVV] = @DVV OR @DVV IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerFactura]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerFactura] 
    @ID_Factura int
AS 

	BEGIN TRAN

	SELECT [ID_Factura], [ID_Cliente], [Fecha], [DVH] 
	FROM   [dbo].[Factura] 
	WHERE  ([ID_Factura] = @ID_Factura OR @ID_Factura IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerFacturasPorIdUsuario]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerFacturasPorIdUsuario] 
    @ID_Cliente int
AS 

	BEGIN TRAN

	SELECT [ID_Factura], [ID_Cliente], [Fecha], [DVH] 
	FROM   [dbo].[Factura] 
	WHERE  ([ID_Cliente] = @ID_Cliente OR @ID_Cliente IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerFamilia] 
    @ID_Familia int,
	@Nombre_Familia nvarchar(50)
AS 

	BEGIN TRAN

	SELECT [ID_Familia], [Nombre_Familia], [DVH] 
	FROM   [dbo].[Familia] 
	WHERE  ([ID_Familia] = @ID_Familia OR @ID_Familia IS NULL) 
	AND  ([Nombre_Familia] = @Nombre_Familia OR @Nombre_Familia IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerFamilia_Patente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerFamilia_Patente] 
    @ID_Familia int,
    @ID_Patente int
AS 

	BEGIN TRAN

	SELECT [ID_Familia], [ID_Patente], [DVH] 
	FROM   [dbo].[Familia_Patente] 
	WHERE  ([ID_Familia] = @ID_Familia OR @ID_Familia IS NULL) 
	       AND ([ID_Patente] = @ID_Patente OR @ID_Patente IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerFamiliasPorIdUsuario]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerFamiliasPorIdUsuario] 
    @ID_Usuario int
AS 

	BEGIN TRAN

	select f.*
	from UsuarioFamilia uf
	inner join Familia f on (f.ID_Familia = uf.ID_Familia)
	inner join Usuarios u on (u.ID_Usuario = uf.ID_Usuario)
	WHERE  (u.ID_Usuario = @ID_Usuario OR @ID_Usuario IS NULL) 


	COMMIT



GO
/****** Object:  StoredProcedure [dbo].[sp_LeerPatente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerPatente] 
    @ID_Patente int,
	@Descripcion nvarchar(50),
	@Grupo nvarchar(50),
	@Detalle nvarchar(50)
AS 

	BEGIN TRAN

	SELECT [ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH] 
	FROM   [dbo].[Patente] 
	WHERE  ([ID_Patente] = @ID_Patente OR @ID_Patente IS NULL) 
	AND  ([Descripcion] = @Descripcion OR @Descripcion IS NULL) 
	AND  ([Grupo] = @Grupo OR @Grupo IS NULL) 
	AND  ([Detalle] = @Detalle OR @Detalle IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerPatentePorIdFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerPatentePorIdFamilia] 
    @ID_Familia int
AS 

	BEGIN TRAN

	select p.*
	from Patente p
	inner join Familia_Patente fp on (p.ID_Patente = fp.ID_Patente)
	inner join Familia f on (fp.ID_Familia = f.ID_Familia)
	WHERE  (f.ID_Familia = @ID_Familia OR @ID_Familia IS NULL) 


	COMMIT



GO
/****** Object:  StoredProcedure [dbo].[sp_LeerProductos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerProductos] 
    @ID_Producto int,
	@ID_Proveedor int,
	@Nombre nvarchar(50),
	@Descripcion nvarchar(50)
AS 

	BEGIN TRAN

	SELECT [ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH] 
	FROM   [dbo].[Productos] 
	WHERE  ([ID_Producto] = @ID_Producto OR @ID_Producto IS NULL) 
	AND ([ID_Proveedor] = @ID_Proveedor OR @ID_Proveedor IS NULL) 
	AND ([Nombre] = @Nombre OR @Nombre IS NULL) 
	AND ([Descripcion] = @Descripcion OR @Descripcion IS NULL) 


	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerPromos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerPromos] 
    @ID_Promo int,
	@Nombre nvarchar(50),
	@Producto nvarchar(50),
	@Descripcion nvarchar(50)
AS 

	BEGIN TRAN

	SELECT [ID_Promo], [Nombre], [Producto], [Descripcion], [precio], [DVH] 
	FROM   [dbo].[Promos] 
	WHERE  ([ID_Promo] = @ID_Promo OR @ID_Promo IS NULL) 
	AND ([Nombre] = @Nombre OR @Nombre IS NULL) 
	AND ([Producto] = @Producto OR @Producto IS NULL) 
	AND ([Descripcion] = @Descripcion OR @Descripcion IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerProveedores]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerProveedores] 
    @ID_Proveedor int,
	@Nombre nvarchar(50),
	@Direccion nvarchar(50),
	@Telefono nvarchar(50),
	@Descripcion nvarchar(50)
AS 

	BEGIN TRAN

	SELECT [ID_Proveedor], [Nombre], [Direccion], [Telefono], [Descripcion], [DVH] 
	FROM   [dbo].[Proveedores] 
	WHERE  ([ID_Proveedor] = @ID_Proveedor OR @ID_Proveedor IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerStock]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerStock] 
    @ID_Producto int
AS 

	BEGIN TRAN

	SELECT [ID_Producto], [Cantidad], [DVH] 
	FROM   [dbo].[Stock] 
	WHERE  ([ID_Producto] = @ID_Producto OR @ID_Producto IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerTabla]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerTabla] 
    @NombreTabla nvarchar(1000),
	@ListaColumnas varchar(1000)
AS 

	BEGIN TRAN

	DECLARE @sqlCommand nvarchar(1000)

	SET @sqlCommand = 'SELECT ' + @ListaColumnas + ' FROM ' + @NombreTabla 

	EXEC (@sqlCommand)


	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerUsuarioFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerUsuarioFamilia] 
    @ID_Usuario int,
    @ID_Familia int
AS 

	BEGIN TRAN

	SELECT [ID_Usuario], [ID_Familia], [DVH] 
	FROM   [dbo].[UsuarioFamilia] 
	WHERE  ([ID_Usuario] = @ID_Usuario OR @ID_Usuario IS NULL) 
	       AND ([ID_Familia] = @ID_Familia OR @ID_Familia IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_LeerUsuarios]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LeerUsuarios] 
    @ID_Usuario int,
	@Usuario nvarchar(50),
	@Nombre nvarchar(50),
	@Apellido nvarchar(50)
AS 

	BEGIN TRAN

	SELECT [ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [email], [Telefono], [Activo], [PalabraRestitucion], [DVH] 
	FROM   [dbo].[Usuarios] 
	WHERE  ([ID_Usuario] = @ID_Usuario OR @ID_Usuario IS NULL) 
	AND ([Usuario] = @Usuario OR @Usuario IS NULL) 
	AND ([Nombre] = @Nombre OR @Nombre IS NULL) 
	AND ([Apellido] = @Apellido OR @Apellido IS NULL) 


	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarBitacora]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarBitacora] 
    @ID_Evento int,
    @Descripcion nvarchar(50),
    @Fecha datetime,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Bitacora]
	SET    [Descripcion] = @Descripcion, [Fecha] = @Fecha, [DVH] = @DVH
	WHERE  [ID_Evento] = @ID_Evento
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Evento], [Descripcion], [Fecha], [DVH]
	FROM   [dbo].[Bitacora]
	WHERE  [ID_Evento] = @ID_Evento	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarBusquedas]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarBusquedas] 
    @ID_Consulta int,
    @ID_Usuario int,
    @Consulta nvarchar(50) = NULL,
    @Fecha datetime = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Busquedas]
	SET    [ID_Usuario] = @ID_Usuario, [Consulta] = @Consulta, [Fecha] = @Fecha, [DVH] = @DVH
	WHERE  [ID_Consulta] = @ID_Consulta
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Consulta], [ID_Usuario], [Consulta], [Fecha], [DVH]
	FROM   [dbo].[Busquedas]
	WHERE  [ID_Consulta] = @ID_Consulta	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarDetalle]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarDetalle] 
    @ID_Factura int,
    @ID_Producto int,
    @cantidad int,
    @PrecioUnitario float = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Detalle]
	SET    [ID_Factura] = @ID_Factura, [ID_Producto] = @ID_Producto, [cantidad] = @cantidad, [PrecioUnitario] = @PrecioUnitario, [DVH] = @DVH
	WHERE  [ID_Factura] = @ID_Factura
	       AND [ID_Producto] = @ID_Producto
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Factura], [ID_Producto], [cantidad], [PrecioUnitario], [DVH]
	FROM   [dbo].[Detalle]
	WHERE  [ID_Factura] = @ID_Factura
	       AND [ID_Producto] = @ID_Producto	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarDVV]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarDVV] 
    @DVV nvarchar(100)
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[DVV]
	SET    [DVV] = @DVV

	
	-- Begin Return Select <- do not remove
	SELECT [DVV]
	FROM   [dbo].[DVV]
	WHERE  [DVV] = @DVV	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarFactura]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarFactura] 
    @ID_Factura int,
    @ID_Cliente int,
    @Fecha datetime = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Factura]
	SET    [ID_Cliente] = @ID_Cliente, [Fecha] = @Fecha, [DVH] = @DVH
	WHERE  [ID_Factura] = @ID_Factura
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Factura], [ID_Cliente], [Fecha], [DVH]
	FROM   [dbo].[Factura]
	WHERE  [ID_Factura] = @ID_Factura	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarFamilia] 
    @ID_Familia int,
    @Nombre_Familia nvarchar(50),
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Familia]
	SET    [Nombre_Familia] = @Nombre_Familia, [DVH] = @DVH
	WHERE  [ID_Familia] = @ID_Familia
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Familia], [Nombre_Familia], [DVH]
	FROM   [dbo].[Familia]
	WHERE  [ID_Familia] = @ID_Familia	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarFamilia_Patente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarFamilia_Patente] 
    @ID_Familia int,
    @ID_Patente int,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Familia_Patente]
	SET    [ID_Familia] = @ID_Familia, [ID_Patente] = @ID_Patente, [DVH] = @DVH
	WHERE  [ID_Familia] = @ID_Familia
	       AND [ID_Patente] = @ID_Patente
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Familia], [ID_Patente], [DVH]
	FROM   [dbo].[Familia_Patente]
	WHERE  [ID_Familia] = @ID_Familia
	       AND [ID_Patente] = @ID_Patente	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarPatente]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarPatente] 
    @ID_Patente int,
    @Descripcion nvarchar(50),
    @Grupo nvarchar(50),
    @Detalle nvarchar(50),
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Patente]
	SET    [Descripcion] = @Descripcion, [Grupo] = @Grupo, [Detalle] = @Detalle, [DVH] = @DVH
	WHERE  [ID_Patente] = @ID_Patente
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Patente], [Descripcion], [Grupo], [Detalle], [DVH]
	FROM   [dbo].[Patente]
	WHERE  [ID_Patente] = @ID_Patente	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarProductos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarProductos] 
    @ID_Producto int,
    @ID_Proveedor int,
    @Nombre nvarchar(50),
    @Descripcion nvarchar(50) = NULL,
    @Precio float,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Productos]
	SET    [ID_Proveedor] = @ID_Proveedor, [Nombre] = @Nombre, [Descripcion] = @Descripcion, [Precio] = @Precio, [DVH] = @DVH
	WHERE  [ID_Producto] = @ID_Producto
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Producto], [ID_Proveedor], [Nombre], [Descripcion], [Precio], [DVH]
	FROM   [dbo].[Productos]
	WHERE  [ID_Producto] = @ID_Producto	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarPromos]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarPromos] 
    @ID_Promo int,
    @Nombre nvarchar(50),
    @Producto nvarchar(50),
    @Descripcion nvarchar(50),
    @precio float,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Promos]
	SET    [Nombre] = @Nombre, [Producto] = @Producto, [Descripcion] = @Descripcion, [precio] = @precio, [DVH] = @DVH
	WHERE  [ID_Promo] = @ID_Promo
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Promo], [Nombre], [Producto], [Descripcion], [precio], [DVH]
	FROM   [dbo].[Promos]
	WHERE  [ID_Promo] = @ID_Promo	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarProveedores]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarProveedores] 
    @ID_Proveedor int,
    @Nombre varchar(50),
    @Direccion varchar(50),
    @Telefono varchar(50),
    @Descripcion varchar(50) = NULL,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Proveedores]
	SET    [Nombre] = @Nombre, [Direccion] = @Direccion, [Telefono] = @Telefono, [Descripcion] = @Descripcion, [DVH] = @DVH
	WHERE  [ID_Proveedor] = @ID_Proveedor
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Proveedor], [Nombre], [Direccion], [Telefono], [Descripcion], [DVH]
	FROM   [dbo].[Proveedores]
	WHERE  [ID_Proveedor] = @ID_Proveedor	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarStock]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarStock] 
    @ID_Producto int,
    @Cantidad int = NULL,
    @DVH nvarchar(50) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Stock]
	SET    [ID_Producto] = @ID_Producto, [Cantidad] = @Cantidad, [DVH] = @DVH
	WHERE  [ID_Producto] = @ID_Producto
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Producto], [Cantidad], [DVH]
	FROM   [dbo].[Stock]
	WHERE  [ID_Producto] = @ID_Producto	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarUsuarioFamilia]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarUsuarioFamilia] 
    @ID_Usuario int,
    @ID_Familia int,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[UsuarioFamilia]
	SET    [ID_Usuario] = @ID_Usuario, [ID_Familia] = @ID_Familia, [DVH] = @DVH
	WHERE  [ID_Usuario] = @ID_Usuario
	       AND [ID_Familia] = @ID_Familia
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Usuario], [ID_Familia], [DVH]
	FROM   [dbo].[UsuarioFamilia]
	WHERE  [ID_Usuario] = @ID_Usuario
	       AND [ID_Familia] = @ID_Familia	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarUsuarios]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ModificarUsuarios] 
    @ID_Usuario int,
    @Usuario nvarchar(50) = NULL,
    @Password nvarchar(50) = NULL,
    @Nombre nvarchar(50) = NULL,
    @Apellido nvarchar(50) = NULL,
    @Direccion nvarchar(50) = NULL,
    @email nvarchar(50) = NULL,
    @Telefono nvarchar(50) = NULL,
    @Activo bit,
    @PalabraRestitucion nvarchar(50) = NULL,
    @DVH nvarchar(100) = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[Usuarios]
	SET    [Usuario] = @Usuario, [Password] = @Password, [Nombre] = @Nombre, [Apellido] = @Apellido, [Direccion] = @Direccion, [email] = @email, [Telefono] = @Telefono, [Activo] = @Activo, [PalabraRestitucion] = @PalabraRestitucion, [DVH] = @DVH
	WHERE  [ID_Usuario] = @ID_Usuario
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Usuario], [Usuario], [Password], [Nombre], [Apellido], [Direccion], [email], [Telefono], [Activo], [PalabraRestitucion], [DVH]
	FROM   [dbo].[Usuarios]
	WHERE  [ID_Usuario] = @ID_Usuario	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerNombresDeTablas]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ObtenerNombresDeTablas] 
AS 

	BEGIN TRAN

		Select Table_name as NAME
		From   Information_schema.Tables
		Where  Table_type = 'BASE TABLE' 
        and Table_Name Not In ('dtproperties','sysdiagrams')


	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[sp_Restore]    Script Date: 08/07/2023 10:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Restore] 
    @Base nvarchar(1000),
	@Directorio varchar(1000),
	@NombreArchivo varchar(1000)
AS 


	DECLARE @sqlCommand nvarchar(1000)


	--SET @sqlCommand = 'USE MASTER '+ CHAR(13) + CHAR(10) +' ALTER DATABASE ' + @Base + ' SET SINGLE_USER WITH ROLLBACK IMMEDIATE '+ CHAR(13) + CHAR(10) +' DROP DATABASE ' + @Base + CHAR(13) + CHAR(10) + 'RESTORE DATABASE ' + @Base + ' FROM DISK = ' + '''' + @Directorio + @NombreArchivo + '.bak' + '''' + 'WITH REPLACE;'
	SET @sqlCommand = 'USE MASTER '+ CHAR(13) + CHAR(10) +' DROP DATABASE ' + @Base + CHAR(13) + CHAR(10) + 'RESTORE DATABASE ' + @Base + ' FROM DISK = ' + '''' + @Directorio + @NombreArchivo + '.bak' + '''' + 'WITH REPLACE;'


	EXEC (@sqlCommand)

GO
USE [master]
GO
ALTER DATABASE [FarmaUAICenter] SET  READ_WRITE 
GO
