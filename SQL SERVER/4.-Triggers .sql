CREATE TABLE [dbo].[pagos](
	[idpedido] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[Importe] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_pagos] PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC,
	[fecha] ASC)

/* 4 Al insertar pago, comprobar que no supera el total del pedido*/
CREATE TRIGGER controlpagos
on pagos
for INSERT,update 
as 
if (select sum(importe)from pagos 
	where idpedido = (select idpedido from inserted))
	 >
	(select sum(cantidad*preciounidad*(1-descuento/100)) from pedidosdeta
	where idpedido = (select idpedido from inserted))
	begin
	rollback transaction
	print 'La cantidad pagada supera el Importe total del pedido'
	end
	else
	print 'Pago insertado con éxito'
