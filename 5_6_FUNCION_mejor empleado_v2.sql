/*5.6  Empleado que más pedidos hace un mes de un año determinado.*/
USE negocios2011
GO
create function emplemes(
@year int,
@mes int)
returns varchar(50)
begin
declare @ret varchar (50) ='ninguno'
if exists(select idpedido from VENTA.pedidoscabe
		where YEAR(fechapedido) = @year and MONTH(fechapedido) = @mes		)
begin
	set @ret = (
		select top 1 COUNT(idpedido)
			from VENTA.pedidoscabe
			where YEAR(fechapedido) = @year
				and MONTH(fechapedido) = @mes
			group by idempleado)
end
return @ret
end
go
select dbo.emplemes (2012,9)