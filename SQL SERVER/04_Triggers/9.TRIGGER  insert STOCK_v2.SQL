ALTER TRIGGER [VENTA].[TX_ACTUALIZA_STOCK]
ON [VENTA].[pedidosdeta]
FOR INSERT
AS
DECLARE @CantPedido DECIMAL
SELECT @CantPedido=cantidad FROM INSERTED
UPDATE COMPRA.PRODUCTOS
SET unidadesenexistencia = unidadesenexistencia -
@CantPedido 
WHERE PRODUCTOS.idproducto =
 (SELECT idproducto FROM INSERTED)
GO

SELECT * FROM dbo.pedidosdeta
INSERT INTO dbo.pedidosdeta VALUES (333,89,105,10,1.12)