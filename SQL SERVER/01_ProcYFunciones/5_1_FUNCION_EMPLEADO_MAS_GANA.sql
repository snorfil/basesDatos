use negocios2011
GO
alter FUNCTION [dbo].[empleadomasgana](@CARGO INT)
 RETURNS INT
AS
BEGIN

DECLARE  @TOTAL  DECIMAL(10,2)
DECLARE  @EMPLE  INT

SELECT @TOTAL = MAX(EM.SALARIO)
FROM rrhh.empleados EM 
WHERE EM.idcargo  = @CARGO

SELECT @EMPLE = EM.idempleado 
FROM rrhh.empleados EM 
WHERE EM.Salario  = @TOTAL
AND EM.idcargo  = @CARGO

RETURN @EMPLE
END
GO
SELECT DBO.empleadomasgana(49)
