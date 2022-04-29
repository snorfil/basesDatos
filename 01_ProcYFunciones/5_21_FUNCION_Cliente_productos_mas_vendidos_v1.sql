USE negocios2011
GO
create FUNCTION dbo.clientesmasvendidos(@IDemp int)
RETURNS @T TABLE (IDCli CHAR(5),Nomcli VARCHAR(30) ,Importe decimal(10,2))
AS
BEGIN
declare @T2 TABLE TABLE (IDCli CHAR(5),Nomcli VARCHAR(30) ,Importe decimal(10,2))
insert into @T2 
SELECT TOP 5 c.idcliente,c.nombrecia,
,sum(pd.cantidad*pd.precio)
FROM venta.clientes c JOIN dbo.PEDIDOSCABE pc 
ON c.idcliente = pc.idcliente
JOIN VENTA.pedidosdeta pd ON pd.idpedido = pc.idpedido
WHERE pc.idempeado = @IDemp
group by c.idcliente ,c.nombrecia
ORDER BY 3 DESC

insert into @T 
SELECT * FROM @T2 ORDER BY Nomcli

RETURN

END
GO
SELECT * FROM dbo.clientesmasvendidos(1)
GO
