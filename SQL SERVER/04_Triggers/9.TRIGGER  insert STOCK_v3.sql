/*
9.- Al insertar en pedidosdeta disminuir existencias en productos.
*/

CREATE TRIGGER restarExistencias ON pedidosdeta FOR INSERT

AS

DECLARE @unidadesDisponibles INT
DECLARE @unidadesVendidas INT

SET @unidadesDisponibles = (SELECT unidadesenexistencia FROM COMPRA.productos WHERE idproducto IN (SELECT idproducto FROM inserted))
SET @unidadesVendidas = (SELECT cantidad FROM inserted)

IF @unidadesDisponibles >= @unidadesVendidas 
	BEGIN
		UPDATE COMPRA.productos SET unidadesenexistencia=unidadesenexistencia-inserted.cantidad 
		FROM COMPRA.productos INNER JOIN inserted ON COMPRA.productos.idproducto=inserted.idproducto
	END
ELSE
	ROLLBACK TRANSACTION
	RAISERROR('No hay existencias suficientes',16,1)

GO


