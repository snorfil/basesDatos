/* 3 Al insertar un producto, si unidades en existencia recibido es 0, poner 1.*/
-- otra forma 

create TRIGGER TX_INSERTAR_PRODUCTO_EXISTENCIA
ON COMPRA.PRODUCTOS
INSTEAD OF INSERT
AS 
IF (SELECT unidadesenexistencia FROM inserted) = 0
BEGIN
INSERT INTO COMPRA.productos SELECT idproducto,nombreproducto,
idproveedor,idcategoria,cantxunidad,preciounidad,1,
unienpedido FROM inserted
PRINT 'SE HA INSERTADO EL PRODUCTO ACTUALIZANDO SUS UNIDADES A 1.' 
END
ELSE
BEGIN
INSERT INTO COMPRA.productos SELECT * FROM inserted
PRINT 'SE HA INSERTADO EL PRODUCTO.'
END
