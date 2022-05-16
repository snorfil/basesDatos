--- 4b con  y ajustar

CREATE TRIGGER controlpagos
on pagos
for insert,update 
as 
DECLARE @SPAGOS DECIMAL 
DECLARE @SPEDIDO DECIMAL 
DECLARE @PAGO DECIMAL 
DECLARE @PASADO DECIMAL 

SET @SPEDIDO = (select sum(cantidad*preciounidad)
    from pedidosdeta
	where idpedido = (select idpedido from inserted))
SET @PAGO=(select importe from inserted	)
SET @SPAGOS = (select sum(importe)from Pagos 
	where idpedido = (select idpedido from inserted))
	IF (@SPAGO>@SPEDIDO)
	begin
	 SET @PASADO=@SPAGOS-@SPEDIDO
	 UPDATE PAGOS SET importe =importe-@PASADO WHERE
	 idpedido=(select idpedido from inserted) 
	 AND fecha =(select fecha  from inserted)	
	 print 'La cantidad pagada supera el precio del pedido'
  END

-- ejemplo
-- suma pedido SPEDIDO = 5.000
-- suma pagos actual SPAGOS =  8.000
-- @PAGO Pago actual insertado 4.000
-- @PASADO=@SPAGOS-@SPEDIDO =   3.000
-- Maximo pago importe-@PASADO = 4000- 3000 = 1000
-- ahora la suma de pagos sería 8000-4000+1000= 5000 