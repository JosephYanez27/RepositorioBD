--store procedure (parametros de salida )
--crear un sp que calcule el area de u  circulo 
create or alter procedure sp_calcular_area_circulo
@radio float,
@area float output
as 
begin
 set @area=pi()*@radio*@radio

end;
go
declare @Resultado float
execute sp_calcular_area_circulo @radio=22.3,@area=@Resultado output
print 'El valor del area es:'+cast(@Resultado as varchar);
--obtener rl nombre de un  empleado dado
use Northwind

create or alter proc sp_obtener_informacion_empleado
@employeeid int =-1,
@apellido nvarchar(20) output,
@nombre nvarchar(10) output
as 
begin
if @employeeid <> -1
begin
select @nombre= FirstName,@apellido= LastName
from Employees
where EmployeeID=@employeeid
end
else
begin
print ('El Valor del empleado no es valido')
end
end
declare @firstname as nvarchar(10),
@lastname nvarchar(20)
exec sp_obtener_informacion_empleado @employeeid=1,@nombre=@firstname output,@apellido=@lastname output
print ('El nombre es: '+@firstname)
print ('El apellido es: '+@lastname)

select EmployeeID from Employees

                                                                                                       
declare @firstname as nvarchar(10),
@lastname nvarchar(20)
exec sp_obtener_informacion_empleado @employeeid=1,@nombre=@firstname output,@apellido=@lastname output
print ('El nombre es: '+@firstname)
print ('El apellido es: '+@lastname)

create or alter proc sp_guardar
@customerid nchar(5),
@fechafinal date,
@fechainicial date,
@total decimal(10,2) output
as 
begin
select @total= sum(od.UnitPrice*od.Quantity) from [Order Details]as od
inner join Orders as o
on od.OrderID=o.OrderID
where CustomerID= @customerid and 
OrderDate between @fechainicial and @fechafinal;
end 
