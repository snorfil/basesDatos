USE [negocios2011]
GO
ALTER FUNCTION [dbo].TOTALVENTASCLIENTE(@CLI CHAR(5)) RETURNS DECIMAL(10,2)
BEGIN
DECLARE  @TOTAL AS DECIMAL(10,2)

SELECT @TOTAL = SUM(PRECIOUNIDAD*CANTIDAD*(1-descuento/100)
FROM dbo.PEDIDOSDETA PD JOIN VENTA.PEDIDOSCABE PC
ON PD.IDPEDIDO = PC.IDPEDIDO
WHERE PC.idcliente  = @CLI
RETURN @TOTAL
END

GO
SELECT DBO.TOTALVENTASCLIENTE('NCBCK')