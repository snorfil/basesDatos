USE [negocios2011]
GO
CREATE trigger Precio2
   on [dbo].[pedidosdeta]
   for update 
   as
DECLARE @pped1 DECIMAL, @pped2 DECIMAL
if update(preciounidad) 
 BEGIN
   select @pped2=preciounidad  
	from inserted 
   select @pped1=preciounidad  
	from deleted    
 if ((abs(@pped2 - @pped1)*100/abs(@pped1))>50)
   BEGIN
   ROLLBACK TRANSACTION
   PRINT 'EL precio PRODUCTO no FUE cambiabo mayor 50%'
   END
 ELSE
   PRINT 'EL precio PRODUCTO FUE cambiabo EN LA BASE DE DATOS';
 END    