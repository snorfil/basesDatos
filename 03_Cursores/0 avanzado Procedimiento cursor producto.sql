alter PROCEDURE USP_REPORTEPEDIDOSXPRODUCTOXPROVEEDOR 
@PROV INT=1 ,
@TOTAL DECIMAL OUTPUT
AS 
-- DECLARACI�N DE VARIABLES DE TRABAJO 
DECLARE @PROD INT, @PRODANT INT, @PEDIDO INT, @CANTI DECIMAL, @TOTALPRO DECIMAL 
-- DECLARACI�N DEL CURSOR 
DECLARE MI_CURSOR CURSOR FOR
--La select
SELECT PD.idproducto as producto,Pd.IDPEDIDO as pedido,CANTIDAD  
FROM VENTAS .PEDIDOSDETA PD
JOIN COMPRAS .productos PR
ON PD.idproducto =PR.idproducto  
WHERE PR.idproveedor = @PROV
ORDER BY PD.idproducto ,PD.idpedido 
-- APERTURA DEL CURSOR 
OPEN MI_CURSOR 
-- LECTURA DEL PRIMER REGISTRO 
SET @TOTAL=0
FETCH MI_CURSOR INTO @PROD , @PEDIDO , @CANTI  
WHILE @@FETCH_STATUS=0 
	BEGIN 
	---empieza un Producto
	-- Guardamos el Producto que tenemos
	SET @PRODANT = @PROD 
	-- IMPRIMIR EL PRIMER Producto 
	PRINT 'Producto:' + CAST(@PROD AS VARCHAR) 
	SET @TOTALPRO=0
	-- RECORRER EL CURSOS MIENTRAS HAYAN REGISTROS 
	WHILE(@PROD = @PRODANT and @@FETCH_STATUS=0 )
	BEGIN 
		-- ACUMULAR 
		SET @TOTALPRO += @CANTI 
		-- IMPRIMIR EL REGISTRO 
		PRINT CAST(@PEDIDO AS VARCHAR) + SPACE(5)+ CAST(@CANTI AS VARCHAR)
		-- LECTURA DEL SIGUIENTE REGISTRO 
		FETCH MI_CURSOR INTO @PROD, @PEDIDO, @CANTI 
	END 
	---Termina el Producto
	PRINT 'Producto:' + CAST(@PRODANT AS VARCHAR) + SPACE(2)+ 'Suma Cantidad: ' + CAST(@TOTALPRO AS VARCHAR)
	--Acumulo total final
	SET @TOTAL += @TOTALPRO
	--- Aqui termina el fichero
END 
--Totales Finales
PRINT  'Suma Total: ' + CAST(@TOTAL AS VARCHAR)

-- CERRAR EL CURSOR 
CLOSE MI_CURSOR 
-- LIBERAR EL RECURSO 
DEALLOCATE MI_CURSOR; 
GO
DECLARE @Q DECIMAL
exec USP_REPORTEPEDIDOSXPRODUCTOXPROVEEDOR 
2,@Q OUTPUT

select 'TOTAL CANTIDAD DE PEDIDOS :' + STR(@Q)
go