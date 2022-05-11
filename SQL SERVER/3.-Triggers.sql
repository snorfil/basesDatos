/* 3 Al insertar un producto, si unidades en existencia recibido es 0, poner 1.*/

CREATE TRIGGER controludexistencia2
on COMPRA.productos
for INSERT
AS
if (select unidadesenexistencia from inserted)=0
begin
UPDATE COMPRA.productos SET unidadesenexistencia = 1
where idproducto = (select idproducto from inserted)

print 'INSERTADOS DATOS MODIFICADOS'
END
ELSE
PRINT 'INSERTADOS DATOS INTEGROS'

