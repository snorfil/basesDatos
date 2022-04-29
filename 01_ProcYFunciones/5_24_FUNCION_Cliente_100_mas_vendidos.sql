USE negocios2011
GO
drop FUNCTION dbo.clientes100masvendidos
go
create FUNCTION dbo.clientes100masvendidos()
RETURNS CHAR(5)
AS
BEGIN
declare @IDCli100 CHAR(5)

declare @T2  TABLE (IDCli CHAR(5),Importe decimal(10,2))
insert into @T2

SELECT TOP 100 pc.idcliente,sum(pd.cantidad*pd.preciounidad )
FROM VENTA.PEDIDOSCABE pc 
JOIN dbo.pedidosdeta pd ON pd.idpedido = pc.idpedido
group by pc.idcliente 
ORDER BY 2 asc

SELECT TOP 1 @IDCli100=idcli
FROM @T2

RETURN @IDCli100

END
GO
SELECT  dbo.clientes100masvendidos()
GO
