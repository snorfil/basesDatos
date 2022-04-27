use negocios2011
go
USE negocios2011
GO
alter FUNCTION dbo.productosmasvendidosbien2(@IDCLI char(5))
RETURNS TABLE as RETURN
select top 5 *  from 
(SELECT TOP 5 pro.idproducto AS ID_Producto,
 pro.nombreproducto AS Nombre
,sum(pedd.cantidad) as cantidad
FROM COMPRA.productos pro
JOIN dbo.PEDIDOSDETA pedd ON pro.idproducto = pedd.idproducto
JOIN VENTA.pedidoscabe pedc ON pedd.idpedido = pedc.idpedido
WHERE pedc.idcliente = @IDCLI
group by pro.idproducto ,pro.nombreproducto
ORDER BY sum(pedd.cantidad) DESC) as select2
order by nombre 

GO
SELECT * FROM dbo.productosmasvendidosbien2('NCBCK')
GO