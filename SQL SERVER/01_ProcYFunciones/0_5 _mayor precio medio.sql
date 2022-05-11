--Dos Formas:
SELECT * 
FROM COMPRA.PRODUCTOS
where preciounidad > dbo.PRECIOPROMEDIO()
DECLARE @premed AS DECIMAL(10,2)
go
set @premed= dbo.[PRECIOPROMEDIO]()
SELECT * 
FROM COMPRA.PRODUCTOS
where preciounidad > @premed
go