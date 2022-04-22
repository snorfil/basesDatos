create FUNCTION DBO.productosmes(@Y INT)
RETURNS TABLE
AS
-- Poner top 1000 , sino no funciona
RETURN (
SELECT top 1000 p.nombreproducto,
month(pc.fechapedido) as nmes ,DATENAME(month, pc.fechapedido) as mes,
sum(PD.PRECIOUNIDAD * PD.cantidad)  AS "total"
FROM VENTA.PEDIDOSCABE PC
JOIN dbo.PEDIDOSDETA PD ON PC.IDPEDIDO=PD.IDPEDIDO
JOIN COMPRA.PRODUCTOS P ON PD.IDPRODUCTO=P.IDPRODUCTO
WHERE YEAR(FECHAPEDIDO)  = @Y
group by p.nombreproducto,month(pc.fechapedido),DATENAME(month, pc.fechapedido) as mes
order by 1,4 desc)
GO
-- EJECUTANDO LA FUNCION
SELECT * FROM DBO.productosmes(2014)
GO