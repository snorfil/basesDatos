use negocios2011 
-- select para probar
SELECT pc.idcliente , SUM(PD.PRECIOUNIDAD*PD.CANTIDAD) 
FROM dbo.PEDIDOSDETA PD JOIN VENTA.PEDIDOSCABE PC
ON PD.IDPEDIDO = PC.IDPEDIDO
group by pc.idcliente 
--
ALTER TABLE VENTA.clientes
 ADD descuento DECIMAL(5,2) NULL;
GO	
DECLARE @COCLI VARCHAR(5), @TOTAL AS DECIMAL(10,2)
SET @COCLI = 'HGWIK'
set  @TOTAL = SELECT SUM(PD.PRECIOUNIDAD*PD.CANTIDAD) 
FROM dbo.PEDIDOSDETA PD JOIN VENTA.PEDIDOSCABE PC
ON PD.IDPEDIDO = PC.IDPEDIDO
WHERE PC.IDCLIENTE= @COCLI
IF @TOTAL > 1000.00
BEGIN
UPDATE VENTA.clientes SET Descuento = 10.00
		WHERE IDCLIENTE = @COCLI
PRINT 'Descuento 10%'
END
ELSE IF @TOTAL > 100
BEGIN
UPDATE VENTA.clientes SET Descuento = 5.00
	WHERE IDCLIENTE = @COCLI
PRINT 'Descuento 5%'
END
ELSE
begin
UPDATE VENTA.clientes SET Descuento = 0.00
	WHERE IDCLIENTE = @COCLI
PRINT 'Descuento 0%'
end
GO
