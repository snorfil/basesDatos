USE negocios2011
GO

create FUNCTION dbo.ultimopedidoanio(@ANIO INT)
RETURNS TABLE
AS
RETURN SELECT TOP 1  c.idcliente, c.nombrecia
fromVENTA.clientes c join VENTA.pedidoscabe VP 
on c.idcliente = vp.idcliente
WHERE YEAR(vp.fechapedido) = @ANIO
ORDER BY vp.fechapedido DESC
GO

SELECT * FROM dbo.ultimopedidoanio(2017)
GO


---------------------------------------------------------------------------
