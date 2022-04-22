	USE [master]
	GO
	/****** Object:  Database [negocios2011]    Script Date: 11/06/2014 17:59:08 ******/


	USE [negocios2011]
	GO
	CREATE SCHEMA [VENTA]  
	GO
	/****** Object:  Schema [RRHH]    Script Date: 11/06/2014 17:59:08 ******/
	CREATE SCHeMA [RRHH]  
	GO
	/****** Object:  Schema [COMPRA]    Script Date: 11/06/2014 17:59:08 ******/
	CREATE SCHEMA [COMPRA]  
	GO
	/****** Object:  Table [dbo].[paises]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
	CREATE TABLE [dbo].[paises](
		[idpais] [char](3) NOT NULL,
		[nombrepais] [varchar](40) NOT NULL,
	PRIMARY KEY CLUSTERED 
	(
		[idpais] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
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
	/****** Object:  Table [COMPRA].[categorias]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
	CREATE TABLE [COMPRA].[categorias](
		[idcategoria] [int] NOT NULL,
		[nomcategoria] [varchar](40) NOT NULL,
		[descripcion] [text] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[idcategoria] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [COMPRA].[categorias] ([idcategoria], [nomcategoria], [descripcion]) VALUES (17, N'Lácteos', N'Productos derivados de la leche')
	INSERT [COMPRA].[categorias] ([idcategoria], [nomcategoria], [descripcion]) VALUES (25, N'Verduras', N'Productos provenientes del campo')
	INSERT [COMPRA].[categorias] ([idcategoria], [nomcategoria], [descripcion]) VALUES (46, N'Cárnicos', N'Productos derivados de la carne')
	/****** Object:  Table [RRHH].[cargos]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
	CREATE TABLE [RRHH].[cargos](
		[idcargo] [int] NOT NULL,
		[descargo] [varchar](30) NOT NULL,
	PRIMARY KEY CLUSTERED 
	(
		[idcargo] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [RRHH].[cargos] ([idcargo], [descargo]) VALUES (16, N'Auxiliar adm. RRHH')
	INSERT [RRHH].[cargos] ([idcargo], [descargo]) VALUES (49, N'Almanero, técnico en almacen')
	INSERT [RRHH].[cargos] ([idcargo], [descargo]) VALUES (91, N'Director de ventas, encargado')
	/****** Object:  Table [dbo].[EMPLEADOBAK]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
	CREATE TABLE [dbo].[EMPLEADOBAK](
		[IDEMPLEADO] [int] NOT NULL,
		[APEEMPLEADO] [varchar](50) NOT NULL,
		[NOMEMPLEADO] [varchar](50) NOT NULL
	) ON [PRIMARY]
	GO
	SET ANSI_PADDING OFF
	GO
	/****** Object:  Table [dbo].[distritos]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
	CREATE TABLE [dbo].[distritos](
		[iddistrito] [int] NOT NULL,
		[nomdistrito] [varchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED 
	(
		[iddistrito] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [dbo].[distritos] ([iddistrito], [nomdistrito]) VALUES (2, N'Polígono Cantabria')
	INSERT [dbo].[distritos] ([iddistrito], [nomdistrito]) VALUES (12, N'La Cava')
	INSERT [dbo].[distritos] ([iddistrito], [nomdistrito]) VALUES (34, N'Valdegastea')
	/****** Object:  Table [dbo].[clientes]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
	CREATE TABLE [dbo].[clientes](
		[idcliente] [char](5) NOT NULL,
		[nomcliente] [varchar](40) NOT NULL,
		[dircliente] [varchar](80) NOT NULL,
		[idpais] [char](3) NOT NULL,
		[fonocliente] [varchar](15) NULL,
		[Descuento] [decimal](4, 2) NULL,
	PRIMARY KEY CLUSTERED 
	(
		[idcliente] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [dbo].[clientes] ([idcliente], [nomcliente], [dircliente], [idpais], [fonocliente], [Descuento]) VALUES (N'1    ', N'Fernando', N'C/ Sepulveda, nº 17', N'esp', N'698753120', CAST(1.00 AS Decimal(4, 2)))
	INSERT [dbo].[clientes] ([idcliente], [nomcliente], [dircliente], [idpais], [fonocliente], [Descuento]) VALUES (N'HGWIK', N'Bartolomé', N'C/ Alcalá, nº 137', N'usa', N'610214589', CAST(10.00 AS Decimal(4, 2)))
	INSERT [dbo].[clientes] ([idcliente], [nomcliente], [dircliente], [idpais], [fonocliente], [Descuento]) VALUES (N'NCBCK', N'Isabel', N'C/ Marques de Murrieta, nº 43', N'fra', N'654123012', CAST(10.00 AS Decimal(4, 2)))
	/****** Object:  Table [dbo].[proveedores]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
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
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [dbo].[proveedores] ([idproveedor], [nomproveedor], [dirproveedor], [nomcontacto], [cargocontacto], [idpais], [fonoproveedor], [faxproveedor]) VALUES (26, N'Logistica Faxrapid, S.C', N'C/ General Ugarte, nº 14', N'Maria', N'Auxiliar administrativo', N'esp', N'654123987', N'912456987')
	INSERT [dbo].[proveedores] ([idproveedor], [nomproveedor], [dirproveedor], [nomcontacto], [cargocontacto], [idpais], [fonoproveedor], [faxproveedor]) VALUES (67, N'Mensajería Serur, S.A', N'Avda. de la Paz, nº 12', N'Tomas', N'Director de ventas', N'usa', N'621458741', N'941258545')
	INSERT [dbo].[proveedores] ([idproveedor], [nomproveedor], [dirproveedor], [nomcontacto], [cargocontacto], [idpais], [fonoproveedor], [faxproveedor]) VALUES (97, N'Distribuciones Garcia, SL.', N'C/ Santa Ana, nº 11', N'Enrique', N'Almacenero', N'ing', N'698741230', N'948751235')
	/****** Object:  Table [RRHH].[empleados]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
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
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [RRHH].[empleados] ([idempleado], [nomempleado], [apeempleado], [fecnac], [dirempleado], [iddistrito], [fonoempleado], [idcargo], [feccontrata], [fotoempleado], [Salario]) VALUES (1, N'Marcos', N'Gutierrez', CAST(0x00006F1C00000000 AS DateTime), N'C/ Tricio, nº 12', 34, N'654120754', 49, CAST(0x00009CC400000000 AS DateTime), NULL, CAST(3000.00 AS Decimal(10, 2)))
	INSERT [RRHH].[empleados] ([idempleado], [nomempleado], [apeempleado], [fecnac], [dirempleado], [iddistrito], [fonoempleado], [idcargo], [feccontrata], [fotoempleado], [Salario]) VALUES (2, N'Alfredo', N'Martín', CAST(0x00009CC400000000 AS DateTime), N'Avda. Colon, nº 18', 12, N'602102302', 91, CAST(0x00009CC400000000 AS DateTime), NULL, CAST(1500.00 AS Decimal(10, 2)))
	INSERT [RRHH].[empleados] ([idempleado], [nomempleado], [apeempleado], [fecnac], [dirempleado], [iddistrito], [fonoempleado], [idcargo], [feccontrata], [fotoempleado], [Salario]) VALUES (3, N'Pablo', N'Gomez', CAST(0x00009CC400000000 AS DateTime), N'C/ General Ugarte, nº 67', 12, N'658951412', 49, CAST(0x00009CC400000000 AS DateTime), NULL, CAST(2000.00 AS Decimal(10, 2)))
	/****** Object:  Table [VENTA].[pedidoscabe]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
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
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (92, N'NCBCK', 1, CAST(0x0000A0C800000000 AS DateTime), CAST(0x0000A21600000000 AS DateTime), CAST(0x0000A36100000000 AS DateTime), N'N', N'Isabel', N'C/ Marqués de Murrieta, nº 43')
	INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (137, N'NCBCK', 2, CAST(0x0000A25400000000 AS DateTime), CAST(0x0000A2A900000000 AS DateTime), CAST(0x0000A3FF00000000 AS DateTime), N'S', N'Isabel', N'C/ Marqués de Murrieta, nº 43')
	INSERT [VENTA].[pedidoscabe] ([idpedido], [idcliente], [idempleado], [fechapedido], [fechaentrega], [fechaenvio], [enviopedido], [destinatario], [dirdestinatario]) VALUES (512, N'HGWIK', 1, CAST(0x0000A1D000000000 AS DateTime), CAST(0x0000A1F900000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), N'S', N'Bartolomé', N'C/ Alcalá, nº 137')
	/****** Object:  Table [COMPRA].[productos]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	SET ANSI_PADDING ON
	GO
	CREATE TABLE [COMPRA].[productos](
		[idproducto] [int] NOT NULL,
		[nomproducto] [varchar](80) NOT NULL,
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
	GO
	SET ANSI_PADDING OFF
	GO
	INSERT [COMPRA].[productos] ([idproducto], [nomproducto], [idproveedor], [idcategoria], [cantxunidad], [preciounidad], [unidadesenexistencia], [unienpedido]) VALUES (15, N'leche en polvo para bebes', 67, 17, N'12', CAST(97.20 AS Decimal(10, 2)), 59, 26)
	INSERT [COMPRA].[productos] ([idproducto], [nomproducto], [idproveedor], [idcategoria], [cantxunidad], [preciounidad], [unidadesenexistencia], [unienpedido]) VALUES (56, N'lechuga', 67, 25, N'15', CAST(23.45 AS Decimal(10, 2)), 77, 17)
	INSERT [COMPRA].[productos] ([idproducto], [nomproducto], [idproveedor], [idcategoria], [cantxunidad], [preciounidad], [unidadesenexistencia], [unienpedido]) VALUES (89, N'pollo', 26, 46, N'1', CAST(5.57 AS Decimal(10, 2)), 78, 15)
	/****** Object:  UserDefinedFunction [dbo].[PRECIOPROMEDIO]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE FUNCTION [dbo].[PRECIOPROMEDIO]() RETURNS DECIMAL
	AS
	BEGIN
	DECLARE @PROM DECIMAL
	SELECT @PROM=AVG(PRECIOUNIDAD)
	FROM COMPRA.PRODUCTOS
	RETURN @PROM
	END
	GO
	/****** Object:  UserDefinedFunction [dbo].[PEDIDOSEMPLEADO]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE FUNCTION [dbo].[PEDIDOSEMPLEADO](@ID INT) RETURNS DECIMAL
	AS
	BEGIN
	DECLARE @Q DECIMAL=0
	SELECT @Q=COUNT(*)
	FROM VENTA.PEDIDOSCABE
	WHERE YEAR(FECHAPEDIDO)=YEAR(GETDATE()) AND IDEMPLEADO=@ID
	IF @Q IS NULL
	SET @Q=0
	RETURN @Q
	END
	GO
	/****** Object:  Table [dbo].[pedidosdeta]    Script Date: 11/06/2014 17:59:08 ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[pedidosdeta](
		[idpedido] [int] NOT NULL,
		[idproducto] [int] NOT NULL,
		[preciounidad] [decimal](10, 2) NOT NULL,
		[cantidad] [smallint] NOT NULL,
		[descuento] [decimal](10, 2) NOT NULL
	) ON [PRIMARY]
	GO
	INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (92, 89, CAST(5.52 AS Decimal(10, 2)), 78, CAST(1.12 AS Decimal(10, 2)))
	INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (512, 56, CAST(23.45 AS Decimal(10, 2)), 77, CAST(5.56 AS Decimal(10, 2)))
	INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (137, 15, CAST(97.20 AS Decimal(10, 2)), 59, CAST(1.13 AS Decimal(10, 2)))
	INSERT [dbo].[pedidosdeta] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (137, 89, CAST(6.00 AS Decimal(10, 2)), 10, CAST(10.00 AS Decimal(10, 2)))
	/****** Object:  ForeignKey [FK_idpais]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [FK_idpais] FOREIGN KEY([idpais])
	REFERENCES [dbo].[paises] ([idpais])
	GO
	ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [FK_idpais]
	GO
	/****** Object:  ForeignKey [FK_idpais_prov]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [dbo].[proveedores]  WITH CHECK ADD  CONSTRAINT [FK_idpais_prov] FOREIGN KEY([idpais])
	REFERENCES [dbo].[paises] ([idpais])
	GO
	ALTER TABLE [dbo].[proveedores] CHECK CONSTRAINT [FK_idpais_prov]
	GO
	/****** Object:  ForeignKey [FK_idprov_prod]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [dbo].[proveedores]  WITH CHECK ADD  CONSTRAINT [FK_idprov_prod] FOREIGN KEY([idproveedor])
	REFERENCES [dbo].[proveedores] ([idproveedor])
	GO
	ALTER TABLE [dbo].[proveedores] CHECK CONSTRAINT [FK_idprov_prod]
	GO
	/****** Object:  ForeignKey [FK_idcargo_empleados]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [RRHH].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_idcargo_empleados] FOREIGN KEY([idcargo])
	REFERENCES [RRHH].[cargos] ([idcargo])
	GO
	ALTER TABLE [RRHH].[empleados] CHECK CONSTRAINT [FK_idcargo_empleados]
	GO
	/****** Object:  ForeignKey [FK_iddis_empleados]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [RRHH].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_iddis_empleados] FOREIGN KEY([iddistrito])
	REFERENCES [dbo].[distritos] ([iddistrito])
	GO
	ALTER TABLE [RRHH].[empleados] CHECK CONSTRAINT [FK_iddis_empleados]
	GO
	/****** Object:  ForeignKey [FK_idcargo_pedcab]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [VENTA].[pedidoscabe]  WITH CHECK ADD  CONSTRAINT [FK_idcargo_pedcab] FOREIGN KEY([idcliente])
	REFERENCES [venta].[clientes] ([idcliente])
	GO
	ALTER TABLE [VENTA].[pedidoscabe] CHECK CONSTRAINT [FK_idcargo_pedcab]
	GO
	/****** Object:  ForeignKey [FK_idempleado_pedcab]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [VENTA].[pedidoscabe]  WITH CHECK ADD  CONSTRAINT [FK_idempleado_pedcab] FOREIGN KEY([idempleado])
	REFERENCES [RRHH].[empleados] ([idempleado])
	GO
	ALTER TABLE [VENTA].[pedidoscabe] CHECK CONSTRAINT [FK_idempleado_pedcab]
	GO
	/****** Object:  ForeignKey [FK_idcat_prod]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [COMPRA].[productos]  WITH CHECK ADD  CONSTRAINT [FK_idcat_prod] FOREIGN KEY([idcategoria])
	REFERENCES [COMPRA].[categorias] ([idcategoria])
	GO
	ALTER TABLE [COMPRA].[productos] CHECK CONSTRAINT [FK_idcat_prod]
	GO
	/****** Object:  ForeignKey [FK_idprovee_prod]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [COMPRA].[productos]  WITH CHECK ADD  CONSTRAINT [FK_idprovee_prod] FOREIGN KEY([idproveedor])
	REFERENCES [dbo].[proveedores] ([idproveedor])
	GO
	ALTER TABLE [COMPRA].[productos] CHECK CONSTRAINT [FK_idprovee_prod]
	GO
	/****** Object:  ForeignKey [FK_idpedido_pedidosdeta]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [dbo].[pedidosdeta]  WITH CHECK ADD  CONSTRAINT [FK_idpedido_pedidosdeta] FOREIGN KEY([idpedido])
	REFERENCES [VENTA].[pedidoscabe] ([idpedido])
	GO
	ALTER TABLE [dbo].[pedidosdeta] CHECK CONSTRAINT [FK_idpedido_pedidosdeta]
	GO
	/****** Object:  ForeignKey [FK_idproducto_pedidosdeta]    Script Date: 11/06/2014 17:59:08 ******/
	ALTER TABLE [dbo].[pedidosdeta]  WITH CHECK ADD  CONSTRAINT [FK_idproducto_pedidosdeta] FOREIGN KEY([idproducto])
	REFERENCES [COMPRA].[productos] ([idproducto])
	GO
	ALTER TABLE [dbo].[pedidosdeta] CHECK CONSTRAINT [FK_idproducto_pedidosdeta]
	GO
