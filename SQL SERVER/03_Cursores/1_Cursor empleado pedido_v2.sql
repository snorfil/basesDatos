USE negocios2011
GO
DECLARE @E VARCHAR, @EAnt VARCHAR, @PEDIDO INT, @Importe DECIMAL, @TOTAL_empleado DECIMAL
DECLARE MI_CURSOR CURSOR FOR
SELECT e.nomempleado, pc.idpedido, SUM(pd.preciounidad * pd.cantidad)
FROM rrhh.empleados e, venta.pedidoscabe pc, PEDIDOSDETA pd
WHERE e.idempleado = pc.idempleado AND pc.idpedido = pd.idpedido
GROUP BY e.nomempleado, pc.idpedido
ORDER BY 1,2
OPEN MI_CURSOR
PRINT 'Totales de pedidos por Empleado: '
FETCH MI_CURSOR INTO @E, @PEDIDO, @Importe
WHILE @@FETCH_STATUS=0
BEGIN
  SET @EAnt = @E
  PRINT 'Empleado: ' + CAST(@EAnt AS VARCHAR)
  SET @TOTAL_empleado = 0
  WHILE @E = @EAnt and @@FETCH_STATUS=0
  BEGIN 
	SET @TOTAL_empleado += @Importe
	PRINT CAST(@PEDIDO AS VARCHAR) + SPACE(5)+STR(@Importe)
	FETCH MI_CURSOR INTO @E, @PEDIDO, @Importe
  END
  PRINT 'IMPORTE EN: ' +CAST(@EAnt AS VARCHAR) +
  SPACE(2)+ 'ES ' +CAST(@TOTAL_empleado AS VARCHAR)
END 
CLOSE MI_CURSOR
DEALLOCATE MI_CURSOR;


