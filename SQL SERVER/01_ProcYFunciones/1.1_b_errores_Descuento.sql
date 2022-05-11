/*Negocios 2011
Añadir campo aVENTA.clientes llamado descuento de tipo decimal (5,2)
Dado un cliente , si se  le  ha vendido más de 1000 € poner 10 en descuento , sino si es mayor de 100 € poner 5 % y sino 0.
Comprobar y mostrar si todo ha ido correcto con @@ERROR */
	declare @descuento decimal(4,2)
	declare @total decimal = (SELECT 
		SUM(dbo.PEDIDOSDETA.PRECIOUNIDAD*dbo.PEDIDOSDETA.CANTIDAD)
		FROM dbo.PEDIDOSDETA 
			INNER JOIN VENTA.PEDIDOSCABE
			ON (dbo.PEDIDOSDETA.idpedido = VENTA.PEDIDOSCABE.idpedido)
		where VENTA.pedidosCABE.IDcliente = 'HGWIK')
	If @total > 1000
		set @descuento = 10
	else if @total > 100
		set @descuento = 5
	else
		set @descuento = 0
	UPDATE VENTA.clientes 
		set Descuento = @descuento 
		where idcliente = 'HGWIK'
	IF @@ERROR>0 
		PRINT 'Incorrecto'
	ELSE
	PRINT 'correcto'
	GO



