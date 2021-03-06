CREATE  DATABASE [negocios2011]
GO
USE [negocios2011]
GO
CREATE SCHEMA COMPRA
GO
CREATE SCHEMA RRHH
GO
CREATE SCHEMA VENTA
GO


/****** Object:  Table [dbo].[paises]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paises]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paises](
	[idpais] [char](3) NOT NULL,
	[nombrepais] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpais] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'96 ', N'ESPAÑA')
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'97 ', N'ESPAÑA')
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'98 ', N'ESPAÑA')
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'99 ', N'ESPAÑA')
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'esp', N'España')
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'fra', N'Francia')
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'ing', N'Inglaterra')
INSERT [dbo].[paises] ([idpais], [nombrepais]) VALUES (N'usa', N'Estados Unidos')
/****** Object:  Table [COMPRA].[categorias]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[COMPRA].[categorias]') AND type in (N'U'))
BEGIN
CREATE TABLE [COMPRA].[categorias](
	[idcategoria] [int] NOT NULL,
	[nomcategoria] [varchar](40) NOT NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [COMPRA].[categorias] ([idcategoria], [nomcategoria], [descripcion]) VALUES (17, N'Lácteos', N'Productos derivados de la leche')
INSERT [COMPRA].[categorias] ([idcategoria], [nomcategoria], [descripcion]) VALUES (25, N'Verduras', N'Productos provenientes del campo')
INSERT [COMPRA].[categorias] ([idcategoria], [nomcategoria], [descripcion]) VALUES (46, N'Cárnicos', N'Productos derivados de la carne')
/****** Object:  Table [RRHH].[cargos]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RRHH].[cargos]') AND type in (N'U'))
BEGIN
CREATE TABLE [RRHH].[cargos](
	[idcargo] [int] NOT NULL,
	[descargo] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcargo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [RRHH].[cargos] ([idcargo], [descargo]) VALUES (16, N'Auxiliar adm. RRHH')
INSERT [RRHH].[cargos] ([idcargo], [descargo]) VALUES (49, N'Almanero, técnico en almacen')
INSERT [RRHH].[cargos] ([idcargo], [descargo]) VALUES (91, N'Director de ventas, encargado')
/****** Object:  Table [dbo].[EMPLEADOBAK]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADOBAK]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLEADOBAK](
	[IDEMPLEADO] [int] NOT NULL,
	[APEEMPLEADO] [varchar](50) NOT NULL,
	[NOMEMPLEADO] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distritos]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[distritos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[distritos](
	[iddistrito] [int] NOT NULL,
	[nomdistrito] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddistrito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[distritos] ([iddistrito], [nomdistrito]) VALUES (2, N'Polígono Cantabria')
INSERT [dbo].[distritos] ([iddistrito], [nomdistrito]) VALUES (12, N'La Cava')
INSERT [dbo].[distritos] ([iddistrito], [nomdistrito]) VALUES (34, N'Valdegastea')
/****** Object:  Table [venta].[clientes]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[venta].[clientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [venta].[clientes](
	[idcliente] [char](5) NOT NULL,
	[nombrecia] [varchar](40) NOT NULL,
	[dircliente] [varchar](80) NOT NULL,
	[idpais] [char](3) NOT NULL,
	[fonocliente] [varchar](15) NULL,
	[Descuento] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [venta].[clientes] ([idcliente], [nombrecia], [dircliente], [idpais], [fonocliente], [Descuento]) VALUES (N'1    ', N'Fernando', N'C/ Sepulveda, nº 17', N'esp', N'698753120', CAST(1.00 AS Decimal(4, 2)))
INSERT [venta].[clientes] ([idcliente], [nombrecia], [dircliente], [idpais], [fonocliente], [Descuento]) VALUES (N'HGWIK', N'Bartolomé', N'C/ Alcalá, nº 137', N'usa', N'610214589', CAST(10.00 AS Decimal(4, 2)))
INSERT [venta].[clientes] ([idcliente], [nombrecia], [dircliente], [idpais], [fonocliente], [Descuento]) VALUES (N'NCBCK', N'Isabel', N'C/ Marques de Murrieta, nº 43', N'fra', N'654123012', CAST(10.00 AS Decimal(4, 2)))
/****** Object:  Table [RRHH].[empleados]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RRHH].[empleados]') AND type in (N'U'))
BEGIN
CREATE TABLE [RRHH].[empleados](
	[idempleado] [int] NOT NULL,
	[nomempleado] [varchar](50) NOT NULL,
	[apeempleado] [varchar](50) NOT NULL,
	[fecnac] [datetime] NOT NULL,
	[dirempleado] [varchar](100) NOT NULL,
	[iddistrito] [int] NOT NULL,
	[fonoempleado] [varchar](15) NULL,
	[idcargo] [int] NOT NULL,
	[feccontrata] [datetime] NOT NULL,
	[fotoempleado] [image] NULL,
	[Salario] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [RRHH].[empleados] ([idempleado], [nomempleado], [apeempleado], [fecnac], [dirempleado], [iddistrito], [fonoempleado], [idcargo], [feccontrata], [fotoempleado], [Salario]) VALUES (1, N'Marcos', N'Gutierrez', CAST(0x00006F1C00000000 AS DateTime), N'C/ Tricio, nº 12', 34, N'654120754', 49, CAST(0x00009CC400000000 AS DateTime), NULL, CAST(3000.00 AS Decimal(10, 2)))
INSERT [RRHH].[empleados] ([idempleado], [nomempleado], [apeempleado], [fecnac], [dirempleado], [iddistrito], [fonoempleado], [idcargo], [feccontrata], [fotoempleado], [Salario]) VALUES (2, N'Alfredo', N'Martín', CAST(0x00009CC400000000 AS DateTime), N'Avda. Colon, nº 18', 12, N'602102302', 91, CAST(0x00009CC400000000 AS DateTime), NULL, CAST(1500.00 AS Decimal(10, 2)))
INSERT [RRHH].[empleados] ([idempleado], [nomempleado], [apeempleado], [fecnac], [dirempleado], [iddistrito], [fonoempleado], [idcargo], [feccontrata], [fotoempleado], [Salario]) VALUES (3, N'Pablo', N'Gomez', CAST(0x00009CC400000000 AS DateTime), N'C/ General Ugarte, nº 67', 12, N'658951412', 49, CAST(0x00009CC400000000 AS DateTime), NULL, CAST(4000.00 AS Decimal(10, 2)))
/****** Object:  Table [dbo].[proveedores]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proveedores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[proveedores](
	[idproveedor] [int] NOT NULL,
	[nomproveedor] [varchar](80) NOT NULL,
	[dirproveedor] [varchar](100) NOT NULL,
	[nomcontacto] [varchar](80) NOT NULL,
	[cargocontacto] [varchar](50) NOT NULL,
	[idpais] [char](3) NOT NULL,
	[fonoproveedor] [varchar](15) NOT NULL,
	[faxproveedor] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[proveedores] ([idproveedor], [nomproveedor], [dirproveedor], [nomcontacto], [cargocontacto], [idpais], [fonoproveedor], [faxproveedor]) VALUES (26, N'Logistica Faxrapid, S.C', N'C/ General Ugarte, nº 14', N'Maria', N'Auxiliar administrativo', N'esp', N'654123987', N'912456987')
INSERT [dbo].[proveedores] ([idproveedor], [nomproveedor], [dirproveedor], [nomcontacto], [cargocontacto], [idpais], [fonoproveedor], [faxproveedor]) VALUES (67, N'Mensajería Serur, S.A', N'Avda. de la Paz, nº 12', N'Tomas', N'Director de ventas', N'usa', N'621458741', N'941258545')
INSERT [dbo].[proveedores] ([idproveedor], [nomproveedor], [dirproveedor], [nomcontacto], [cargocontacto], [idpais], [fonoproveedor], [faxproveedor]) VALUES (97, N'Distribuciones Garcia, SL.', N'C/ Santa Ana, nº 11', N'Enrique', N'Almacenero', N'ing', N'698741230', N'948751235')
/****** Object:  Table [VENTA].[pedidoscabe]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[VENTA].[pedidoscabe]') AND type in (N'U'))
BEGIN
CREATE TABLE [VENTA].[pedidoscabe](
	[idpedido] [int] NOT NULL,
	[idcliente] [char](5) NOT NULL,
	[idempleado] [int] NOT NULL,
	[fechapedido] [datetime] NOT NULL,
	[fechaentrega] [datetime] NOT NULL,
	[fechaenvio] [datetime] NOT NULL,
	[enviopedido] [char](1) NOT NULL,
	[destinatario] [varchar](60) NOT NULL,
	[dirdestinatario] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (15, N'HGWIK', 1, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N' ', N'WEFWE', N'DIRDES')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (16, N'HGWIK', 1, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N' ', N'WEFWE', N'DIRDES')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (18, N'HGWIK', 1, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N' ', N'WEFWE', N'DIRDES')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (19, N'NCBCK', 1, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N' ', N'WEFWE', N'DIRDES')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (20, N'HGWIK', 1, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N' ', N'WEFWE', N'DIRDES')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (21, N'NCBCK', 1, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), N' ', N'WEFWE', N'DIRDES')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (92, N'NCBCK', 1, CAST(0x0000A0C800000000 AS DateTime), CAST(0x0000A21600000000 AS DateTime), CAST(0x0000A36100000000 AS DateTime), N'N', N'Isabel', N'C/ Marqués de Murrieta, nº 43')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (137, N'NCBCK', 2, CAST(0x0000A0C800000000 AS DateTime), CAST(0x0000A2A900000000 AS DateTime), CAST(0x0000A3FF00000000 AS DateTime), N'S', N'Isabel', N'C/ Marqués de Murrieta, nº 43')
INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (512, N'NCBCK', 1, CAST(0x0000A0C800000000 AS DateTime), CAST(0x0000A1F900000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), N'S', N'Bartolomé', N'C/ Alcalá, nº 137')
/****** Object:  Table [COMPRA].[productos]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[COMPRA].[productos]') AND type in (N'U'))
BEGIN
CREATE TABLE [COMPRA].[productos](
	[idproducto] [int] NOT NULL,
	[nombreproducto] [varchar](80) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idcategoria] [int] NOT NULL,
	[cantxunidad] [varchar](50) NOT NULL,
	[preciounidad] [decimal](10, 2) NOT NULL,
	[unidadesenexistencia] [smallint] NOT NULL,
	[unienpedido] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [COMPRA].[productos] ([idproducto], [nombreproducto], [idproveedor], [idcategoria], [cantxunidad], [preciounidad], [unidadesenexistencia], [unienpedido]) VALUES (15, N'leche en polvo para bebes', 67, 17, N'12', CAST(121.00 AS Decimal(10, 2)), 27, 26)
INSERT [COMPRA].[productos] ([idproducto], [nombreproducto], [idproveedor], [idcategoria], [cantxunidad], [preciounidad], [unidadesenexistencia], [unienpedido]) VALUES (16, N'ave', 26, 46, N'1', CAST(10.00 AS Decimal(10, 2)), 777, 11)
INSERT [COMPRA].[productos] ([idproducto], [nombreproducto], [idproveedor], [idcategoria], [cantxunidad], [preciounidad], [unidadesenexistencia], [unienpedido]) VALUES (56, N'lechuga', 67, 25, N'15', CAST(242.00 AS Decimal(10, 2)), 77, 17)
INSERT [COMPRA].[productos] ([idproducto], [nombreproducto], [idproveedor], [idcategoria], [cantxunidad], [preciounidad], [unidadesenexistencia], [unienpedido]) VALUES (89, N'pavo', 26, 46, N'1', CAST(100.00 AS Decimal(10, 2)), 78, 15)
/****** Object:  Table [dbo].[pedidosdeta]    Script Date: 11/13/2015 17:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedidosdeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pedidosdeta](
	[idpedido] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[preciounidad] [decimal](10, 2) NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[descuento] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (92, 89, CAST(5.52 AS Decimal(10, 2)), 78, CAST(1.12 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (512, 56, CAST(23.45 AS Decimal(10, 2)), 77, CAST(5.56 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (137, 15, CAST(97.20 AS Decimal(10, 2)), 59, CAST(1.13 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (137, 89, CAST(6.00 AS Decimal(10, 2)), 10, CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (92, 15, CAST(111.00 AS Decimal(10, 2)), 111, CAST(11.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (15, 15, CAST(10.00 AS Decimal(10, 2)), 5, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (15, 15, CAST(10.00 AS Decimal(10, 2)), 500, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (16, 15, CAST(10.00 AS Decimal(10, 2)), 500, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (18, 15, CAST(10.00 AS Decimal(10, 2)), 5, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (19, 15, CAST(10.00 AS Decimal(10, 2)), 20, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (20, 15, CAST(10.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (21, 15, CAST(10.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)))
