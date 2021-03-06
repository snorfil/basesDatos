USE [negocios2011]
GO
create FUNCTION PRODUCTOMASCAROCATEGORIA(@CATEGORIA INT) RETURNS VARCHAR(80)
AS
BEGIN

DECLARE  @TOTAL AS DECIMAL(10,2)
DECLARE  @PRODUCTO AS VARCHAR(80)

SELECT @TOTAL = MAX(PR.PRECIOUNIDAD)
FROM COMPRA.PRODUCTOS PR 
WHERE PR.idcategoria  = @CATEGORIA

SELECT TOP 1 @PRODUCTO = PR.nombreproducto 
FROM COMPRA.PRODUCTOS PR 
WHERE PR.PRECIOUNIDAD  = @TOTAL
AND PR.idcategoria  = @CATEGORIA

RETURN @PRODUCTO
END
GO
SELECT DBO.PRODUCTOMASCAROCATEGORIA(46)