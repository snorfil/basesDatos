
use negocios2011
DECLARE @CARGO INT, @SALARIO_MEDIO AS DECIMAL(10,2),@CUENTA AS INT
DECLARE @EMPLE AS INT,@SALARIO AS DECIMAL(10,2)
SET @EMPLE = 1
BEGIN TRY 
SELECT @CARGO = EM.idcargo 	
FROM rrhh.empleados EM 
WHERE EM.idempleado  = @EMPLE

SELECT @SALARIO_MEDIO = avg(EM.SALARIO)		
FROM rrhh.empleados EM 
WHERE EM.idcargo  = @CARGO

SELECT @SALARIO = EM.SALARIO
FROM rrhh.empleados EM 
WHERE EM.idempleado  = @EMPLE

IF @SALARIO < @SALARIO_MEDIO
BEGIN
UPDATE rrhh.empleados  
SET SALARIO = @SALARIO_MEDIO 
WHERE idempleado  = @EMPLE
select 'MENOR'
END

ELSE IF  @SALARIO = @SALARIO_MEDIO
BEGIN
select 'Iguales'
END
ELSE
begin
select 'MAYOR' ,@SALARIO - @SALARIO_MEDIO
end
select @CARGO, @SALARIO_MEDIO,@SALARIO
END TRY
BEGIN CATCH
select 'ERROR'
END CATCH



GO