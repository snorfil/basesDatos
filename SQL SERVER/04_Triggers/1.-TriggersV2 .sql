/*Al insertar en pedidosdeta comprbar que precio sea mayor o igual que precioproducto*/

CREATE TRIGGER controlprecio
on pedidosdeta
for INSERT
AS
IF (SELECT I.PRECIOUNIDAD FROM inserted I)<
(SELECT P.PRECIOUNIDAD FROM COMPRA.PRODUCTOS P
INNER JOIN inserted I ON I.idproducto=P.idproducto)
BEGIN
ROLLBACK TRANSACTION
PRINT 'EL PRECIO NO ES EL ADECUADO'
END
ELSE
PRINT 'EL PEDIDO FUE INGRESADO EN LA BASE DE DATOS'
