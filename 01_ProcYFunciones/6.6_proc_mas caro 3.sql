USE negocios2011
GO
create PROCEDURE prodcaros3
@produc int output,
@produc2 int output,
@produc3 int output
as
select top 1 @produc=idproducto
from COMPRA.productos 
order by preciounidad desc

select top 1 @produc2=idproducto
from COMPRA.productos 
where  idproducto<> @produc 
order by preciounidad desc

select top 1 @produc3=idproducto
from COMPRA.productos 
where  idproducto<> @produc 
and  idproducto<> @produc2 
order by preciounidad desc

go

declare @produc int,@produc2 int,@produc3 int
exec prodcaros3
@produc=@produc output,
@produc2=@produc2 output,
@produc3=@produc3 output

select @produc,@produc2,@produc3
go
