use negocios2011 

DECLARE @MEDIO AS DECIMAL(10,2),@precio AS DECIMAL(10,2)

SELECT @MEDIO = avg(preciounidad)
FROM COMPRA.productos 

SELECT * 
FROM COMPRA.productos 
WHERE preciounidad> @MEDIO

select @medio 
GO