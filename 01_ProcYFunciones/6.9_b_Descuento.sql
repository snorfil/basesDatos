/* ALTER TABLE VENTA.clientes ADD descuento DECIMAL(5,2) NULL;
	NO LO UTILIZAREMOS PUESTO QUE LA COLUMNA DESCUENTO YA EXISTE*/

create PROCEDURE Descuento
@idcliente char(5)
AS
DECLARE @cantidadcliente int
SELECT @cantidadcliente= SUM(preciounidad*cantidad)
FROM dbo.PEDIDOSDETA p INNER JOIN VENTA.pedidoscabe vp
ON p.idpedido=vp.idpedido
WHERE vp.idcliente=@idcliente

BEGIN TRY
		IF not exists (SELECT * FROM VENTA.clientes WHERE idcliente=@idcliente)
			RAISERROR ('EL CLIENTE NO EXISTE',15,1)
		ELSE IF @cantidadcliente>1000
			UPDATE VENTA.clientes SET Descuento=10
			WHERE idcliente=@idcliente;
		ELSE IF @cantidadcliente>100
			UPDATE VENTA.clientes SET Descuento=5
			WHERE idcliente=@idcliente;
		ELSE
			UPDATE VENTA.clientes SET Descuento=0
			WHERE idcliente=@idcliente;
			
PRINT 'ACTUALIZACION REALIZADA CON EXITO'

END TRY

BEGIN CATCH
	PRINT 'NO SE PUDO REALIZAR LA ACTUALIZACION'
	PRINT ERROR_MESSAGE()
END CATCH

go

EXEC Descuento'NCBC'
select * from sys.sysmessages