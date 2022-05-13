/* 3 Al actualizar un producto, si unidades en existencia recibido es 0, poner 1.*/
-- otra forma 
use negocios2011
go
ALTER TRIGGER compra.TXINSERTARPRO
ON COMPRA.PRODUCTOS
INSTEAD OF Update
AS 
select * into #T from inserted
--Inserted no deja modificar
IF (SELECT unidadesenexistencia FROM inserted) = 0
begin
update #T set unidadesenexistencia=1
end
UPDATE [COMPRA].[productos]
   SET [idproducto] = T.idproducto
      ,[nombreproducto] = T.nombreproducto
      ,[idproveedor] = T.idproveedor
      ,[idcategoria] = T.idcategoria
      ,[cantxunidad] = T.cantxunidad
      ,[preciounidad] = T.preciounidad
      ,[unidadesenexistencia] = T.unidadesenexistencia
      ,[unienpedido] = T.unienpedido
  from [COMPRA].[productos] --cuando hay join poner from 
  inner JOIN #T AS T
 ON [COMPRA].[productos].idproducto = T.idproducto 
end
