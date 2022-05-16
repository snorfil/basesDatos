/*2 Al borrar un pais comprobar que no tiene ningun cliente asignado*/

CREATE TRIGGER controlborrapais
on dbo.paises
for DELETE
AS
IF EXISTS (SELECT C.IDCLIENTE FROM venta.clientes C
WHERE C.idpais= (SELECT idpais FROM deleted))
BEGIN
ROLLBACK TRANSACTION
PRINT 'EL PAIS ESTÁ ASOCIADO Aventa.clientes Y NO SE PUEDE BORRAR'
END
ELSE
PRINT 'EL PAIS HA SIDO BORRADO CON ÉXITO'

