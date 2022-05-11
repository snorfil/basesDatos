SELECT top 1 VENTA.clientes.idcliente, VENTA.clientes.nombrecia
FROM VENTA.clientes, VENTA.pedidoscabe
WHERE (((Year([fechapedido]))=2013))
ORDER BY VENTA.pedidoscabe.fechapedido DESC;
