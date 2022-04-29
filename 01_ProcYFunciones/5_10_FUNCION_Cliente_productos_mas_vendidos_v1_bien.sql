USE negocios2011
GO
create FUNCTION dbo.productosmasvendidosbien(@IDCLI char(5))
RETURNS @T TABLE (IDprod CHAR(5),NOMpro VARCHAR(30) ,cant decimal(10,2))
AS
BEGIN
declare @T2 TABLE (IDprod CHAR(5),NOMpro VARCHAR(30) ,cant decimal(10,2))
insert into @T2 
SELECT TOP 5 pro.idproducto AS ID_Producto, 
pro.nombreproducto AS Nombre
,sum(pedd.cantidad) as cantidad
FROM COMPRA.productos pro
JOIN dbo.PEDIDOSDETA pedd ON pro.idproducto = pedd.idproducto
JOIN VENTA.pedidoscabe pedc ON pedd.idpedido = pedc.idpedido
WHERE pedc.idcliente = @IDCLI
group by pro.idproducto ,pro.nombreproducto
ORDER BY sum(pedd.cantidad) DESC

insert into @T 
SELECT * 
FROM @T2
ORDER BY nompro

RETURN

END
GO
SELECT * FROM dbo.productosmasvendidosbien('NCBCK')
GO
