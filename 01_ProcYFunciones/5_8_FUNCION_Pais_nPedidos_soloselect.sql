SELECT VENTA.paises.nombrepais, 
	Count(VENTA.pedidoscabe.idpedido) AS CuentaDeidpedido
FROM VENTA.paises INNER JOIN VENTA.clientes ON VENTA.paises.idpais = VENTA.clientes.idpais 
INNER JOIN VENTA.pedidoscabe ON VENTA.clientes.idcliente = VENTA.pedidoscabe.idcliente
GROUP BY VENTA.paises.nombrepais
HAVING Count(VENTA.pedidoscabe.idpedido)>1;