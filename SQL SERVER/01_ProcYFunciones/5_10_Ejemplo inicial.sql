/****** Script for SelectTopNRows command from SSMS  ******/
select * from 
(SELECT TOP 10 * 
  FROM [negocios2011].[VENTA].[pedidoscabe]
  order by [fechapedido]) as t
  order by idcliente