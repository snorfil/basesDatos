alter trigger [Actualizar_Stock]
   on dbo.[pedidosdeta]
   for insert,update,delete 
   as
   declare @cant decimal 
   select @cant=cantidad from deleted
   Update COMPRA.PRODUCTOS set unidadesenexistencia
   =unidadesenexistencia+@cant
   from COMPRA.PRODUCTOS 
   where idproducto=(select idproducto from
   deleted)
   
   select @cant=cantidad from inserted
   Update COMPRA.PRODUCTOS set unidadesenexistencia
   =unidadesenexistencia-@cant
   from COMPRA.PRODUCTOS 
   where idproducto=(select idproducto from
   inserted)
    go
	
--------------
select * from COMPRA.productos  
  go
 update [pedidosdeta]
set cantidad = 3
where idpedido =92 and idproducto = 89 
go
select * from COMPRA.productos  
go
