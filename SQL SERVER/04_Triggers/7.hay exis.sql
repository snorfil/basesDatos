use negocios2011 
go
select * from COMPRA.productos
 go
create trigger [Existe_Stock]
   on venta.[pedidosdeta]
   for insert,update
   as
declare @exis as int
declare @cant as int,@cant_Anterior as int
declare @IDPROD as integer
select @exis= UNIdadesENEXISTENCIA from COMPRA.productos
where  IDPRODUCTO = (select idproducto from inserted)
select @cant= cantidad, @IDPROD=IDPRODUCTO from inserted
if exists (select * from deleted) 
	select @cant_Anterior= cantidad from deleted
else
	set @cant_Anterior= 0
set @cant=@cant-@cant_Anterior

iF (@exis < @CANT) 
	    BEGIN
		raiserror('No Hay Existencia',16,1)
		rollback transaction
	END	
GO
