USE negocios2011
GO
create FUNCTION dbo.productosmasvendidos2(@IDPAIS1 char(3),@IDPAIS2 char(3))
RETURNS TABLE as RETURN
(SELECT TOP 5 pro.idproducto , 
pro.nombreproducto 
,sum(PD.cantidad) 
FROM COMPRA.productos pro
JOIN dbo.PEDIDOSDETA PD ON pro.idproducto = PD.idproducto
JOIN VENTA.pedidoscabe PC ON PD.idpedido = PC.idpedido
join VENTA.clientes c on pc.idcliente=c.idcliente
WHERE C.idPAIS = @IDPAIS1 OR C.idPAIS = @IDPAIS2
group by pro.idproducto ,pro.nombreproducto
ORDER BY sum(PD.cantidad) DESC)

GO
SELECT * FROM dbo.productosmasvendidos2('esp')
GO
