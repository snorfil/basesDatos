/*5.11 Funcion que devuelva el id y nombre de los tres paises que mas cantidad compran de un determinado producto . Ordenado por nombre país.* jueves*/
drop function dbo.paisestop 
create function dbo.paisestop (@producto int)
returns @tabla table (ID char(5), Nombre varchar(80), Cantidad decimal(10,2))
as
begin
	declare @tabla2 table (ID char(5), Nombre varchar(80), Cantidad decimal(10,2))
	
	insert into @tabla2
	select top 3 p.idpais, p.NOMBREPAIS, sum(pd.cantidad)
	from VENTA.paises p 
	inner join VENTA.clientes c on c.idpais=p.idpais
	inner join VENTA.pedidoscabe pc on pc.idcliente=c.idcliente
	inner join dbo.PEDIDOSDETA pd on pd.idpedido=pc.idpedido
	where pd.idproducto=@producto
	group by p.idpais, p.NOMBREPAIS
	order by sum(pd.cantidad) desc

	insert into @tabla
	select *
	from @tabla2
	order by Nombre
	return
end
go

select * from dbo.paisestop (1)