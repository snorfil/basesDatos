/* 3 Al insertar un producto, si unidades en existencia recibido es 0, poner 1.*/
-- otra forma 
use negocios2011
go
 ALTER TRIGGER COMPRA.TXINSERTARPRO
ON COMPRA.PRODUCTOS
INSTEAD OF INSERT,update
AS 
select * into #T from inserted
IF (SELECT unidadesenexistencia FROM inserted) = 0
begin
--Inserted no deja modificar
 update #T set unidadesenexistencia=1
 end
 INSERT INTO COMPRA.productos SELECT * FROM  #T

