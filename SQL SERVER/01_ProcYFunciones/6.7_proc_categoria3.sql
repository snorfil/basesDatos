USE negocios2011
GO
create PROCEDURE categoriamasventa
@año int,
@categ varchar(10)output,
@categ2 varchar(10)output,
@categ3 varchar(10)output
as
select top 1 @categ=categorias.nomcategoria
from VENTA.pedidoscabe
join pedidosdeta on pedidoscabe.idpedido=pedidosdeta.idpedido
join COMPRA.productos on productos.idproducto=pedidosdeta.idproducto
join COMPRA.categorias on categorias.idcategoria=productos.idcategoria 
where year(pedidoscabe.fechapedido)=@año
group by categorias.nomcategoria
order by sum(pedidosdeta.preciounidad*pedidosdeta.cantidad)
desc

select top 1 @categ2=categorias.nomcategoria
from VENTA.pedidoscabe join pedidosdeta on pedidoscabe.idpedido=pedidosdeta.idpedido
join COMPRA.productos on productos.idproducto=pedidosdeta.idproducto
join COMPRA.categorias on categorias.idcategoria=productos.idcategoria 
where year(pedidoscabe.fechapedido)=@año
group by categorias.nomcategoria
having categorias.nomcategoria<> @categ 
order by sum(pedidosdeta.preciounidad*pedidosdeta.cantidad)desc

select top 1 @categ3=categorias.nomcategoria
from VENTA.pedidoscabe join pedidosdeta on pedidoscabe.idpedido=pedidosdeta.idpedido
join COMPRA.productos on productos.idproducto=pedidosdeta.idproducto
join COMPRA.categorias on categorias.idcategoria=productos.idcategoria 
where year(pedidoscabe.fechapedido)=@año
group by categorias.nomcategoria
having categorias.nomcategoria<> @categ and categorias.nomcategoria<> @categ2 
order by sum(pedidosdeta.preciounidad*pedidosdeta.cantidad)desc


go




declare @categ varchar(10),@categ2 varchar(10),@categ3 varchar(10)
exec categoriamasventa
@año=2012,
@categ=@categ output,
@categ2=@categ2 output,
@categ3=@categ3 output

select @categ,@categ2,@categ3
go
