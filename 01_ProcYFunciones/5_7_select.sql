SELECT p.nombreproducto ,
month(pc.fechapedido) as mes ,
sum(PD.PRECIOUNIDAD * PD.cantidad)  AS "total"
FROM VENTA.PEDIDOSCABE PC
JOIN dbo.PEDIDOSDETA PD ON PC.IDPEDIDO=PD.IDPEDIDO
JOIN COMPRA.PRODUCTOS P ON PD.IDPRODUCTO=P.IDPRODUCTO
WHERE YEAR(FECHAPEDIDO) = 2013
group by p.nombreproducto,month(pc.fechapedido)
order by 3 desc