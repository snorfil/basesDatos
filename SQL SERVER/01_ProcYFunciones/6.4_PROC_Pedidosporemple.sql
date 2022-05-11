/*6.4 Reciba un Id Empleado. Nos devuelva el número de pedidos y la suma de las cantidades de los pedidos suyos.
Todo en un mes y año determinado , por defecto AÑO Y MES ACTUAL
*/
alter PROCEDURE USP_PEDIDOS_EMPLEADO
@IDEMP INT,
@ANIO INT = 0,
@MES INT = 0,
@NUMPED INT OUTPUT,
@CANPED INT OUTPUT
AS
if @ANIO = 0 SET @ANIO= YEAR(GETDATE() )
if @MES = 0 SET @MES= MONTH(GETDATE() )

SELECT @NUMPED = COUNT(*)
FROM VENTA.pedidoscabe pc
WHERE pc.idempleado = @IDEMP
AND YEAR(pc.fechapedido) = @ANIO
AND MONTH(pc.fechapedido) = @MES

SELECT @CANPED = SUM(pd.cantidad)
FROM VENTA.pedidoscabe pc
JOIN dbo.PEDIDOSDETA pd ON pc.idpedido = pd.idpedido
WHERE pc.idempleado = @IDEMP
AND YEAR(pc.fechapedido) = @ANIO
AND MONTH(pc.fechapedido) = @MES
GO
-- con todos se puede poner version reducida
DECLARE @NUMPED INT,@CANPED INT
EXEC USP_PEDIDOS_EMPLEADO 2, 2017,10,@NUMPED OUTPUT,
@CANPED OUTPUT
SELECT  @NUMPED , @CANPED
GO
-- con opcionales
DECLARE @NUMPED INT,@CANPED INT
EXEC USP_PEDIDOS_EMPLEADO
@IDEMP = 1,
@NUMPED = @NUMPED OUTPUT,
@CANPED = @CANPED OUTPUT
SELECT  @NUMPED , @CANPED
GO

-- truco Si hay opcionales se puede en orden asi
DECLARE @NUMPED INT,@CANPED INT
EXEC USP_PEDIDOS_EMPLEADO
1,0,0,@NUMPED OUTPUT, @CANPED OUTPUT
SELECT  @NUMPED , @CANPED
GO

-- error Si hay opcionales se puede en orden asi da error
DECLARE @NUMPED INT,@CANPED INT
EXEC USP_PEDIDOS_EMPLEADO
1, @NUMPED OUTPUT, @CANPED OUTPUT
SELECT  @NUMPED , @CANPED
GO
