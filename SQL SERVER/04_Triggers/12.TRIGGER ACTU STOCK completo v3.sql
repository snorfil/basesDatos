
--10 Con cada movimiento en pedidos deta actualizar  existencias en productos.
CREATE TRIGGER T_Ej10
ON dbo.pedidosdeta
FOR INSERT,UPDATE,DELETE
AS

DECLARE @cantidadI int,
		@cantidadD int,
		@cantidadDisp int,
		@idproductoI int,
		@idproductoD int,
		@cantupdate int,
		@I int,
		@D int

SELECT @I = Count(*) FROM INSERTED
SELECT @D = Count(*) FROM DELETED
SELECT @cantidadD = cantidad FROM DELETED
SELECT @cantidadI = cantidad FROM INSERTED
SELECT @idproductoI = idproducto FROM INSERTED
SELECT @idproductoD = idproducto FROM DELETED
SELECT @cantidadDisp = unidadesenexistencia FROM COMPRA.productos WHERE idproducto = @idproductoI


IF (@I > 0) AND (@D > 0)
	BEGIN
		SET @cantupdate = @cantidadI - @cantidadD
			IF ((@cantidadDisp - @cantupdate) >= 0)
				BEGIN  
					UPDATE COMPRA.productos SET unidadesenexistencia = (unidadesenexistencia - @cantupdate) WHERE idproducto = @idproductoI
					PRINT 'El pedido ha sido ACTUALIZADO y las unidades actualizadas'
				END
			ELSE
				BEGIN
					ROLLBACK TRANSACTION
					PRINT 'No hay suficientes unidades en Stock'
				END
	END

ELSE IF (@I > 0) AND (@D = 0)
IF (@cantidadI <= @cantidadDisp)
	BEGIN
		UPDATE COMPRA.productos SET unidadesenexistencia = (unidadesenexistencia - @cantidadI) WHERE idproducto = @idproductoI
		PRINT 'Pedido añadido correctamente'
	END
ELSE
	BEGIN
		ROLLBACK TRANSACTION
		PRINT 'No hay suficientes unidades en Stock'
	END

ELSE IF (@I = 0) AND (@D > 0)
		UPDATE COMPRA.productos SET unidadesenexistencia = (unidadesenexistencia + @cantidadD) WHERE idproducto = @idproductoD
----------------	
	
	GO


SELECT * FROM dbo.pedidosdeta
INSERT INTO dbo.pedidosdeta VALUES (333,89,105,10,1.12)
DELETE FROM VENTA.pedidoscabe WHERE idpedido = 30