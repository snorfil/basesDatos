alter trigger [Actualizar_Stock]
   on dbo.[pedidosdeta]
   for insert,update,delete 
   as
   Update COMPRA.PRODUCTOS 
   set unidadesenexistencia =unidadesenexistencia-D.cantidad
   from COMPRA.PRODUCTOS as P inner join  inserted as D 
   on D.idproducto=P.idproducto
   
   Update COMPRA.PRODUCTOS 
   set P.unidadesenexistencia=P.unidadesenexistencia+D.cantidad
   from COMPRA.PRODUCTOS as P inner join deleted as D 
   on D.idproducto=P.idproducto  
   -----------------------
   go
select * from COMPRA.productos  
  go
 update [pedidosdeta]
set cantidad = 3
where idpedido =92 and idproducto = 89 
go
select * from COMPRA.productos  
go
