-- Crear un sp que solicite un idde una categoria
-- y devuelva el promedio de los precios de sus productos
use Northwind
GO

Create or alter proc sp_solicitar_promedio_prod
@catego int -- Parametro de entrada 
AS
begin
select avg(UnitPrice) as 'Promedio precios de los productos'
from products
where CategoryID = @catego;
end
GO

exec sp_solicitar_promedio_prod 2

exec sp_solicitar_promedio_prod @catego = 5

exec sp_solicitar_promedio_prod @catego = 4