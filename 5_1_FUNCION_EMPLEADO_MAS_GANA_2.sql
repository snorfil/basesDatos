use negocios2011
GO
ALTER FUNCTION [dbo].[empleadomasgana](@CARGO INT) RETURNS INT
AS
BEGIN
DECLARE  @EMPLE as int
SELECT top 1 @EMPLE = EM.idempleado
FROM rrhh.empleados EM 
WHERE EM.idcargo  = @CARGO
order by salario desc
RETURN @EMPLE
END
GO

SELECT DBO.empleadomasgana(49)
