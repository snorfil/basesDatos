-- la peor acumula dos veces
alter function VENTA.productos1(@CLI varchar(5))returns table
as
return(
select top 5 productos.idproducto, nombreproducto,
 sum(cantidad) as cantidad 
from COMPRA.productos, dbo.PEDIDOSDETA
where productos.idproducto=pedidosdeta.idproducto 
and pedidosdeta.idproducto in
  (select top 5 idproducto  
  from VENTA.clientes, dbo.PEDIDOSDETA, VENTA.pedidoscabe 
  where clientes.idcliente=pedidoscabe.idcliente 
  and pedidosdeta.idpedido=pedidoscabe.idempleado 
  and pedidoscabe.idcliente=@CLI
  group by pedidosdeta.idproducto
  order by sum(cantidad) desc)  
group by COMPRA.productos.idproducto,nombreproducto 
order by productos.nombreproducto asc)
go
select * from VENTA.productos1('HGWIK')