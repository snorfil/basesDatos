use negocios2011 
DECLARE @IDPROD INT, @TOTAL AS DECIMAL(10,2),@TOTAL2 AS DECIMAL(10,2)
DECLARE @MEDIO AS DECIMAL(10,2),@precio AS DECIMAL(10,2)

SET @IDPROD = 1

SELECT @TOTAL = SUM(PD.PRECIOUNIDAD*PD.CANTIDAD),
	@TOTAL2 = SUM(PD.CANTIDAD) 
FROM dbo.PEDIDOSDETA PD 
WHERE idproducto = @IDPROD
set @medio=@total/@total2

SELECT @precio = preciounidad 
FROM COMPRA.productos 
WHERE idproducto = @IDPROD

select @medio , @precio -- para verlos

IF @medio > @precio
BEGIN
UPDATE COMPRA.productos  
SET preciounidad = @MEDIO 
WHERE idproducto = @IDPROD
select 'Mayor' ,@medio - @precio
END
ELSE IF @medio = @precio
select 'Iguales'
ELSE
select 'Menor' ,@medio - @precio
GO