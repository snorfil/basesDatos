ALTER TRIGGER [VENTA].[TX_ACTUALIZA_STOCK]
ON [VENTA].[pedidosdeta]
FOR INSERT
AS
UPDATE COMPRA.PRODUCTOS
SET unidadesenexistencia = unidadesenexistencia -
(SELECT cantidad FROM INSERTED 
WHERE PRODUCTOS.idproducto = 
(SELECT idproducto FROM INSERTED))
--otra version
--UPDATE PRODUCTOS
--SET unidadesenexistencia = unidadesenexistencia - i.cantidad
--from PRODUCTOS cp  join INSERTED i
--on PRODUCTOS.idproducto = i.idproducto

GO
--prueba
INSERT INTO VENTA.pedidoscabe VALUES (30,'HGWIK',1,'2015-01.01 00:00:00.000','2015-01.01 00:00:00.000','2015-01.01 00:00:00.000',' ','WEFWE','DIRDES');
