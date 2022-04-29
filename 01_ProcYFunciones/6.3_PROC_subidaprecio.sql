/*6.3 Suba en un determinado porcentaje el precio a una categoría determinada.*/

create PROCEDURE USP_AUMENTOPRECIO
@IDCAT INT,
@PORCEN decimal (5,2)
AS
UPDATE COMPRA.productos 
SET preciounidad = preciounidad * (1 + (@PORCEN / 100.00))
WHERE idcategoria = @IDCAT
GO

EXEC dbo.USP_AUMENTOPRECIO
@IDCAT = 17,
@PORCEN = 10
go 
select * from COMPRA.productos where idcategoria= 17
go




