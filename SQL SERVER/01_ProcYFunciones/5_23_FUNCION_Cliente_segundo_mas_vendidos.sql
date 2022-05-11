USE negocios2011
GO
alter FUNCTION dbo.clientes2masvendidos()
RETURNS CHAR(5)
AS
BEGIN
declare @IDCli1 CHAR(5)
declare @IDCli2 CHAR(5)
declare @total decimal(10,2)


SELECT TOP 1 @IDCli1=pc.idcliente,@total=sum(pd.cantidad*pd.preciounidad)
FROM VENTA.PEDIDOSCABE pc 
JOIN dbo.pedidosdeta pd ON pd.idpedido = pc.idpedido
group by pc.idcliente 
ORDER BY 2 DESC

SELECT TOP 1 @IDCli2=pc.idcliente,@total=sum(pd.cantidad*pd.preciounidad)
FROM VENTA.PEDIDOSCABE pc 
JOIN dbo.pedidosdeta pd ON pd.idpedido = pc.idpedido
where pc.idcliente<>@idcli1
group by pc.idcliente 
ORDER BY 2 DESC

RETURN @IDCli2

END
GO
SELECT dbo.clientes2masvendidos()
GO
