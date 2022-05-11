use negocios2011
DECLARE  @PROV VARCHAR(20),@PROV1 VARCHAR(20), @ART VARCHAR(20),@PRECIO DECIMAL, 
@PRECIOT DECIMAL, @NUMART INT, @PRECIOTM DECIMAL, @PRECIOF DECIMAL, @NUMARTF INT, 
@PRECIOFM DECIMAL, @PRECIOFMC DECIMAL

DECLARE MI_CURSOR_EJERCICIO_5 CURSOR FOR
SELECT 
pr.nomproveedor,
p.nombreproducto,
p.preciounidad
FROM  COMPRAS .productos p 
join dbo.proveedores pr ON pr.idproveedor=p.idproveedor 
ORDER BY 1,2

OPEN MI_CURSOR_EJERCICIO_5

FETCH MI_CURSOR_EJERCICIO_5 INTO @PROV,@ART,@PRECIO
SET @PRECIOF=0
SET @NUMARTF=0

WHILE @@FETCH_STATUS=0
  BEGIN
  SET @PRECIOT=0
  SET @NUMART=0
  SET @PROV1=@PROV
  PRINT'PROVEEDOR:'+@PROV1 
  PRINT 'ARTICULO'+SPACE(10)+'PRECIO'

  WHILE(@PROV1=@PROV)AND @@FETCH_STATUS=0
	BEGIN
	SET @NUMART+=1
	SET @PRECIOT+=@PRECIO
	PRINT @ART+SPACE(8)+STR(@PRECIO)
	FETCH MI_CURSOR_EJERCICIO_5 INTO @PROV,@ART,@PRECIO
  END

  SET @PRECIOTM=@PRECIOT/@NUMART
  PRINT'PRECIO MEDIO'+SPACE(8)+CAST(@PRECIOTM AS VARCHAR)
  PRINT ''
  SET @PRECIOF+=@PRECIOT 
  SET @NUMARTF+=@NUMART
  END

SET @PRECIOFM=@PRECIOF/@NUMARTF
PRINT'PRECIO MEDIO FINAL (SUMA PRECIOS/N� DE ARTICULOS):'+SPACE(3)+CAST(@PRECIOFM AS VARCHAR)
PRINT ''
CLOSE MI_CURSOR_EJERCICIO_5

DEALLOCATE MI_CURSOR_EJERCICIO_5