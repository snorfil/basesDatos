alter trigger [Actualizar_Stock]
   on dbo.[pedidosdeta]
   for delete 
   as
   UPDATE COMPRA.productos 
   SET unidadesenexistencia=unidadesenexistencia+deleted.cantidad 
	FROM COMPRA.productos INNER JOIN deleted 
	ON COMPRA.productos.idproducto=deleted.idproducto
    
