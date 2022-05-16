USE [negocios2011]
GO
/****** Object:  Trigger [VENTA].[Actualizar_Stock]    Script Date: 02/20/2014 18:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [VENTA].[Actualizar_npedidos]
   on [VENTA].[pedidoscabe]
   for insert,delete,update
   as
   Update C set C.Npedidos=C.Npedidos+1
   from venta.Clientes as C inner join
   inserted as D on D.idCliente=C.idCliente
   
   Update C set C.Npedidos=C.Npedidos-1
   from venta.Clientes as C inner join
   deleted as D on D.idCliente=C.idCliente
   
 