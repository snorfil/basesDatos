/*5.6  Empleado que más pedidos hace un mes de un año determinado.*/
USE negocios2011
GO
create FUNCTION mejorempleado
(@mes datetime, @ano datetime)
RETURNS varchar (50)
BEGIN
	DECLARE @nomempleado varchar(50)
	DECLARE @total int
	SELECT top 1 @nomempleado=e.nomempleado, @total=COUNT(*)
		FROM rrhh.empleados e
		INNER JOIN VENTA.pedidoscabe p
		ON e.idempleado=p.idempleado
		WHERE @mes=MONTH(p.fechapedido)
		AND @ano=YEAR(p.fechapedido)
		GROUP BY e.nomempleado
		ORDER BY 2 DESC
	RETURN @nomempleado
END
go
select dbo.mejorempleado (9,2017)