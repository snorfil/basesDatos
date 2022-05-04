--Cursores--
--B1
CREATE PROCEDURE apefech 
AS
-- Primero declaro las variables necesarias-
DECLARE @apellido VARCHAR(50), @fecha DATETIME
--Declaro el cursor
DECLARE MI_CURSOR CURSOR FOR
	SELECT apeempleado, feccontrata FROM RRHH.empleados ORDER BY 1
--Abro el cursor
OPEN MI_CURSOR
--Coloco el cursor en el primer registro
FETCH FROM MI_CURSOR INTO @apellido, @fecha
WHILE @@FETCH_STATUS=0
	BEGIN
	--Imprimo los valores del registro
		PRINT @apellido + ','+CAST(@fecha AS VARCHAR)
	--Paso el cursor al siguiente registro
		FETCH MI_CURSOR INTO @apellido, @fecha
	END
	CLOSE MY_CURSOR
    --Liberamos el cursor para poder ejecutar este procedimiento mas de una vez sin errores.--
	DEALLOCATE MI_CURSOR
GO

EXEC apefech

--02
CREATE PROCEDURE apesueld
AS
DECLARE @apellido VARCHAR(50), @salario INT, @total INT
DECLARE MY_CURSOR CURSOR FOR
	SELECT apeempleado, salario FROM RRHH.empleados
	OPEN MY_CURSOR
	FETCH FROM MY_CURSOR INTO @apellido, @salario
@total=0
WHILE @@FETCH_STATUS=0
	BEGIN
	PRINT @apellido + ','+CAST(@salario AS VARCHAR)
	@total+=salario
	FETCH MY_CURSOR INTO @apellido, @salario
	END
	PRINT 'El total es '+CAST(@total AS VARCHAR)
	CLOSE MY_CURSOR
	DEALLOCATE MY_CURSOR

GO

EXEC apesueld

--03
CREATE PROCEDURE apenum
@cadena VARCHAR(30)
AS
DECLARE @apellido VARCHAR(40),@idempleado INT,@total INT
	DECLARE CURSORSITO CURSOR FOR
	SELECT apeempleado, idempleado FROM RRHH.empleados
	WHERE apeempleado LIKE '%' + @cadena + '%'
	OPEN CURSORSITO
	@total=0
	FETCH FROM CURSORSITO INTO @apellido,@idempleado
	WHILE @@FETCH_STATUS=0
		BEGIN
		PRINT @apellido + ','+CAST(@idempleado AS VARCHAR)
		@total+=1
		FETCH CURSORSITO INTO @apellido,@idempleado
		END
		PRINT 'El total listado es de '+CAST(@total AS VARCHAR)
		CLOSE CURSORSITO
		DEALLOCATE CURSORSITO

GO

EXEC apenum 
@cadena = 'ez'

--04
CREATE PROCEDURE richmans
AS
DECLARE @nomemp VARCHAR(40), @salario INT, @medio INT = 0, @total INT = 0, @numemp INT = 0
	DECLARE EUSKOKURSOR CURSOR FOR
	SELECT nomempleado, salario FROM RRHH.empleados
	OPEN EUSKOKURSOR
	@total = 0
	@numemp = 0
	FETCH FROM EUSKOKURSOR INTO @nomemp,@salario
	WHILE @@FETCH_STATUS=0
		BEGIN
		 IF (@salario > 2000)
		   BEGIN 
			PRINT 'Nombre: ' + @nomemp + ' Salario: ' +CAST(@salario AS VARCHAR)
			SET @total += @salario
			SET @numemp += 1
		 END 	
		FETCH EUSKOKURSOR INTO @nomemp,@salario
		END
		SET @medio = @total / @numemp
		PRINT 'El total del salario de los empleados mostrados es: ' +CAST(@total AS VARCHAR)
		PRINT 'El total de empleados mostrados es: ' + CAST(@numemp AS VARCHAR)
		PRINT 'La media del salario de los empleados mostrados es: ' + CAST(@medio AS VARCHAR) 
		CLOSE EUSKOKURSOR
		DEALLOCATE EUSKOKURSOR
GO

EXEC richmans
