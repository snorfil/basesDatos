USE [negocios2011]
GO
ALTER trigger [VENTA].[PrecioMinimo]
   on [VENTA].[pedidosdeta]
   for insert,update 
   as
   DECLARE @ppro DECIMAL, @pped DECIMAL
    select @ppro=p.preciounidad,@pped=i.preciounidad  
	from COMPRA.PRODUCTOS as P inner join
   inserted as i on i.idproducto=P.idproducto
   PRINT @pped
   PRINT @ppro
 if @pped<@ppro 
  BEGIN
  ROLLBACK TRANSACTION
  PRINT 'EL precio PRODUCTO no FUE cambiabo EN LA BASE DE DATOS'
END
ELSE
   PRINT 'EL precio PRODUCTO FUE cambiabo EN LA BASE DE DATOS'
/*update [VENTA].[pedidosdeta]
set preciounidad = 1
where idpedido =2
go*/