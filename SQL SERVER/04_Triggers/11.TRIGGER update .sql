alter trigger [Actualizar_Stock]
   on dbo.[pedidosdeta]
   for update 
   as
   UPDATE COMPRA.productos 
   SET unidadesenexistencia=unidadesenexistencia+deleted.cantidad 
   FROM COMPRA.productos INNER JOIN deleted 
   ON COMPRA.productos.idproducto=deleted.idproducto
      
   UPDATE COMPRA.productos 
   SET unidadesenexistencia=unidadesenexistencia-inserted.cantidad 
   FROM COMPRA.productos 
   INNER JOIN inserted 
   ON COMPRA.productos.idproducto=inserted.idproducto
   