alter PROCEDURE USP_AGREGAPEDIDO
@IDPED INT,
@IDCLI VARCHAR(5),
@IDEMP INT,
@FECPED DATETIME,
@IDPROD INT,
@PRE DECIMAL,
@CANT INT,
@SALIDA varchar(100) output
AS
declare @exis as decimal(10,2)
BEGIN TRAN TPEDIDO
SET @SALIDA='' 
BEGIN TRY
INSERT INTO
VENTA.PEDIDOSCABE(IDPEDIDO, IDCLIENTE, IDEMPLEADO, FECHAPEDIDO,destinatario,dirdestinatario,fechaentrega ,fechaenvio,enviopedido     )
VALUES(@IDPED, @IDCLI, @IDEMP, @FECPED,'WEFWE','DIRDES','','','')

INSERT INTO dbo.PEDIDOSDETA(IDPEDIDO, IDPRODUCTO, PRECIOUNIDAD, CANTIDAD, DESCUENTO)
VALUES(@IDPED, @IDPROD, @PRE, @CANT, 0)
	
	select @exis= UNIdadesENEXISTENCIA from COMPRA.productos
	where  IDPRODUCTO = @IDPROD
	iF (@exis - @CANT) >= 0
	BEGIN
		UPDATE COMPRA.PRODUCTOS SET UNIdadesENEXISTENCIA -=@CANT  
		WHERE IDPRODUCTO = @IDPROD
	END
    ELSE
    BEGIN
		raiserror('No Hay Existencia',16,1)
	END	
COMMIT TRAN TPEDIDO
END TRY
BEGIN CATCH
SET @SALIDA=ERROR_MESSAGE()
ROLLBACK TRAN TPEDIDO
END CATCH
GO

DECLARE @SALIDA VARCHAR(100)
exec USP_AGREGAPEDIDO
@IDPED = 251,
@IDCLI ='NCBCK',
@IDEMP = 1,
@FECPED ='01-01-2014',
@IDPROD = 1,
@PRE = 10.2,
@CANT= 1,
@SALIDA =@SALIDA output

IF @SALIDA='' 
	PRINT 'PEDIDO REGISTRADO'
ELSE
BEGIN	
SELECT @SALIDA
PRINT 'PEDIDO NO REGISTRADO'
END
go


