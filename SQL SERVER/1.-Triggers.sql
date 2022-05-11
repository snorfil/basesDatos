/*Al insertar en pedidosdeta comprbar que precio sea mayor o igual que precioproducto*/

CREATE TRIGGER controlprecio
on pedidosdeta
for INSERT,update 
AS
IF (SELECT PRECIOUNIDAD FROM inserted )<
(SELECT PRECIOUNIDAD FROM COMPRA.PRODUCTOS 
where idproducto=(select idproducto from inserted ))
BEGIN
ROLLBACK TRANSACTION
PRINT 'EL PRECIO NO ES EL ADECUADO'
END
ELSE
PRINT 'EL PEDIDO FUE INGRESADO EN LA BASE DE DATOS'
