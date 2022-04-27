create FUNCTION DBO.productosmes(@Y INT)
RETURNS TABLE
AS
-- Poner top 1000 , sino no funciona
RETURN 
(select top 10 * from 
(SELECT top 10 p.nombreproducto as nombrepro ,
month(pc.fechapedido) as mes ,
sum(PD.PRECIOUNIDAD * PD.cantidad)  AS "total"
FROM VENTA.PEDIDOSCABE PC
JOIN dbo.PEDIDOSDETA PD ON PC.IDPEDIDO=PD.IDPEDIDO
JOIN COMPRA.PRODUCTOS P ON PD.IDPRODUCTO=P.IDPRODUCTO
WHERE YEAR(FECHAPEDIDO)  = @Y
group by p.nombreproducto,month(pc.fechapedido)
order by 3 desc) as t
order by nombrepro)
GO
-- EJECUTANDO LA FUNCION
SELECT * FROM DBO.productosmes(2018)
GO