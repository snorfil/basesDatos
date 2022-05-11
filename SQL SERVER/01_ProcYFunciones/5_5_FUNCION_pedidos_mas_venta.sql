use negocios2011
go
alter FUNCTION DBO.PEDIDOMAXVENTA() RETURNS INT

BEGIN
DECLARE @PEDIDO INT
DECLARE @TOTAL DECIMAL(10,2)

SELECT  top 1 @PEDIDO = PD.IDPEDIDO, @TOTAL = SUM(PD.PRECIOUNIDAD*PD.CANTIDAD) 
FROM dbo.PEDIDOSDETA PD
GROUP BY pd.IDPEDIDO
ORDER BY 2 desc


RETURN @PEDIDO
END
GO

SELECT DBO.PEDIDOMAXVENTA()
