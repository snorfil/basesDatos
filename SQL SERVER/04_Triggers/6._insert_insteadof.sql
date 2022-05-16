ALTER TABLE [VENTA].[clientes]  WITH CHECK ADD CONSTRAINT [FK_clientes_pais] FOREIGN KEY([idpais])
REFERENCES [dbo].[paises] ([idpais])
GO
ALTER TABLE [VENTA].[clientes] CHECK CONSTRAINT [FK_clientes_pais]
GO

use negocios2011 
go
alter  TRIGGER tr_cliente_pais_inser ON venta.clientes
INSTEAD OF insert 
AS  
BEGIN
	if (SELECT count(*) FROM inserted i join dbo.paises  p 
       on i.idpais=p.idpais)=0    
	BEGIN  
		INSERT INTO dbo.paises 
		SELECT idpais,'desconocido'
		FROM INSERTED
	END  
INSERT INTO venta.clientes 
select * 
FROM INSERTED
END
-----------------
GO
INSERT INTO venta.clientes  VALUES ('21', 'nom21', 'dir21',  'pa1','12345',10);
   go
select * from venta.clientes  
GO
select * from dbo.paises  