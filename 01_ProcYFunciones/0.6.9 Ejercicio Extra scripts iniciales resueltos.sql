/* 0.6  Mostrar los productos que se han vendido de un 
determinado proveedor que tenga el mismo nombre 
que el empleado 1*/
use negocios2011
declare @nomEmpleado varchar(50)
set @nomEmpleado = ''
set @nomEmpleado = (select nomempleado from RRHH.empleados 
where idempleado = 1)
select @nomEmpleado as 'Empleado con codigo 1' --solo lo muestro


SELECT productos.*,dbo.proveedores.*	
from compra.productos productos
inner join  dbo.proveedores on dbo.proveedores.idproveedor = productos.idproveedor 
inner join dbo.PEDIDOSDETA pedidosdeta on pedidosdeta.idproducto=productos.idproducto
 where dbo.proveedores.nomproveedor = @nomEmpleado ;

