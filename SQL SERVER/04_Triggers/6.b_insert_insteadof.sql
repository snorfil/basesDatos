use negocios2011 
go
alter  TRIGGER tr_pedidodeta_inser on dbo.pedidosdeta	
INSTEAD OF insert 
AS  
BEGIN
	if (SELECT count(*) FROM inserted i join compra.productos  p 
       on i.idproducto=p.idproducto)=0    
	BEGIN  
		INSERT INTO compra.productos 
		SELECT idproducto,'desconocido',26,25,0,0,cantidad,0
		FROM INSERTED
	END  
INSERT INTO dbo.PEDIDOSDETA 
select * 
FROM INSERTED
END
-----------------

