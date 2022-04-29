USE negocios2011
GO
alter FUNCTION dbo.ultimopedidoanio2(@ANIO INT) 
RETURNS @T TABLE (IDCLI CHAR(5),NOMCLI VARCHAR(30))
AS
BEGIN
declare @maxdate as date

select @maxdate=MAX(fechapedido)
from VENTA.pedidoscabe
where YEAR (fechapedido)=@ANIO
insert into @T 
select distinct c.idcliente, c.NOMBRECIA
from VENTA.clientes c join VENTA.pedidoscabe pc on c.idcliente = pc.idcliente
where pc.fechapedido = @maxdate
--Elegir una forma
IF @@ROWCOUNT = 0
   insert into @T VALUES ('0','No existe');
-- o bien:
if not exists(select * from @T )
	insert into @T VALUES ('0','No existe3');
-- o bien:
if (select count(*) from @T ) = 0 -- seria 0 pero he ñadido antes
	insert into @T VALUES ('0','No existe2');
RETURN

END
GO

SELECT * FROM dbo.ultimopedidoanio2(2012)
GO